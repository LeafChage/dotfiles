--- libraary import
local ok, mason = pcall(require, "mason")
local ok1, mason_lspconfig = pcall(require, "mason-lspconfig")
local ok2, nvim_lspconfig = pcall(require, "x-lspconfig")
local ok3, lspsaga = pcall(require, "lspsaga")
if not ok then
    print("not found mason.")
    return
end

if not ok1 then
    print("not found mason-lspconfig.")
    return
end
if not ok2 then
    print("not found lspconfig.")
    return
end
if not ok3 then
    print("not found lspsaga.")
    return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

---
--- lspsaga setting
---
lspsaga.setup({
    diagnostic_header = { " ", " ", " " },
    move_in_saga = { prev = '<C-p>', next = '<C-n>' },
    lightbulb = {
        enable = false,
    },
    finder_icons = { def = '', ref = '', link = '', },
    symbol_in_winbar = {
        in_custom = false,
        enable = true,
        separator = ' ',
        show_file = true,
        -- define how to customize filename, eg: %:., %
        -- if not set, use default value `%:t`
        -- more information see `vim.fn.expand` or `expand`
        -- ## only valid after set `show_file = true`
        file_formatter = "",
        click_support = false,
    },
    -- definition_preview_icon = "",
    show_outline = {
        win_width = 100,
        auto_preview = false,
    },
})

--- lsp settings
local common_setting = {
    on_attach = function(client, bufnr)
        print("Attaching LSP: " .. client.name)
        local bufopts = { silent = true, buffer = bufnr }
        -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- keybind
        vim.keymap.set('n', '<Leader>jj', '<cmd>lua vim.lsp.buf.definition()<CR>', bufopts)
        vim.keymap.set('n', '<Leader>jt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', bufopts)
        vim.keymap.set('n', '<Leader>n', '<cmd>lua vim.lsp.buf.rename()<CR>', bufopts)
        vim.keymap.set('n', '<Leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', bufopts)

        -- keymap for lapsaga
        vim.keymap.set('n', '<Leader>k', '<cmd>Lspsaga hover_doc<CR>', bufopts)
        vim.keymap.set('n', '<Leader>jk', '<Cmd>Lspsaga peek_definition<CR>', bufopts)
        vim.keymap.set('n', '<Leader>r', '<cmd>Lspsaga lsp_finder<CR>', bufopts)
        vim.keymap.set('n', '<Leader>ja', "<cmd>Lspsaga code_action<CR>", bufopts)
        vim.keymap.set('v', '<Leader>ja', "<cmd><C-U>Lspsaga range_code_action<CR>", bufopts)

        vim.keymap.set('n', '<Leader>h', "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
        vim.keymap.set('n', '<Leader>h', "<cmd>Lspsaga show_cursor_diagnostics<CR>", bufopts)

        vim.keymap.set('n', '<Leader>[', "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
        vim.keymap.set('n', '<Leader>]', "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
    end
}

-- not mason
nvim_lspconfig["zls"].setup(common_setting)
-- nvim_lspconfig["sourcekit"].setup(common_setting)
-- nvim_lspconfig["cl_lsp"].setup(common_setting)
-- nvim_lspconfig["racket_language_server"].setup(common_setting)

--- @ref https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
mason_lspconfig.setup_handlers({
    function(server_name)
        nvim_lspconfig[server_name].setup(common_setting)
    end,
    ["typos_lsp"] = function()
        nvim_lspconfig["typos_lsp"].setup(require("x-lsp/typos_lsp"))
    end,
    ["lua_ls"] = function()
        nvim_lspconfig["lua_ls"].setup(
            vim.tbl_extend('force', common_setting, require("x-lsp/lua_ls"))
        )
    end,
    ["solargraph"] = function()
        nvim_lspconfig["solargraph"].setup(
            vim.tbl_extend('force', common_setting, require("x-lsp/solargraph"))
        )
    end,
    ["pyright"] = function()
        nvim_lspconfig["pyright"].setup(
            vim.tbl_extend('force', common_setting, require("x-lsp/pyright"))
        )
    end,
})
