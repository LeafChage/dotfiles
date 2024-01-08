local opt = {
    silent = true,
    noremap = true,
}

---
--- for tab (like window operation)
---
vim.keymap.set('n', "<Leader>t", "<CMD>tabedit<CR>", opt)
vim.keymap.set('n', "<C-t>h", "<CMD>tabp<CR>", opt)
vim.keymap.set('n', "<C-t>l", "<CMD>tabn<CR>", opt)
vim.keymap.set('n', "<C-t>q", "<CMD>tabc<CR>", opt)

---
--- for Terminal Mode
---
vim.cmd.set("sh=bash") -- TerminalModeをbashで開く"
vim.keymap.set('t', "<ESC>", [[<C-\><C-n>]], opt)

---
--- key mapping
---
vim.keymap.set("n", "<Leader>w", "<CMD>w<CR>", opt)
vim.keymap.set("n", "<Leader>q", "<CMD>q<CR>", opt)
vim.keymap.set("n", "<Leader>wq", "<CMD>wq<CR>", opt)

vim.keymap.set("n", "<Leader>l", "<CMD>vsplit<CR>", opt)
vim.keymap.set("n", "<Leader>L", "<CMD>split<CR>", opt)

vim.keymap.set("n", "<Leader>,", "<C-t>", opt)

--- for php
vim.keymap.set("i", "zl", "->", opt)

--- system clipboard
vim.keymap.set('v', "<Leader>y", [["+y]], opt)
vim.keymap.set('v', "<Leader>p", [["+p]], opt)
vim.keymap.set('v', "<Leader>P", [["+P]], opt)
vim.keymap.set('n', "<Leader>y", [["+y]], opt)
vim.keymap.set('n', "<Leader>p", [["+p]], opt)
vim.keymap.set('n', "<Leader>P", [["+P]], opt)
