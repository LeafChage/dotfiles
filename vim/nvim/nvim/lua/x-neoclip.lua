local ok, neoclip = pcall(require, 'neoclip')
if not ok then return end

neoclip.setup({
    -- enable_persistent_history = true,
    on_select = {
        move_to_front = true,
        close_telescope = true,
    },
    keys = {
        telescope = {
            i = {
                select = '<cr>',
                paste = '<cr>',
                replay = '<c-q>',
                delete = '<c-d>',
                edit = '<c-e>',
                custom = {},
            },
        },
    },
})

return neoclip
