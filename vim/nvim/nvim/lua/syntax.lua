vim.cmd("syntax on")

vim.g.t_Co = 256
vim.g.termguicolors = true

vim.api.nvim_set_hl(0, "ExtraWhitespace", {
    ctermbg = "darkmagenta",
    bg = "darkmagenta"
})

-- vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufRead" }, {
vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter" }, {
    pattern = "*",
    callback = function()
        -- visualize whitespace characters
        -- u2000 ' ' en quad
        -- u2001 ' ' em quad
        -- u2002 ' ' en space
        -- u2003 ' ' em space
        -- u2004 ' ' three-per em space
        -- u2005 ' ' four-per em space
        -- u2006 ' ' six-per em space
        -- u2007 ' ' figure space
        -- u2008 ' ' punctuation space
        -- u2009 ' ' thin space
        -- u200A ' ' hair space
        -- u200B '​' zero-width space
        -- u3000 '　' ideographic (zenkaku) space
        -- Luaの文字列でUnicode（\uXXXX）のエスケープを有効にするために大文字のUかutf-8文字を直接使用
        vim.fn.matchadd("ExtraWhitespace", "[\u{2000}-\u{200B}\u{3000}]")
    end,
})
