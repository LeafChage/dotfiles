-- Need to load 'dap' for excepting error
local _ = require("dap")
local mason = require("mason-nvim-dap")

mason.setup({
    handlers = {
        function(config)
            -- print("Attaching DAP")
            -- print(vim.inspect.inspect(config))
            require("mason-nvim-dap").default_setup(config)
        end,
    },
})
