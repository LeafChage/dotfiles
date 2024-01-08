local ok, aerial = pcall(require, "aerial")
if not ok then return end

aerial.setup({
    layout = {
        default_direction = "left",
    },
})
