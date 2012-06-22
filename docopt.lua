
--- Simple OO system with inheritance.
-- @param base (optional) Base class to inherit methods from.
-- @param init Initialization function for the class.
-- Compatible with Lua 5.1 (not 5.0).
-- Adapted from: http://lua-users.org/wiki/SimpleLuaClasses
local function class(base, init)
    local c = {}    -- a new class instance
    if not init and type(base) == 'function' then
        init = base
        base = nil
    elseif type(base) == 'table' then
        -- our new class is a shallow copy of the base class!
        for i,v in pairs(base) do
            c[i] = v
        end
        c._base = base
    end
    -- the class will be the metatable for all its objects,
    -- and they will look up their methods in it.
    c.__index = c

    -- expose a constructor which can be called by <classname>(<args>)
    local mt = {}
    mt.__call = function(class_tbl, ...)
        local obj = {}
        setmetatable(obj,c)
        if init then
            init(obj,...)
        else
            -- make sure that any stuff from the base class is initialized!
            if base and base.init then
                base.init(obj, ...)
            end
        end
        return obj
    end
    c.init = init
    c.is_a = function(self, other_class)
        local m = getmetatable(self)
        while m do
            if m == other_class then return true end
            m = m._base
        end
        return false
    end
    setmetatable(c, mt)
    return c
end
--- Process command-line arguments based on help string.
--
-- docopt() will parse the help message to see what the value usage cases
-- are, and also to see the options.  Then it will parse the list of
-- command line arguments to validate them.
--
-- If the arguments are in a correct form, they are returned
-- as a structured table.  Otherwise (if a non-existent argument is used
-- for example) docopt will print the help message and exit.
--
-- @param help_message Command line help text which shows the usage and
-- lists all the options available.
-- @param arg_list (optional) A list of command line arguments to
-- process. Defaults to the global 'arg' if arg_list is nil.
-- @param version (optional) The version of the program.
-- @param default_help (optional) By default, docopt() will print the
-- doc_string and exit if '-h' or '--help' is the only command-line
-- argument.  If default_help is false, docopt() will just return
-- normally with the '-h' option set to true.
-- @return A table with all the arguments as string keys if the use of the
-- arguments is valid.
local function docopt(help_message, arg_list, version, default_help)
end


return {
    docopt = docopt,
}
