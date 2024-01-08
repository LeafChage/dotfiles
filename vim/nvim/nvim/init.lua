local path = require("x/path")

---
--- NVIM_CONFIG_DIRがあれば、DOTFILE_PATHよりも優先する
---
--- @param nvim_config string
--- @param dotfile_config string
--- @return string | nil
local setting_dir = function(nvim_config, dotfile_config)
    if nvim_config ~= "" then
        return nvim_config
    elseif dotfile_config ~= "" then
        return path.join(dotfile_config, "vim/nvim/nvim")
    end
    error("ERROR: you need setting environment. export DOTFILE_PATH=~~~~~~~~;")
end



local vim_setting_dir = setting_dir(vim.env.NVIM_CONFIG_DIR, vim.env.DOTFILE_PATH)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    print(vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    }))
end
vim.opt.rtp:prepend(vim.fn.expand(vim_setting_dir))
vim.opt.rtp:prepend(lazypath)

vim.cmd.source(vim.fn.expand(path.join(vim_setting_dir, "fast.vim")))
require("x-lazy")
vim.cmd.source(vim.fn.expand(path.join(vim_setting_dir, 'common.vim')))
require("keymap")
-- vim.cmd.source(vim.fn.expand(path.join(vim_setting_dir, 'keymap.vim')))
vim.cmd.source(vim.fn.expand(path.join(vim_setting_dir, 'color.vim')))
require("command")
