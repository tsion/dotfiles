################################################################################
# PATH
################################################################################

# Filter out non-existent paths added by the system-wide NixOS shell config.
set -l existing_paths
for path in $PATH
  test -d $path && set -a existing_paths $path
end
set PATH $existing_paths

################################################################################
# Misc functions
################################################################################

function bash
  env DONT_EXEC_FISH=1 bash $argv
end

function dfh -w df
  df -h /{data{2,},} --output=size,used,avail,pcent,target $argv
end

function ffmpeg -w ffmpeg
  command ffmpeg -hide_banner $argv
end

function ffprobe -w ffprobe
  command ffprobe -hide_banner $argv
end

function o -w xdg-open
  xdg-open $argv
end

function rg -w rg
  command rg -i $argv
end

function dust -w dust
  command dust -br $argv
end

function vman -w man
  env MANPAGER='nvim +Man!' man $argv
end

function less -w less
  env LESS=R less $argv
end

# Useful for `deno types | lessb -lts`, for example (to view output as
# syntax-highlighted TypeScript).
function lessb -w bat
  bat $argv | less -R
end

function _ls
  set -l options
  if isatty stdout
    set options --color=always --format=across --group-directories-first
  end
  command ls $options $argv
end

function mkcd -a dir
  mkdir -p $dir
  cd $dir
end

function acd -a archive -w aunpack
  set -l tmp (mktemp /tmp/aunpack.XXXXXXXXXX)
  aunpack --quiet --save-outdir=$tmp $argv
  set -l dir (cat $tmp)
  [ $dir != '' -a -d $dir ]; and cd $dir
  rm -f $tmp
end

function bt -w broot
  broot -c :pt --height (math (tput lines) - 3) $argv
end

function fdt -w fd
  fd $argv | as-tree
end

function _v -w nvim
  if not set -q argv[1]
    nvim
    return $status
  end
  if not string match -rq '^(?<path>[^:]*)(:(?<line>\d+)(:(?<col>\d+))?)?$' -- $argv[1]
    echo "bad path '$argv[1]', expected <path>[:<line>[:<col>]]"
    return 1
  end
  nvim "+normal $line""gg$col|" $path $argv[2..]
end

function m
  if set -q MUT_PLATFORM
    string replace -r '^//' "$MUT_PLATFORM/" -- $argv
  else
    string join \n -- $argv
  end
end

function un-m
  if set -q MUT_PLATFORM
    string replace -r "^$MUT_PLATFORM/" '//' -- $argv
  else
    string join \n -- $argv
  end
end

function complete-m -a completer text
  set -l text (m $text)
  set -l rewrote $status
  set -l output ($completer $text)
  test $rewrote = 0 && set -l output (un-m $output)
  string join \n -- $output
end

function complete_path -a partial_path
  # Copying a hack from __fish_complete_directories, we call into Fish's default
  # path completion using any non-existent command name, e.g. a UUID. It is
  # unfortunate that Fish doesn't expose this as a proper API.
  complete -C "d720be8f-772d-486e-b1b0-fe3e7e589aaa $partial_path"
end

function complete_dir -a partial_path
  complete_path $partial_path | string match -r '.*/$'
end

complete m -f -a '(complete-m complete_path (commandline -t))'

function alias-m -a new_cmd old_cmd invocation completer
  echo "function $new_cmd -w $old_cmd; $invocation (m \$argv); end" | source
  complete $new_cmd -f -a "(complete-m $completer (commandline -t))"
end

alias-m c cd cd complete_dir
alias-m t tree tree complete_dir
alias-m v _v _v complete_path
alias-m ls ls _ls complete_path
alias-m ll ls '_ls -lh' complete_path
alias-m la ls '_ls -A' complete_path
alias-m b bat bat complete_path

################################################################################
# Nix functions
################################################################################

function nb -a attr
  nix-build --no-out-link '<nixpkgs>' -A $attr
end

function nr -w 'nix repl'
  nix repl "$XDG_CONFIG_HOME/nix/nix-repl.nix" $argv
end

function nrc -w nr
  nr '<nixpkgs/nixos>' $argv # access to `config`, my NixOS configuration
end

function nrh -w nr
  nr '<home-manager/modules>' \
    --argstr configuration ~/.config/nixpkgs/home.nix \
    --arg pkgs 'import <nixpkgs> {}' \
    $argv
end

function nrn -w nr
  nr '<nixpkgs>' $argv
end

function nt -w tree -a pkg
  set -e argv[1]
  set -l store_path (nb $pkg)
  and tree $store_path $argv
end

function nbr -w br -a pkg
  set -e argv[1]
  set -l store_path (nb $pkg)
  and br $argv $store_path
end

function nbins -a pkg
  set -l store_path (nb $pkg)
  and echo $store_path/bin
  and ll $store_path/bin/
end

function nwhich
  for arg in $argv
    readlink -f (which $arg)
  end
end

# Usage:
#   nu
#   nu a b
#   nu a b -- foo bar
# Equivalent:
#   nix-shell -p
#   nix-shell -p a b
#   nix-shell -p a b --run 'foo bar'
function nu
  if set -l split (contains -i -- -- $argv)
    set -l before (math $split - 1)
    set -l after  (math $split + 1)
    set -q argv[$before]; and set -l packages $argv[1..$before]
    set -q argv[$after];  and set -l command  $argv[$after..-1]
    nix-shell -p $packages --run "$command"
  else
    nix-shell -p $argv
  end
end

function nf
  nix-shell -p $argv --run 'exec fish'
end

# Usage:
#   nx foo -b baz
# Equivalent:
#   nu foo -- foo -b baz
function nx
  nix-shell -p $argv[1] --run "$argv"
end

function nsrc -a pkg
  acd (nb $pkg.src)
end

# Abbreviate nix store paths:
#   /nix/store/abcdefghijklmnopqrstuvwxyz012345-foo/bar
# becomes
#   /ns/abcdefg*-foo/bar
function filter-nix-paths
  ruby -pe '
    $_.gsub!(%r"/nix/store/(.*?)([a-z0-9]{32})-") do
      "/ns/#{$1}#{$2[0..6]}*-"
    end

    $_.gsub!(/Dec 31  1969 /, "")
    $_.gsub!(/Jan  1  1970 /, "")
  '
end

function nw -a pkgname
  set -l json (env pkgname=$pkgname nix-instantiate --eval --strict --json -E '
    let
      name = builtins.getEnv "pkgname";
      pkg = (import <nixpkgs> {})."${name}"; in
    {
      inherit (pkg) name;
      description = pkg.meta.description or "<no description>";
      homepage = pkg.meta.homepage or "<no homepage>";
    }
  ')
  and echo $json | jq -r '"\(.name) — \(.homepage)\n  \(.description)"'
end

################################################################################
# Rust aliases
################################################################################

function cb -w 'cargo build'
  cargo build $argv
end

function cr -w 'cargo run'
  cargo run $argv
end

function ct -w 'cargo test'
  cargo test $argv
end

function cbr -w 'cargo build'
  cargo build --release $argv
end

function crr -w 'cargo run'
  cargo run --release $argv
end

################################################################################
# youtube-dl aliases
################################################################################

function yt -w youtube-dl
  youtube-dl $argv
end

function yt-archive -w yt
  yt --config-location ~/.config/youtube-dl/config-archive $argv
end

function yt-audio -w yt
  yt --config-location ~/.config/youtube-dl/config-audio $argv
end

function yt-mp3 -w yt
  yt --config-location ~/.config/youtube-dl/config-mp3 $argv
end

# "n" for "native resolution"
function ytn -w yt
  yt --format='bestvideo[height<=?1440]+bestaudio/best' $argv
end

################################################################################
# Keybindings
################################################################################

# Set C-c to simply clear the command line.
bind \cc 'commandline ""'

################################################################################
# Prompt and title
################################################################################

# Keep track of /nix/store paths in PATH.
function update_nix_shell_pkg_list -v PATH
  set -l nix_paths
  for path in $PATH
    string match -q '/nix/store/*' $path || continue
    set -a nix_paths $path
  end

  if test (count $nix_paths) -eq 0
    set -gu NIX_SHELL_PKGS
  else
    set -gu NIX_SHELL_PKGS (nix show-derivation $nix_paths |
      jq -r 'to_entries[].value.env | .pname // (.name | split("-")[0])')
  end

  # Check if the entire set of nixpkgs stdenv packages is present, and if so,
  # abbreviate it.
  set -l stdenv gnumake bzip2 gzip bash xz gcc gnused coreutils gnutar \
    patchelf gcc-wrapper gnugrep bash gawk diffutils patch findutils glibc \
    binutils-wrapper binutils

  set -l pkgs_without_stdenv $NIX_SHELL_PKGS
  for pkg in $stdenv
    set -l i (contains -i $pkg $pkgs_without_stdenv) || return
    set -e pkgs_without_stdenv[$i]
  end

  set -gu NIX_SHELL_PKGS «stdenv» $pkgs_without_stdenv
end
update_nix_shell_pkg_list

set fish_prompt_first 1
function fish_prompt
  set -l last_status $status

  if [ $fish_prompt_first = 0 ]
    echo
  else
    set fish_prompt_first 0
  end

  # Clear the current line with a terminal escape code to avoid drawing issues
  # with Alt-{Left,Right} working directory history commands.
  echo -en '\e[2K'

  set -l prompt_bgcolor 262626
  set_color -b $prompt_bgcolor

  set_color $prompt_bgcolor
  echo -n '['
  set_color brblue
  echo -n (solson_prompt_pwd)

  if set -q SSH_TTY
    set_color $prompt_bgcolor
    echo -n '|'
    set_color brcyan
    echo -n (prompt_hostname)
  end

  if test (count $NIX_SHELL_PKGS) -gt 0
    set -l pkgs $NIX_SHELL_PKGS
    set -l output

    if set -l i (contains -i «stdenv» $pkgs)
      set -e pkgs[$i]
      set -a output «stdenv»
    end

    if test (count $pkgs) -gt 3
      set -a output (count $pkgs)…
    else
      set -a output $pkgs
    end

    set_color $prompt_bgcolor
    echo -n '|'
    set_color brmagenta
    echo -n "{$output}"
  end

  # FIXME(solson): This is a ridiculous hack to make fish_git_prompt not reset
  # the background color.
  if not set -q ___fish_git_prompt_init
    fish_git_prompt > /dev/null
    set -g ___fish_git_prompt_color_branch_done ''
    set -g ___fish_git_prompt_color_branch_detached_done ''
    set -g ___fish_git_prompt_color_dirtystate_done ''
    set -g ___fish_git_prompt_color_stagedstate_done ''
    set -g ___fish_git_prompt_color_stashstate_done ''
    set -g ___fish_git_prompt_color_untrackedfiles_done ''
    set -g ___fish_git_prompt_color_upstream_done ''
  end
  set_color $prompt_bgcolor
  fish_git_prompt "|%s"

  set_color $prompt_bgcolor
  echo -n ']'
  set_color normal

  # If the last command took longer than 5 seconds, print its execution time.
  if [ "$CMD_DURATION" -gt 5000 ]
    echo -n ' '
    set_color yellow
    echo -n (format-duration $CMD_DURATION)
  end

  if [ $last_status != 0 ]
    echo -n ' '
    set_color red
    echo -n $last_status
  end

  echo
  set_color brblack
  echo -n '> '
  set_color normal
end

set __fish_git_prompt_describe_style default
set __fish_git_prompt_showcolorhints 1
set __fish_git_prompt_showdirtystate 1
set __fish_git_prompt_showstashstate 1
set __fish_git_prompt_showuntrackedfiles 1
set __fish_git_prompt_showupstream informative

set __fish_git_prompt_char_dirtystate '~'
set __fish_git_prompt_char_invalidstate '✖'
set __fish_git_prompt_char_stagedstate '●'
set __fish_git_prompt_char_stashstate '⚑'
set __fish_git_prompt_char_stateseparator ''
set __fish_git_prompt_char_untrackedfiles '?'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'
set __fish_git_prompt_char_upstream_diverged '↕'

set __fish_git_prompt_color_dirtystate red
set __fish_git_prompt_color_invalidstate brred
set __fish_git_prompt_color_stagedstate green
set __fish_git_prompt_color_stashstate yellow
set __fish_git_prompt_color_untrackedfiles red
set __fish_git_prompt_color_upstream white

function fish_title
  set -q SSH_TTY && echo -n '['(prompt_hostname)'] '
  echo (solson_prompt_pwd)" : $_"
end

function solson_prompt_pwd
  # TODO: Generalize this to multiple worktrees of /mut/platform* somehow.
  string replace -rf '^/mut/platform(/|$)' // $PWD
  or prompt_pwd
end

################################################################################
# Misc
################################################################################

# Disable startup message.
set fish_greeting ""

# Just use regular man pages instead of Fish's weird postprocessing.
function __fish_print_help
  man $argv
end

# Screen clearing that handles my newline-between-prompts setup better.
bind \cl 'set fish_prompt_first 1; command clear -x; commandline -f repaint'

function clear -w clear
  set fish_prompt_first 1
  command clear $argv
end

################################################################################
# Colours
################################################################################

# Enable 24-bit color in Konsole.
if set -q KONSOLE_VERSION
  set fish_term24bit 1
end

set fish_color_autosuggestion brblack
set fish_color_command brmagenta --bold
set fish_color_comment brblack
set fish_color_cwd brblue
set fish_color_end brblack
set fish_color_error red
set fish_color_escape brblue
set fish_color_history_current --bold
set fish_color_normal normal
set fish_color_operator bryellow
set fish_color_param normal
set fish_color_quote brblue
set fish_color_redirection brgreen
set fish_color_search_match ''
set fish_color_valid_path ''
set fish_pager_color_description bryellow
set fish_pager_color_prefix ''
set fish_pager_color_progress brwhite

################################################################################
# Autojump
################################################################################

source ~/.config/fish/autojump.fish

################################################################################
# Direnv
################################################################################

direnv hook fish | source

################################################################################
# Fzf - https://github.com/junegunn/fzf
################################################################################

set -x FZF_CTRL_T_COMMAND 'fd --type f . $dir'
set -x FZF_CTRL_T_OPTS '--preview "bat {} --line-range :500"'
set -x FZF_ALT_C_COMMAND 'fd --type d . $dir'
set -x FZF_ALT_C_OPTS '--preview "tree -C {} | head -200"'

# Bind an alternative for C-t on C-Space.
# See here for why it uses `-k nul`: https://github.com/fish-shell/fish-shell/issues/3189
# And see here for why it uses `fish_user_key_bindings`: https://github.com/fish-shell/fish-shell/issues/7922#issuecomment-817353535
function fish_user_key_bindings
  bind -k nul fzf-file-widget
end

################################################################################
# Extra config not checked into source control
################################################################################

begin
  set -l f (status dirname)/private_config.fish
  test -f $f && source $f
end
