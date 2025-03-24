local wezterm = require("wezterm")

local zen = require("plugins.zen").setup({ left = 300, right = 300 })
local easy = require("plugins.easy_to_show").setup({ font_size = 15 })

wezterm.on('easy-to-show-toggle', easy.toggle)
wezterm.on('zen-mode-toggle', zen.toggle)

---@param key string
---@param mods string
---@param action any
---@return table
local keymap = function(key, mods, action)
    return { key = key, mods = mods, action = action, }
end

return {
    -- delete default keymap
    disable_default_key_bindings = true,

    -- color
    color_scheme = 'iceberg-dark',
    colors = {
        background = 'rgba(36 40 59)',
    },

    -- font
    font = wezterm.font('Comic Shanns'),
    font_size = 11,


    -- keymap
    keys = {
        keymap('t', 'CMD', wezterm.action.SpawnTab("CurrentPaneDomain")),
        keymap('w', 'CMD', wezterm.action.CloseCurrentTab({ confirm = true })),
        keymap('v', 'CMD', wezterm.action.PasteFrom("Clipboard")),
        keymap('c', 'CMD', wezterm.action.CopyTo("Clipboard")),
        keymap('r', 'CMD', wezterm.action.ReloadConfiguration),
        keymap('1', 'CMD', wezterm.action.ActivateTab(0)),
        keymap('2', 'CMD', wezterm.action.ActivateTab(1)),
        keymap('3', 'CMD', wezterm.action.ActivateTab(2)),
        keymap('4', 'CMD', wezterm.action.ActivateTab(3)),
        keymap('5', 'CMD', wezterm.action.ActivateTab(4)),
        keymap('6', 'CMD', wezterm.action.ActivateTab(5)),
        keymap('7', 'CMD', wezterm.action.ActivateTab(6)),
        keymap('8', 'CMD', wezterm.action.ActivateTab(7)),
        keymap('9', 'CMD', wezterm.action.ActivateTab(8)),
        keymap('l', 'CMD', wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' })),
        keymap('-', 'CMD', wezterm.action.SplitVertical({ domain = 'CurrentPaneDomain' })),
        keymap('1', 'CTRL', wezterm.action.EmitEvent("easy-to-show-toggle")),
        keymap('2', 'CTRL', wezterm.action.EmitEvent('zen-mode-toggle'))
    },
}
