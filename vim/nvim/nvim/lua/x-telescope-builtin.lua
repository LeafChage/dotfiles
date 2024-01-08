local ok, _ = pcall(require, 'telescope')
local ok2, actions = pcall(require, 'telescope.actions')
local ok3, builtin = pcall(require, 'telescope.builtin')
if not (ok and ok2 and ok3) then return end

M = {}

function M.find_files()
    return builtin.find_files({
        -- hidden = true
    })
end

function M.buffers()
    return builtin.buffers({})
end

function M.live_grep()
    return builtin.live_grep({})
end

function M.help_tags()
    return builtin.help_tags({})
end

function M.settings_defaults()
    return {
        mappings = {
            i = {
                ["<cr>"] = actions.select_vertical,
                ["<tab>"] = actions.select_default,
                ["<esc>"] = actions.close,
            },
        },
    }
end

function M.settings_pickers()
    return {
    }
end

return M
