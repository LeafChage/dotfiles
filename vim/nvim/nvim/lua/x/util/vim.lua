local M = {}

---@class MappingFile
---@field pattern string | string[]
---@field filetype string


---@param mappings MappingFile[]
function M.mapping_file(mappings)
    for _, mapping in ipairs(mappings) do
        vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
            pattern = mapping.pattern,
            callback = function()
                vim.bo.filetype = mapping.filetype
            end
        })
    end
end

---@class FileConfig
---@field shiftwidth integer
---@field softtabstop integer
---@field tabstop integer
---@field expandtab boolean
---@field [string] any

---@param configs table<string, FileConfig | tbale>
function M.file_config(configs)
    for ft, mapping in pairs(configs) do
        vim.api.nvim_create_autocmd("FileType", {
            pattern = ft,
            callback = function()
                for key, value in pairs(mapping) do
                    vim.opt_local[key] = value
                end
            end
        })
    end
end

return M
