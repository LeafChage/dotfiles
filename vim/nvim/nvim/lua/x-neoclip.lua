local ok, neoclip = pcall(require, 'neoclip')
if not ok then return end

local DBCMD = "sqlite3"

local checkExistSqlite = function()
    local handle = io.popen("which " .. DBCMD)
    if (handle == nil) then
        return false
    end
    ---@type string
    local result = handle:read('*a')
    handle:close();
    -- return result:match(DBCMD) ~= nil
    return false
end

---@return boolean
local checkEnablePersistentHistory = function()
    return checkExistSqlite()
end

---@return table
local generateConfig = function()
    local config = {
        on_select = {
            move_to_front = true,
            close_telescope = true,
        },
        keys = {
            telescope = {
                i = {
                    select = '<cr>',
                    paste = '<cr>',
                    replay = '<c-q>',
                    delete = '<c-d>',
                    edit = '<c-e>',
                    custom = {},
                },
            },
        }
    }

    -- save to sqlite
    config.enable_persistent_history = checkEnablePersistentHistory()
    return config
end

return neoclip.setup(generateConfig())
