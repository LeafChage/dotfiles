---@param filepath string
---@return boolean
local includePyright = function(filepath)
    local file = io.open(filepath, "r")
    if file == nil then
        return false
    end

    for line in file:lines() do
        if line:find("pyright", 1, true) then
            file:close()
            return true
        end
    end

    file:close()
    return false
end

---@param opt table
---@return table
local with_new_cmd = function(opt)
    local files = vim.fs.find("pyproject.toml")
    if #files > 0 and includePyright(files[1]) then
        opt.cmd = { "poetry", "run", "pyright-langserver", "--stdio" }
    end
    return opt
end

return with_new_cmd({})
