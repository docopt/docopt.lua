--[[
    basic_utils.lua

    This is a handy set of basic utility functions.

    Some functions, like round(), ought to have been included in the
    basic Lua distribution.  Others, like table_print() are quite useful
    for quick debugging.

]]--

require "table"
require "math"


--[[
    Print anything - including nested tables

    This is originally from: 

    http://lua-users.org/wiki/TableSerialization

    Original author is unknown, I assume this code in in the public domain.
]]--
local function table_print (tt, indent, done)
  done = done or {}
  indent = indent or 0
  if type(tt) == "table" then
    for key, value in pairs (tt) do
      io.write(string.rep (" ", indent)) -- indent it
      if type (value) == "table" and not done [value] then
        done [value] = true
        io.write(string.format("[%s] => table\n", tostring (key)));
        io.write(string.rep (" ", indent+4)) -- indent it
        io.write("(\n");
        table_print (value, indent + 7, done)
        io.write(string.rep (" ", indent+4)) -- indent it
        io.write(")\n");
      else
        io.write(string.format("[%s] => %s\n",
            tostring (key), tostring(value)))
      end
    end
  else
    io.write(tt .. "\n")
  end
end


--[[=================================================================

                            Iterators

=================================================================]]--

--[[
    apairs()

    Easy iteration over a variable number of arguments
    to a function.

    Example Usage:

    function test_func(...)
        for i,a in apairs(...) do print(i, a) end
    end

    test_func("foo", nil, 32, nil)
    
    will print:

    1       foo
    2       nil
    3       32
    4       nil

    Code by David Manura <dm.lua@math2.org>
]]--

local function apairs_helper(a, i)
    if i < a.n then 
        return i + 1, a[i + 1] 
    end
end

local function apairs(...)
    -- iterator function, context, start value
    return apairs_helper, {n=select('#', ...), ...}, 0
end


--[[
    round()

    Round to nearest number, by default to nearest integer.

    Optional 2nd argument for number of decimal places.

    For example:

    round(3.416, 2) ==> 2.42
    round(-4.51)    ==> -5
]]--
local function round(num, decimal_places) 
    local mult = 10^(decimal_places or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- printf
local function printf(...) io.write(string.format(...)) end


local function global_import(...)
    for k, v in pairs(require(...)) do _G[k] = v end
end

return {
    printf          = printf,
    apairs          = apairs,
    round           = round,
    table_print     = table_print,
    global_import   = global_import,
}
