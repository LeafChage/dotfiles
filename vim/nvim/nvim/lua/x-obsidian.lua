local ok, obsidian = pcall(require, 'obsidian')
if not ok then return end

local log = require("obsidian.log")
local util = require("obsidian.util")
local Path = require("obsidian.path")

local unlink = function()
    local current_note_bufnr = assert(vim.fn.bufnr())
    local current_note_path = Path.buffer(current_note_bufnr)

    local arg = util.input("Are you ok to remove this file? (Y/n) " .. string.format("%s", current_note_path), {})
    if arg ~= "Y" then
        log.warn "Rename aborted"
        return
    end

    current_note_path:unlink({
        missing_ok = false
    })
end

vim.api.nvim_create_user_command('ObsidianUnlink', unlink,
    { nargs = 0, desc = "remove our obsidian file" }
)

obsidian.setup({
    workspaces = {
        {
            name = "personal",
            path = [[~/Documents/Obsidian Vault/]],
        },
    },
    ui = {
        enable = true,
    },
    note_id_func = function(title)
        -- like '1657296016-my-new-note'
        local suffix = ""
        if title ~= nil then
            suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
            for _ = 1, 4 do
                suffix = suffix .. string.char(math.random(65, 90))
            end
        end
        return suffix .. "-" .. tostring(os.time())
    end
});

return obsidian;
