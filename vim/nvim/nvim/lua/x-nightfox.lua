local ok, nightfox = pcall(require, "nightfox")
if not ok then return end

nightfox.setup({
    options = {
        -- Compiled file's destination location
        compile_path = vim.fn.stdpath("cache") .. "/nightfox",
        compile_file_suffix = "_compiled", -- Compiled file suffix
        transparent = false, -- Disable setting background
        terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false, -- Non focused panes set to alternative background
        styles = { -- Style to be applied to different syntax groups
            -- 	bold
            -- 	underline
            -- 	undercurl	curly underline
            -- 	strikethrough
            -- 	reverse
            -- 	inverse		same as reverse
            -- 	italic
            -- 	standout
            -- 	nocombine	override attributes instead of combining them
            -- 	NONE		no attributes used (used to reset it)
            comments = "NONE",
            conditionals = "NONE",
            constants = "NONE",
            functions = "NONE",
            keywords = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "italic",
            variables = "NONE",
        },
        inverse = { -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
        },
    }
})

vim.cmd("colorscheme nightfox")
vim.g.lightline = { colorscheme = "nightfox" }
