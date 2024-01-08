local ok, zen = pcall(require, "zen-mode")
if not ok then
    print("not found: zen_mode")
    return
end

zen.setup({
    window = {
        width = 0.8
    },
    on_open = function(win)
        vim.notify("opened zen!")
    end,
    on_close = function()
        vim.notify("closed zen!")
    end,
})
