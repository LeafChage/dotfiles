local ok, cmp = pcall(require, "cmp")
if (not (ok)) then return end

cmp.setup.filetype('markdown', {
    sources = cmp.config.sources({
        {
            name = 'look',
            keyword_length = 2,
            option = {
                convert_case = true,
                loud = true
            }
        }
    })
})
