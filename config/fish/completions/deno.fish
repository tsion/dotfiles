complete -c deno -n "__fish_use_subcommand" -s L -l log-level -d 'Set log level' -r -f -a "debug info"
complete -c deno -n "__fish_use_subcommand" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_use_subcommand" -s h -l help -d 'Prints help information'
complete -c deno -n "__fish_use_subcommand" -s V -l version -d 'Prints version information'
complete -c deno -n "__fish_use_subcommand" -f -a "bundle" -d 'Bundle module and dependencies into single file'
complete -c deno -n "__fish_use_subcommand" -f -a "cache" -d 'Cache the dependencies'
complete -c deno -n "__fish_use_subcommand" -f -a "completions" -d 'Generate shell completions'
complete -c deno -n "__fish_use_subcommand" -f -a "doc" -d 'Show documentation for a module'
complete -c deno -n "__fish_use_subcommand" -f -a "eval" -d 'Eval script'
complete -c deno -n "__fish_use_subcommand" -f -a "fmt" -d 'Format source files'
complete -c deno -n "__fish_use_subcommand" -f -a "info" -d 'Show info about cache or info related to source file'
complete -c deno -n "__fish_use_subcommand" -f -a "install" -d 'Install script as an executable'
complete -c deno -n "__fish_use_subcommand" -f -a "lint" -d 'Lint source files'
complete -c deno -n "__fish_use_subcommand" -f -a "repl" -d 'Read Eval Print Loop'
complete -c deno -n "__fish_use_subcommand" -f -a "run" -d 'Run a program given a filename or url to the module. Use \'-\' as a filename to read from stdin.'
complete -c deno -n "__fish_use_subcommand" -f -a "test" -d 'Run tests'
complete -c deno -n "__fish_use_subcommand" -f -a "types" -d 'Print runtime TypeScript declarations'
complete -c deno -n "__fish_use_subcommand" -f -a "upgrade" -d 'Upgrade deno executable to given version'
complete -c deno -n "__fish_use_subcommand" -f -a "help" -d 'Prints this message or the help of the given subcommand(s)'
complete -c deno -n "__fish_seen_subcommand_from bundle" -l lock -d 'Check the specified lock file'
complete -c deno -n "__fish_seen_subcommand_from bundle" -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n "__fish_seen_subcommand_from bundle" -l importmap -d 'UNSTABLE: Load import map file'
complete -c deno -n "__fish_seen_subcommand_from bundle" -s c -l config -d 'Load tsconfig.json configuration file'
complete -c deno -n "__fish_seen_subcommand_from bundle" -s L -l log-level -d 'Set log level' -r -f -a "debug info"
complete -c deno -n "__fish_seen_subcommand_from bundle" -l lock-write -d 'Write lock file. Use with --lock.'
complete -c deno -n "__fish_seen_subcommand_from bundle" -l unstable -d 'Enable unstable APIs'
complete -c deno -n "__fish_seen_subcommand_from bundle" -s h -l help -d 'Prints help information'
complete -c deno -n "__fish_seen_subcommand_from bundle" -s V -l version -d 'Prints version information'
complete -c deno -n "__fish_seen_subcommand_from bundle" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_seen_subcommand_from cache" -s r -l reload -d 'Reload source code cache (recompile TypeScript)'
complete -c deno -n "__fish_seen_subcommand_from cache" -l lock -d 'Check the specified lock file'
complete -c deno -n "__fish_seen_subcommand_from cache" -l importmap -d 'UNSTABLE: Load import map file'
complete -c deno -n "__fish_seen_subcommand_from cache" -s c -l config -d 'Load tsconfig.json configuration file'
complete -c deno -n "__fish_seen_subcommand_from cache" -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n "__fish_seen_subcommand_from cache" -s L -l log-level -d 'Set log level' -r -f -a "debug info"
complete -c deno -n "__fish_seen_subcommand_from cache" -l lock-write -d 'Write lock file. Use with --lock.'
complete -c deno -n "__fish_seen_subcommand_from cache" -l unstable -d 'Enable unstable APIs'
complete -c deno -n "__fish_seen_subcommand_from cache" -l no-check -d 'Skip type checking modules'
complete -c deno -n "__fish_seen_subcommand_from cache" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_seen_subcommand_from cache" -s h -l help -d 'Prints help information'
complete -c deno -n "__fish_seen_subcommand_from cache" -s V -l version -d 'Prints version information'
complete -c deno -n "__fish_seen_subcommand_from cache" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_seen_subcommand_from completions" -s L -l log-level -d 'Set log level' -r -f -a "debug info"
complete -c deno -n "__fish_seen_subcommand_from completions" -s h -l help -d 'Prints help information'
complete -c deno -n "__fish_seen_subcommand_from completions" -s V -l version -d 'Prints version information'
complete -c deno -n "__fish_seen_subcommand_from completions" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_seen_subcommand_from doc" -s r -l reload -d 'Reload source code cache (recompile TypeScript)'
complete -c deno -n "__fish_seen_subcommand_from doc" -s L -l log-level -d 'Set log level' -r -f -a "debug info"
complete -c deno -n "__fish_seen_subcommand_from doc" -l unstable -d 'Enable unstable APIs'
complete -c deno -n "__fish_seen_subcommand_from doc" -l json -d 'Output documentation in JSON format.'
complete -c deno -n "__fish_seen_subcommand_from doc" -l private -d 'Output private documentation'
complete -c deno -n "__fish_seen_subcommand_from doc" -s h -l help -d 'Prints help information'
complete -c deno -n "__fish_seen_subcommand_from doc" -s V -l version -d 'Prints version information'
complete -c deno -n "__fish_seen_subcommand_from doc" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_seen_subcommand_from eval" -l inspect -d 'activate inspector on host:port (default: 127.0.0.1:9229)'
complete -c deno -n "__fish_seen_subcommand_from eval" -l inspect-brk -d 'activate inspector on host:port and break at start of user script'
complete -c deno -n "__fish_seen_subcommand_from eval" -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n "__fish_seen_subcommand_from eval" -l v8-flags -d 'Set V8 command line options. For help: --v8-flags=--help'
complete -c deno -n "__fish_seen_subcommand_from eval" -s L -l log-level -d 'Set log level' -r -f -a "debug info"
complete -c deno -n "__fish_seen_subcommand_from eval" -l unstable -d 'Enable unstable APIs'
complete -c deno -n "__fish_seen_subcommand_from eval" -s T -l ts -d 'Treat eval input as TypeScript'
complete -c deno -n "__fish_seen_subcommand_from eval" -s p -l print -d 'print result to stdout'
complete -c deno -n "__fish_seen_subcommand_from eval" -s h -l help -d 'Prints help information'
complete -c deno -n "__fish_seen_subcommand_from eval" -s V -l version -d 'Prints version information'
complete -c deno -n "__fish_seen_subcommand_from eval" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_seen_subcommand_from fmt" -s L -l log-level -d 'Set log level' -r -f -a "debug info"
complete -c deno -n "__fish_seen_subcommand_from fmt" -l check -d 'Check if the source files are formatted.'
complete -c deno -n "__fish_seen_subcommand_from fmt" -s h -l help -d 'Prints help information'
complete -c deno -n "__fish_seen_subcommand_from fmt" -s V -l version -d 'Prints version information'
complete -c deno -n "__fish_seen_subcommand_from fmt" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_seen_subcommand_from info" -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n "__fish_seen_subcommand_from info" -s L -l log-level -d 'Set log level' -r -f -a "debug info"
complete -c deno -n "__fish_seen_subcommand_from info" -l no-check -d 'Skip type checking modules'
complete -c deno -n "__fish_seen_subcommand_from info" -l unstable -d 'Enable unstable APIs'
complete -c deno -n "__fish_seen_subcommand_from info" -l json -d 'Outputs the information in JSON format'
complete -c deno -n "__fish_seen_subcommand_from info" -s h -l help -d 'Prints help information'
complete -c deno -n "__fish_seen_subcommand_from info" -s V -l version -d 'Prints version information'
complete -c deno -n "__fish_seen_subcommand_from info" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_seen_subcommand_from install" -l allow-read -d 'Allow file system read access'
complete -c deno -n "__fish_seen_subcommand_from install" -l allow-write -d 'Allow file system write access'
complete -c deno -n "__fish_seen_subcommand_from install" -l allow-net -d 'Allow network access'
complete -c deno -n "__fish_seen_subcommand_from install" -s n -l name -d 'Executable file name'
complete -c deno -n "__fish_seen_subcommand_from install" -l root -d 'Installation root'
complete -c deno -n "__fish_seen_subcommand_from install" -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n "__fish_seen_subcommand_from install" -s c -l config -d 'Load tsconfig.json configuration file'
complete -c deno -n "__fish_seen_subcommand_from install" -s L -l log-level -d 'Set log level' -r -f -a "debug info"
complete -c deno -n "__fish_seen_subcommand_from install" -l allow-env -d 'Allow environment access'
complete -c deno -n "__fish_seen_subcommand_from install" -l allow-run -d 'Allow running subprocesses'
complete -c deno -n "__fish_seen_subcommand_from install" -l allow-plugin -d 'Allow loading plugins'
complete -c deno -n "__fish_seen_subcommand_from install" -l allow-hrtime -d 'Allow high resolution time measurement'
complete -c deno -n "__fish_seen_subcommand_from install" -s A -l allow-all -d 'Allow all permissions'
complete -c deno -n "__fish_seen_subcommand_from install" -s f -l force -d 'Forcefully overwrite existing installation'
complete -c deno -n "__fish_seen_subcommand_from install" -l unstable -d 'Enable unstable APIs'
complete -c deno -n "__fish_seen_subcommand_from install" -s h -l help -d 'Prints help information'
complete -c deno -n "__fish_seen_subcommand_from install" -s V -l version -d 'Prints version information'
complete -c deno -n "__fish_seen_subcommand_from install" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_seen_subcommand_from lint" -s L -l log-level -d 'Set log level' -r -f -a "debug info"
complete -c deno -n "__fish_seen_subcommand_from lint" -l unstable -d 'Enable unstable APIs'
complete -c deno -n "__fish_seen_subcommand_from lint" -l rules -d 'List available rules'
complete -c deno -n "__fish_seen_subcommand_from lint" -s h -l help -d 'Prints help information'
complete -c deno -n "__fish_seen_subcommand_from lint" -s V -l version -d 'Prints version information'
complete -c deno -n "__fish_seen_subcommand_from lint" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_seen_subcommand_from repl" -l inspect -d 'activate inspector on host:port (default: 127.0.0.1:9229)'
complete -c deno -n "__fish_seen_subcommand_from repl" -l inspect-brk -d 'activate inspector on host:port and break at start of user script'
complete -c deno -n "__fish_seen_subcommand_from repl" -l v8-flags -d 'Set V8 command line options. For help: --v8-flags=--help'
complete -c deno -n "__fish_seen_subcommand_from repl" -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n "__fish_seen_subcommand_from repl" -s L -l log-level -d 'Set log level' -r -f -a "debug info"
complete -c deno -n "__fish_seen_subcommand_from repl" -l unstable -d 'Enable unstable APIs'
complete -c deno -n "__fish_seen_subcommand_from repl" -s h -l help -d 'Prints help information'
complete -c deno -n "__fish_seen_subcommand_from repl" -s V -l version -d 'Prints version information'
complete -c deno -n "__fish_seen_subcommand_from repl" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_seen_subcommand_from run" -l inspect -d 'activate inspector on host:port (default: 127.0.0.1:9229)'
complete -c deno -n "__fish_seen_subcommand_from run" -l inspect-brk -d 'activate inspector on host:port and break at start of user script'
complete -c deno -n "__fish_seen_subcommand_from run" -l allow-read -d 'Allow file system read access'
complete -c deno -n "__fish_seen_subcommand_from run" -l allow-write -d 'Allow file system write access'
complete -c deno -n "__fish_seen_subcommand_from run" -l allow-net -d 'Allow network access'
complete -c deno -n "__fish_seen_subcommand_from run" -l importmap -d 'UNSTABLE: Load import map file'
complete -c deno -n "__fish_seen_subcommand_from run" -s r -l reload -d 'Reload source code cache (recompile TypeScript)'
complete -c deno -n "__fish_seen_subcommand_from run" -s c -l config -d 'Load tsconfig.json configuration file'
complete -c deno -n "__fish_seen_subcommand_from run" -l lock -d 'Check the specified lock file'
complete -c deno -n "__fish_seen_subcommand_from run" -l v8-flags -d 'Set V8 command line options. For help: --v8-flags=--help'
complete -c deno -n "__fish_seen_subcommand_from run" -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n "__fish_seen_subcommand_from run" -l seed -d 'Seed Math.random()'
complete -c deno -n "__fish_seen_subcommand_from run" -s L -l log-level -d 'Set log level' -r -f -a "debug info"
complete -c deno -n "__fish_seen_subcommand_from run" -l allow-env -d 'Allow environment access'
complete -c deno -n "__fish_seen_subcommand_from run" -l allow-run -d 'Allow running subprocesses'
complete -c deno -n "__fish_seen_subcommand_from run" -l allow-plugin -d 'Allow loading plugins'
complete -c deno -n "__fish_seen_subcommand_from run" -l allow-hrtime -d 'Allow high resolution time measurement'
complete -c deno -n "__fish_seen_subcommand_from run" -s A -l allow-all -d 'Allow all permissions'
complete -c deno -n "__fish_seen_subcommand_from run" -l unstable -d 'Enable unstable APIs'
complete -c deno -n "__fish_seen_subcommand_from run" -l lock-write -d 'Write lock file. Use with --lock.'
complete -c deno -n "__fish_seen_subcommand_from run" -l no-check -d 'Skip type checking modules'
complete -c deno -n "__fish_seen_subcommand_from run" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_seen_subcommand_from run" -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n "__fish_seen_subcommand_from run" -s h -l help -d 'Prints help information'
complete -c deno -n "__fish_seen_subcommand_from run" -s V -l version -d 'Prints version information'
complete -c deno -n "__fish_seen_subcommand_from run" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_seen_subcommand_from test" -l inspect -d 'activate inspector on host:port (default: 127.0.0.1:9229)'
complete -c deno -n "__fish_seen_subcommand_from test" -l inspect-brk -d 'activate inspector on host:port and break at start of user script'
complete -c deno -n "__fish_seen_subcommand_from test" -l allow-read -d 'Allow file system read access'
complete -c deno -n "__fish_seen_subcommand_from test" -l allow-write -d 'Allow file system write access'
complete -c deno -n "__fish_seen_subcommand_from test" -l allow-net -d 'Allow network access'
complete -c deno -n "__fish_seen_subcommand_from test" -l importmap -d 'UNSTABLE: Load import map file'
complete -c deno -n "__fish_seen_subcommand_from test" -s r -l reload -d 'Reload source code cache (recompile TypeScript)'
complete -c deno -n "__fish_seen_subcommand_from test" -s c -l config -d 'Load tsconfig.json configuration file'
complete -c deno -n "__fish_seen_subcommand_from test" -l lock -d 'Check the specified lock file'
complete -c deno -n "__fish_seen_subcommand_from test" -l v8-flags -d 'Set V8 command line options. For help: --v8-flags=--help'
complete -c deno -n "__fish_seen_subcommand_from test" -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n "__fish_seen_subcommand_from test" -l seed -d 'Seed Math.random()'
complete -c deno -n "__fish_seen_subcommand_from test" -l filter -d 'Run tests with this string or pattern in the test name'
complete -c deno -n "__fish_seen_subcommand_from test" -s L -l log-level -d 'Set log level' -r -f -a "debug info"
complete -c deno -n "__fish_seen_subcommand_from test" -l allow-env -d 'Allow environment access'
complete -c deno -n "__fish_seen_subcommand_from test" -l allow-run -d 'Allow running subprocesses'
complete -c deno -n "__fish_seen_subcommand_from test" -l allow-plugin -d 'Allow loading plugins'
complete -c deno -n "__fish_seen_subcommand_from test" -l allow-hrtime -d 'Allow high resolution time measurement'
complete -c deno -n "__fish_seen_subcommand_from test" -s A -l allow-all -d 'Allow all permissions'
complete -c deno -n "__fish_seen_subcommand_from test" -l unstable -d 'Enable unstable APIs'
complete -c deno -n "__fish_seen_subcommand_from test" -l lock-write -d 'Write lock file. Use with --lock.'
complete -c deno -n "__fish_seen_subcommand_from test" -l no-check -d 'Skip type checking modules'
complete -c deno -n "__fish_seen_subcommand_from test" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_seen_subcommand_from test" -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n "__fish_seen_subcommand_from test" -l failfast -d 'Stop on first error'
complete -c deno -n "__fish_seen_subcommand_from test" -l allow-none -d 'Don\'t return error code if no test files are found'
complete -c deno -n "__fish_seen_subcommand_from test" -s h -l help -d 'Prints help information'
complete -c deno -n "__fish_seen_subcommand_from test" -s V -l version -d 'Prints version information'
complete -c deno -n "__fish_seen_subcommand_from test" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_seen_subcommand_from types" -s L -l log-level -d 'Set log level' -r -f -a "debug info"
complete -c deno -n "__fish_seen_subcommand_from types" -l unstable -d 'Enable unstable APIs'
complete -c deno -n "__fish_seen_subcommand_from types" -s h -l help -d 'Prints help information'
complete -c deno -n "__fish_seen_subcommand_from types" -s V -l version -d 'Prints version information'
complete -c deno -n "__fish_seen_subcommand_from types" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_seen_subcommand_from upgrade" -l version -d 'The version to upgrade to'
complete -c deno -n "__fish_seen_subcommand_from upgrade" -l output -d 'The path to output the updated version to'
complete -c deno -n "__fish_seen_subcommand_from upgrade" -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n "__fish_seen_subcommand_from upgrade" -s L -l log-level -d 'Set log level' -r -f -a "debug info"
complete -c deno -n "__fish_seen_subcommand_from upgrade" -l dry-run -d 'Perform all checks without replacing old exe'
complete -c deno -n "__fish_seen_subcommand_from upgrade" -s f -l force -d 'Replace current exe even if not out-of-date'
complete -c deno -n "__fish_seen_subcommand_from upgrade" -s h -l help -d 'Prints help information'
complete -c deno -n "__fish_seen_subcommand_from upgrade" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_seen_subcommand_from help" -s L -l log-level -d 'Set log level' -r -f -a "debug info"
complete -c deno -n "__fish_seen_subcommand_from help" -s h -l help -d 'Prints help information'
complete -c deno -n "__fish_seen_subcommand_from help" -s V -l version -d 'Prints version information'
complete -c deno -n "__fish_seen_subcommand_from help" -s q -l quiet -d 'Suppress diagnostic output'
