
local C     = require 'pl.comprehension' . new()
local class = require 'pl.class'



--
-- Pattern class.
--
local Pattern = class(  function(self, name, ...)
                            self.name = assert(name)
                            self.children = {...}
                        end)

function Pattern:__eq(other)
    return __tostring(self) == __tostring(other)
end

function Pattern:__tostring()
    local children_repr = ""
    for i, child in pairs(self.children) do
        children_repr = children_repr .. tostring(child)
    end
    return string.format("%s(%s)", self.name, children_repr)
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
