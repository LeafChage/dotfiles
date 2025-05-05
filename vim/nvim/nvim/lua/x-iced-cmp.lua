local ok, cmp = pcall(require, "cmp")
if (not (ok)) then return end

cmp.setup.filetype('clojure', {
    sources = cmp.config.sources({
        { name = 'iced' },
    })
})
