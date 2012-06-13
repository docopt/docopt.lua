#!/usr/bin/env lua
local BU = require "basic_utils"
local DOC = require "docopt"
local nf_help = [[
Naval Fate - a fun new game you play only via the command line!

Usage:
  naval_fate.lua ship new <name>...
  naval_fate.lua ship [<name>] move <x> <y> [--speed=<kn>]
  naval_fate.lua ship shoot <x> <y>
  naval_fate.lua mine (set|remove) <x> <y> [--moored|--drifting]
  naval_fate.lua -h | --help
  naval_fate.lua --version

Options:
  -h --help     Show this screen.
  --version     Show version.
  --speed=<kn>  Speed in knots [default: 10].
  --moored      Moored (anchored) mine.
  --drifting    Drifting mine.

]]

local arguments = DOC.docopt(nf_help, arg, "V2.3")
BU.table_print(arguments)
