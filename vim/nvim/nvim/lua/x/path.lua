--- Path Module
local Path = {}

--- @param ... string
--- @return string
Path.join = function(...)
    return table.concat({ ... }, "/")
end

return Path
