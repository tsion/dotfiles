#!/usr/bin/env -S deno run
import { format_duration } from "./lib.ts";
console.log(format_duration(parseInt(Deno.args[0] ?? 0)));
