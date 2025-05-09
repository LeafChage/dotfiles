local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok then
    print("not found mason-lspconfig.")
    return
end

mason_lspconfig.setup({
    automatic_enable = true
})

-- mason_lspconfig.setup_handlers({
--     function(server_name)
--         nvim_lspconfig[server_name].setup(common_setting)
--     end,
--     ["typos_lsp"] = function()
--         nvim_lspconfig["typos_lsp"].setup(require("x-lsp/typos_lsp"))
--     end,
--     ["lua_ls"] = function()
--         nvim_lspconfig["lua_ls"].setup(
--             vim.tbl_extend('force', common_setting, require("x-lsp/lua_ls"))
--         )
--     end,
--     ["solargraph"] = function()
--         nvim_lspconfig["solargraph"].setup(
--             vim.tbl_extend('force', common_setting, require("x-lsp/solargraph"))
--         )
--     end,
--     ["pyright"] = function()
--         nvim_lspconfig["pyright"].setup(
--             vim.tbl_extend('force', common_setting, require("x-lsp/pyright"))
--         )
--     end,
-- })
