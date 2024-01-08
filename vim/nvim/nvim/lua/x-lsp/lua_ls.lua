local xfile = require("x/file")

---@return table
local luarocks_libraries = function()
    local current_luarocks_path = 'lua_modules/share/lua'

    if xfile.exist(current_luarocks_path) then
        return vim.fs.find(
            function(name)
                return name:match("%d%.%d")
            end,
            {
                limit = math.huge,
                type = 'directory',
                path = 'lua_modules/share/lua',
            }
        )
    end
    return {}
end

local M = {
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false,
                library = vim.tbl_extend('force', vim.api.nvim_list_runtime_paths(), luarocks_libraries())
            },
            diagnostics = {
                globals = { "vim" }
            },
        }
    }
}

return M;
