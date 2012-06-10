# Lua Port of the docopt Command Line Processor

See http://docopt.org for details.

# Basic Usage

Put the docopt.lua file in your Lua modules search path.

Then in your main code (in this case `simple_find.lua`) put:

```lua
local DOC = require 'docopt'  -- Any local name is fine.

local argument_help = [[
Simple Find Command.

Usage:
  simple_find.lua dir [<dirname>]
  simple_find.lua file [filename]

Options:
  -h --help         Show this screen.
  --version         Show the program version.
  -r --recursive    Recursively search subdirectories too.
]]

local processed_args = DOC.docopt(argument_help, arg)

if processsed_args.dir then
    -- Directory name search
elseif processsed_args.file then
    -- File name search
end
```


