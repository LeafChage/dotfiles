---@param filepath string
---@param name string
---@return boolean
local includes = function(filepath, name)
    local file = io.open(filepath, "r")
    if file == nil then
        return false
    end
    for line in file:lines() do
        if line:find(name, 1, true) then
            file:close()
            return true
        end
    end
    file:close()
    return false
end

return {
    cmd = { "poetry", "run", "ruff", "server" },
    root_dir = function(bufnr, on_dir)
        local dir = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
        local files = vim.fs.find("pyproject.toml", { upward = true, path = dir })
        if #files == 0 then
            return
        end
        if not includes(files[1], "ruff") then
            vim.notify("you should exec `poetry add ruff`", vim.log.levels.ERROR)
            return
        end
        on_dir(vim.fs.dirname(files[1]))
    end,
}
