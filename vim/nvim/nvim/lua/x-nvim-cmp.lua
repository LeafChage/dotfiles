local ok, cmp = pcall(require, "cmp")
local ok2, lspkind = pcall(require, "lspkind")

if (not (ok and ok2)) then return end

cmp.setup({
    formatting = {
        format = lspkind.cmp_format({
            mode = 'text',
            maxwidth = 50,
            before = function(entry, vim_item)
                return vim_item
            end
        })
    },
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
    },
    mapping = cmp.mapping.preset.insert({
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ['<C-l>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm { select = true },
    }),
    experimental = {
        ghost_text = true,
    },
})
