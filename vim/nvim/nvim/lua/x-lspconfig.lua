-- custome setup lsp
local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
    print("not found lspconfigs.configs")
    return
end

local configs = require("lspconfig.configs")
local util = require('lspconfig.util')

if not configs.cl_lsp then
    configs.cl_lsp = {
        default_config = {
            cmd = {
                vim.fs.normalize("~/.roswell/bin/cl-lsp"),
                "stdio"
            },
            filetypes = { "lisp" },
            single_file_support = true,
            settings = {},
            root_dir = util.find_git_ancestor,
        }
    }
end

if not configs.racket_language_server then
    configs.racket_language_server = {
        default_config = {
            cmd = { "racket", "--lib", "racket-langserver" },
            filetypes = { 'racket', "scheme" },
            single_file_support = true,
        }
    }
end

if not configs.zk then
    configs.zk = {
        default_config = {
            cmd = { "zk", "lsp" },
            filetypes = { 'markdown' },
            single_file_support = true,
        }
    }
end

return lspconfig
