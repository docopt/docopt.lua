# Lua Port of the docopt Command Line Processor

[docopt](http://docopt.org) creates _beautiful_ command-line interfaces.

docopt is a parser for program command line help messages.  It will use
the help message itself to validate the arguments passed into the
program.  And from that it will generate a handy table of the
arguments.  Create the nicely formatted help message, and then let
docopt take care of the rest!

This is the [Lua](http://www.lua.org) port of the original Python
implementation.

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


# Dependencies

docopt.lua does not require any external libraries, and is compatible
with Lua 5.1 and 5.2.

# Copyright and License

This project is distributed under the 
[MIT License](http://www.opensource.org/licenses/mit-license.html), 
reproduced below:
```
Copyright (c) 2012 Vladimir Keleshev <vladimir@keleshev.com>, 
                   James Graves <james.c.graves.jr@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
``` 
