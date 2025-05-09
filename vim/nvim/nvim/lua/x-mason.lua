local ok, mason = pcall(require, "mason")
if not ok then
    print("not found mason.")
    return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
