local ok, telescope = pcall(require, 'telescope')
local ok2, file_browser = pcall(require, 'x-telescope-file-browser')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
if not (ok and ok2) then return end

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<cr>"] = actions.select_vertical,
                ["<tab>"] = actions.select_default,
                ["<esc>"] = actions.close,
            },
        },
    },
    pickers = {
    },
    extensions = {
        file_browser = file_browser.extensions(telescope.extensions.file_browser.actions)
    },
})
-- Extension file browser
telescope.load_extension("file_browser")
telescope.load_extension("neoclip")
telescope.load_extension("aerial")
telescope.load_extension("tt")

-- define command
local config = { remap = true, silent = true }
vim.keymap.set('n', [[<Plug>(x-telescope-find-files)]], function()
    return builtin.find_files({})
end, config)
vim.keymap.set('n', [[<Plug>(x-telescope-buffers)]], function()
    return builtin.buffers({})
end, config)
vim.keymap.set('n', [[<Plug>(x-telescope-live-grep)]], function()
    return builtin.live_grep({})
end, config)
vim.keymap.set('n', [[<Plug>(x-telescope-help-tags)]], function()
    return builtin.help_tags({})
end, config)
vim.keymap.set('n', [[<Plug>(x-telescope-file-browser)]], function()
    return telescope.extensions.file_browser.file_browser()
end, config)


return telescope
