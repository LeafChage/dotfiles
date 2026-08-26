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

---@param dir string
---@return  nil
local check_install = function(dir)
    local files = vim.fs.find("pyproject.toml")
    if #files > 0 then
        if not includePyright(files[1]) then
            vim.notify("you should exec `poetry add pyright`", vim.log.levels.ERROR)
        end
    end
end

return {
    cmd = { "poetry", "run", "pyright-langserver", "--stdio" },
    root_die = function(bufnr)
        local dir = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
        check_install(dir)
    end
}
