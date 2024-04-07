vim.cmd.command('M', 'messages')

vim.api.nvim_create_user_command('OpenLspLog', function()
        local path = vim.lsp.get_log_path()
        vim.cmd(":n " .. path)
    end,
    { nargs = 0, desc = "open lsp log file" }
)
