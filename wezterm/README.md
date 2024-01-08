# Wezterm setting directory

## How to use
write following lua file to ~/.config/wezterm/wezterm.lua

```lua
package.path = os.getenv("HOME") .. '/dotfiles/wezterm/?.lua;' .. package.path
return require("xwezterm") or {}
```


