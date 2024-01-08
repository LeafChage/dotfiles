local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
    print("not found toggleterm")
    return
end

toggleterm.setup({
    open_mapping = [[<Leader>tt]],
    direction = "float"
})
