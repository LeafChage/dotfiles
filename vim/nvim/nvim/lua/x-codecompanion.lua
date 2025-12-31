local companion = require("codecompanion")


return companion.setup({
    adapters = {
        http = {
            anthropic = function()
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
                -- cached variable in closure
                local anthropicAPIKey = vim.trim(apikey)

                return require("codecompanion.adapters").extend("anthropic", {
                    schema = {
                        model = {
                            default = "claude-haiku-4-5-20251001",
                        },
                    },
                    env = {
                        api_key = anthropicAPIKey
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
