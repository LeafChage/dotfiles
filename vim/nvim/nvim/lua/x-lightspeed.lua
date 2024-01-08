local ok, lightspeed = pcall(require, "lightspeed")
if not ok then
    print("not found lightspeed")
    return
end


lightspeed.setup({})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        lightspeed.init_highlight(true)
    end,
})
