local M = {
    on_attach = function(client, bufnr)
        local bufopts = { silent = true, buffer = bufnr }
        vim.keymap.set('n', '<Leader>[', "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
        vim.keymap.set('n', '<Leader>]', "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
    end,
    filetypes = { 'markdown', 'md' },
    init_options = {
        config = '~/dotfiles/vim/nvim/nvim/lua/x-lsp/typos.toml',
    }
}
return M;
