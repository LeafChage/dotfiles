--- File Module
local File = {}

--- @param name string
--- @return boolean
File.exist = function(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

--- @param name string
--- @return string, boolean
File.read_all = function(name)
    local f = io.open(name, "rb")
    if f == nil then
        return "", false
    end

    local content = f:read("*all")
    f:close()
    return content, true
end

return File
