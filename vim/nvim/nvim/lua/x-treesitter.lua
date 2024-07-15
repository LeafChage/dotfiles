local ok, config = pcall(require, "nvim-treesitter.configs")
if not ok then return end

config.setup {
    ensure_installed = {
        "tsx",
        "markdown",
        "markdown_inline",
        "lua",
        "typescript",
        "php",
        -- "ruby",
        "fennel",
        "go",
        "c_sharp",
        "html",
        "zig",
        "kotlin",
        "java",
        "scheme",
        "ocaml",
        "haskell",
    },
    highlight = {
        enable = true
    }
}
