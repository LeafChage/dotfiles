local ok, telescope = pcall(require, 'telescope')
if not ok then return end

M = {}

function M.file_browser()
    return telescope.extensions.file_browser.file_browser({
        hidden = true, -- display hidden file
        hide_parent_dir = true, -- hide parent dir(../)
        grouped = true, -- order of directory, file
    })
end

function M.extensions(actions)
    -- actions ref:
    -- https://github.com/nvim-telescope/telescope-file-browser.nvim/blob/master/lua/telescope/_extensions/file_browser/actions.lua
    return {
        theme = "dropdown",
        hijack_netrw = true,
        mappings = {
            i = {
                ["<C-a>"] = actions.create, -- Create file/folder at current path (trailing path separator creates folder)
                -- [""] = actions.create_from_prompt, -- Create and open file/folder from prompt (trailing path separator creates folder)
                ["<C-r>"] = actions.rename, -- Rename multi-selected files/folders
                ["<C-m>"] = actions.move, -- Move multi-selected files/folders to current path
                ["<C-c>"] = actions.copy, -- Copy (multi-)selected files/folders to current path
                ["<C-d>"] = actions.remove, -- Delete (multi-)selected files/folders
                -- [""] = actions.open, -- Open file/folder with default system application
                ["<C-h>"] = actions.goto_parent_dir, -- Go to parent directory
                ["<Leader>home"] = actions.goto_home_dir, -- Go to home directory
                ["<C-g>"] = actions.goto_cwd, -- Go to current working directory (cwd)
                ["<C-s>"] = actions.change_cwd, -- Change nvim's cwd to selected folder/file(parent)
                ["<C-f>"] = actions.toggle_browser, -- Toggle between file and folder browser
                -- [""] = actions.toggle_hidden, -- Toggle hidden files/folders
                -- [""] = actions.toggle_all, -- Toggle all entries ignoring ./ and ../
            },
            n = {
                ["a"] = actions.create, -- Create file/folder at current path (trailing path separator creates folder)
                -- [""] = actions.create_from_prompt, -- Create and open file/folder from prompt (trailing path separator creates folder)
                ["r"] = actions.rename, -- Rename multi-selected files/folders
                ["m"] = actions.move, -- Move multi-selected files/folders to current path
                ["c"] = actions.copy, -- Copy (multi-)selected files/folders to current path
                ["d"] = actions.remove, -- Delete (multi-)selected files/folders
                -- [""] = actions.open, -- Open file/folder with default system application
                ["h"] = actions.goto_parent_dir, -- Go to parent directory
                -- [""] = actions.goto_home_dir, -- Go to home directory
                ["g"] = actions.goto_cwd, -- Go to current working directory (cwd)
                ["s"] = actions.change_cwd, -- Change nvim's cwd to selected folder/file(parent)
                ["f"] = actions.toggle_browser, -- Toggle between file and folder browser
                -- [""] = actions.toggle_hidden, -- Toggle hidden files/folders
                -- [""] = actions.toggle_all, -- Toggle all entries ignoring ./ and ../
            },
        },
    }
end

return M
