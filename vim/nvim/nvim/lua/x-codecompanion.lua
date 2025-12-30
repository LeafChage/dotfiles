local companion = require("codecompanion")

return companion.setup({
    adapters = {
        http = {
            anthropic = function()
                return require("codecompanion.adapters").extend("anthropic", {
                    schema = {
                        model = {
                            default = "claude-haiku-4-5-20251001",
                        },
                    },
                    env = {
                        api_key = function()
                            local apikey = vim.fn.system({
                                "op",
                                "item",
                                "get",
                                "claude",
                                "--vault",
                                "Personal-Develop",
                                "--field",
                                "notesPlain",
                            })
                            return vim.trim(apikey)
                        end
                    },
                })
            end,
        },
    },
    interactions = {
        chat = { adapter = "anthropic", },
        inline = { adapter = "anthropic", },
        -- cmd = ,
        -- background = ,
    },
    opts = {
        log_level = "TRACE",
    }
})
