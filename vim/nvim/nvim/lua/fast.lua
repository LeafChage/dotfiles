local util = require("x.util.vim")

vim.g.mapleader = " "

vim.filetype.add({
    extension = {
        edn = 'edn',
    },
})

util.mapping_file({
    { pattern = "*.ejs,*._ejs",                             filetype = "ejs" },
    { pattern = "*.pug",                                    filetype = "pug" },
    { pattern = "*.fs,*.fsx",                               filetype = "fsharp" },
    { pattern = "*.fsproj",                                 filetype = "xml" },
    { pattern = "*.es6",                                    filetype = "javascript" },
    { pattern = "*.ros,*.asd",                              filetype = "lisp" },
    { pattern = "*.phtml",                                  filetype = "html" },
    { pattern = "*.conf",                                   filetype = "conf" },
    { pattern = "*.ts",                                     filetype = "typescript" },
    { pattern = "*.tsx",                                    filetype = "typescript.tsx" },
    { pattern = "docker-compose*.yaml,docker-compose*.yml", filetype = "yaml.docker-compose" }
})

util.file_config({
    c                  = { shiftwidth = 2, softtabstop = 2, tabstop = 2, expandtab = true, },
    html               = { shiftwidth = 2, softtabstop = 2, tabstop = 2, expandtab = true, },
    pug                = { shiftwidth = 2, softtabstop = 2, tabstop = 2, expandtab = true, },
    ejs                = { shiftwidth = 2, softtabstop = 2, tabstop = 2, expandtab = true, },
    ruby               = { shiftwidth = 2, softtabstop = 2, tabstop = 2, expandtab = true, },
    markdown           = { shiftwidth = 2, softtabstop = 2, tabstop = 2, expandtab = true, conceallevel = 1, spell = true, spelllang = "en_us" },
    yaml               = { shiftwidth = 2, softtabstop = 2, tabstop = 2, expandtab = true, },
    javascript         = { shiftwidth = 2, softtabstop = 2, tabstop = 2, expandtab = true, },
    typescript         = { shiftwidth = 2, softtabstop = 2, tabstop = 2, expandtab = true, },
    ["typescript.tsx"] = { shiftwidth = 2, softtabstop = 2, tabstop = 2, expandtab = true, },
    python             = { shiftwidth = 4, softtabstop = 4, tabstop = 4, expandtab = true, },
    json               = { shiftwidth = 2, softtabstop = 2, tabstop = 2, expandtab = true, },
    css                = { shiftwidth = 4, softtabstop = 4, tabstop = 4, expandtab = true, },
    scss               = { shiftwidth = 4, softtabstop = 4, tabstop = 4, expandtab = true, },
    sass               = { shiftwidth = 4, softtabstop = 4, tabstop = 4, expandtab = true, },
    nim                = { shiftwidth = 2, softtabstop = 2, tabstop = 2, expandtab = true, },
    go                 = { shiftwidth = 4, softtabstop = 4, tabstop = 4, expandtab = true, },
    rust               = { shiftwidth = 4, softtabstop = 4, tabstop = 4, expandtab = true, },
    rs                 = { shiftwidth = 4, softtabstop = 4, tabstop = 4, expandtab = true, },
    lisp               = { shiftwidth = 2, softtabstop = 2, tabstop = 2, expandtab = true, },
})
