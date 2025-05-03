local path = os.getenv("PATH") or ""
if path:find("iced") == nil then
    vim.notify("You need to set iced path", vim.log.levels.WARN)

    local lazypath = vim.fn.stdpath("data") .. "/lazy/vim-iced/bin/"
    vim.notify("PATH: " .. lazypath, vim.log.levels.WARN)
end


