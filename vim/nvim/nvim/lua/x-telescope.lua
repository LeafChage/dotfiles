local ok, telescope = pcall(require, 'telescope')
local ok2, file_browser = pcall(require, 'x-telescope-file-browser')
local ok3, builtin = pcall(require, 'x-telescope-builtin')
if not (ok and ok2 and ok3) then return end

telescope.setup({
    defaults = builtin.settings_defaults(),
    pickers = builtin.settings_pickers(),
    extensions = {
        file_browser = file_browser.extensions(telescope.extensions.file_browser.actions)
    },
})
-- Extension file browser
telescope.load_extension("file_browser")
telescope.load_extension("neoclip")
telescope.load_extension("aerial")

return telescope
