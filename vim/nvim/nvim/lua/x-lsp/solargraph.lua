local cmd = function()
    local files = vim.fs.find("solargraph", {
        limit = math.huge,
        type = "file",
        path = "./vendor/bundle/ruby",
    })

    if #files > 0 then
        return { "bundle", "exec", "solargraph", "stdio" }
    end
    return { "solargraph", "stdio" }
end


local M = {
    cmd = cmd()
}

return M;
