local ok, lspsaga = pcall(require, "lspsaga")
if not ok then
    print("not found lspsaga.")
    return
end

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

---@param name string
---@return function
local not_supported_action = function(name)
    return function()
        vim.notify("Not supported: " .. name, vim.log.levels.WARN)
    end
end

--- @ref https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- - `'callHierarchy/incomingCalls'`
-- - `'callHierarchy/outgoingCalls'`
-- - `'textDocument/codeAction'`
-- - `'textDocument/completion'`
-- - `'textDocument/declaration'`
-- - `'textDocument/definition'`
-- - `'textDocument/diagnostic'`
-- - `'textDocument/documentHighlight'`
-- - `'textDocument/documentSymbol'`
-- - `'textDocument/foldingRange'`
-- - `'textDocument/formatting'`
-- - `'textDocument/hover'`
-- - `'textDocument/implementation'`
-- - `'textDocument/inlayHint'`
-- - `'textDocument/prepareTypeHierarchy'`
-- - `'textDocument/publishDiagnostics'`
-- - `'textDocument/rangeFormatting'`
-- - `'textDocument/rangesFormatting'`
-- - `'textDocument/references'`
-- - `'textDocument/rename'`
-- - `'textDocument/semanticTokens/full'`
-- - `'textDocument/semanticTokens/full/delta'`
-- - `'textDocument/signatureHelp'`
-- - `'textDocument/typeDefinition*'`
-- - `'typeHierarchy/subtypes'`
-- - `'typeHierarchy/supertypes'`
-- - `'window/logMessage'`
-- - `'window/showMessage'`
-- - `'window/showDocument'`
-- - `'window/showMessageRequest'`
-- - `'workspace/applyEdit'`
-- - `'workspace/configuration'`
-- - `'workspace/executeCommand'`
-- - `'workspace/inlayHint/refresh'`
-- - `'workspace/symbol'`
-- - `'workspace/workspaceFolders'`
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        print("Attaching LSP: " .. client.name)

        local bufopts = { silent = true, buffer = args.buf }

        -- keybind
        vim.keymap.set('n', '<Leader>jj', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', '<Leader>jt', vim.lsp.buf.type_definition, bufopts)
        if client:supports_method('textDocument/rename') then
            vim.keymap.set('n', '<Leader>n', vim.lsp.buf.rename, bufopts)
        else
            vim.keymap.set('n', '<Leader>n', not_supported_action('textDocument/rename'), bufopts)
        end
        vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format({ async = true }) end, bufopts)
        --
        -- -- keymap for lapsaga
        vim.keymap.set('n', '<Leader>k', '<cmd>Lspsaga hover_doc<CR>', bufopts)
        vim.keymap.set('n', '<Leader>jk', '<Cmd>Lspsaga peek_definition<CR>', bufopts)
        vim.keymap.set('n', '<Leader>r', '<cmd>Lspsaga lsp_finder<CR>', bufopts)
        vim.keymap.set('n', '<Leader>ja', "<cmd>Lspsaga code_action<CR>", bufopts)
        vim.keymap.set('v', '<Leader>ja', "<cmd><C-U>Lspsaga range_code_action<CR>", bufopts)

        vim.keymap.set('n', '<Leader>h', "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
        vim.keymap.set('n', '<Leader>h', "<cmd>Lspsaga show_cursor_diagnostics<CR>", bufopts)

        vim.keymap.set('n', '<Leader>[', "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
        vim.keymap.set('n', '<Leader>]', "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
    end,
})

vim.lsp.config('clangd', {
    cmd = {
        "clangd",
        "--offset-encoding=utf-16", -- LSPのoffsetエンコーディングを明示
        "--pch-storage=memory",     -- PCHをメモリに保持（スピードアップ＆同期安定）
    },
    flags = {
        allow_incremental_sync = false, -- 差分同期を無効化
    },
})

vim.lsp.config('docker_language_server', {
    settings = {
        initializationOptions = {
            dockercomposeExperimental = {
                composeSupport = true
            },
            telemetry = "error"
        }
    },
})

vim.lsp.enable('sourcekit')
