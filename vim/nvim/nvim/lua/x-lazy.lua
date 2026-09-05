--- @params lib string
local load_extention = function(lib)
    local ok, l = pcall(require, lib)
    if not ok then
        error(lib .. ": you need to write library extention " .. l)
    end
    return l
end

local concat = function(...)
    local result = {}
    for _, tbl in ipairs({ ... }) do
        for _, t in ipairs(tbl) do
            table.insert(result, t)
        end
    end
    return result
end


local lazy = load_extention("lazy")

local other = {
    'nvim-lualine/lualine.nvim',
    'editorconfig/editorconfig-vim',
    'Shougo/vimshell',
    "tpope/vim-fugitive",
    {
        -- カーソル下のハイライトをトグルする space+mで検索
        't9md/vim-quickhl',
        config = function()
            vim.keymap.set("n", "<Leader>m", "<Plug>(quickhl-manual-this)")
            vim.keymap.set("n", "<Leader>M", "<Plug>(quickhl-manual-reset)")
            vim.keymap.set("v", "<Leader>m", "<Plug>(quickhl-manual-this)")
            vim.keymap.set("v", "<Leader>M", "<Plug>(quickhl-manual-reset)")
        end
    },
    {
        -- テキスト整形 visualモードで ga
        'junegunn/vim-easy-align',
        config = function()
            vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)')
            vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)')
        end
    },
    {
        -- 画面サイズを編集 ctrl+e
        'simeji/winresizer',
    },
    {
        -- better f
        'ggandor/lightspeed.nvim',
        config = function()
            load_extention("x-lightspeed")
            vim.keymap.set('n', 'f', [[<Plug>Lightspeed_f]])
            vim.keymap.set('n', 'F', [[<Plug>Lightspeed_F]])
        end
    },
    -- typo直してくれるやつ
    -- https://github.com/Pocco81/abbrev-man.nvim
    --
    -- memo取れるやつ
    -- https://github.com/renerocksai/telekasten.nvim
    {
        'folke/zen-mode.nvim',
        config = function()
            load_extention("x-zen-mode")
        end,
        keys = {
            { "<Leader>1", [[ <cmd>ZenMode<cr> ]], desc = "toggle zenmode" }
        }
    },
}

local core = {
    --
    -- lsp
    --
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/vim-vsnip',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'onsails/lspkind.nvim'
        },
        config = function()
            load_extention('x-nvim-cmp')
        end
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'glepnir/lspsaga.nvim'
        },
        config = function()
            -- lspの設定は全部ここで行う
            load_extention('x-lsp')
        end,
    },
    {
        'williamboman/mason.nvim',
        config = function()
            load_extention('x-mason')
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim',
        },
        config = function()
            load_extention('x-mason-lspconfig')
        end
    },
    {
        'glepnir/lspsaga.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        breanch = "main",
        config = function()
            load_extention('x-treesitter')
        end
    },
    ---
    --- fuzzy finder
    ---
    {
        "LeafChage/tt",
        config = function()
            require("tt").setup({
                layout = "float",
            })
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
            'AckslD/nvim-neoclip.lua',
            "stevearc/aerial.nvim",
        },
        config = function()
            load_extention('x-telescope')
        end,
        keys = {
            { "<Leader>ff", [[<Plug>(x-telescope-find-files)]], },
            { "<Leader>fb", [[<Plug>(x-telescope-buffers)]], },
            { "<Leader>fg", [[<Plug>(x-telescope-live-grep)]], },
            { "<Leader>fh", [[<Plug>(x-telescope-help-tags)]], },
            { "<Leader>fn", [[<Plug>(x-telescope-file-browser)]], },
            { "<Leader>fp", [[<CMD>Telescope neoclip<CR>]], },
            { "<leader>fa", [[<CMD>Telescope aerial<CR>]], },
            { "<leader>ft", [[<CMD>Telescope tt<CR>]], },
            { "<leader>tt", [[<CMD>Telescope tt<CR>]], },
        }
    },
    {
        "AckslD/nvim-neoclip.lua",
        dependencies = {
            'kkharji/sqlite.lua',
        },
        config = function()
            load_extention('x-neoclip')
        end,
    },
    {
        "stevearc/aerial.nvim",
        config = function()
            load_extention("x-aerial")
        end
    }
}

local colorscheme = {
    {
        'folke/tokyonight.nvim',
        config = function()
            vim.cmd([[ colorscheme tokyonight ]])
        end,
    },
    {
        'cocopon/iceberg.vim',
        config = function()
            -- vim.cmd([[ colorscheme iceberg ]])
        end
    }
}

local markdown = {
    {
        -- cmp source of 'look', which completion for English word,
        'octaltree/cmp-look',
        config = function()
            load_extention("x-cmp-look")
        end
    },
    {
        -- quote内のプログラムをシンタックスハイライトする
        'joker1007/vim-markdown-quote-syntax',
        ft = { "markdown", "md" }
    },
    {
        'iamcco/markdown-preview.nvim',
        ft = { "markdown", "md" },
        dependencies = {
            -- プレビューをブラウザで開いてくれる
            'tyru/open-browser.vim',

        },
        config = function()
            vim.fn["mkdp#util#install"]()
            vim.api.nvim_create_user_command("Markdown", "MarkdownPreview", {})
            vim.api.nvim_create_user_command("MD", "MarkdownPreview", {})
        end,
    }

}

local ruby = {
    {
        -- end補完
        'tpope/vim-endwise',
        ft = { "ruby", "rb" }
    }
}

local lua = {
    {
        "folke/lazydev.nvim",
        ft = { "lua" },
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
}

local local_plugins = {
}

local dap = {
    {
        "nvim-neotest/nvim-nio",
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            config = function()
                local dapui = load_extention("x-dap-ui")
                vim.keymap.set("n", "<Leader>du", dapui.toggle, { desc = "Toggle debugging UI" })
                -- vim.keymap.set("n", "<Leader>dK", function()
                --     dapui.eval(nil, { enter = true })
                -- end, { desc = "Debug symbol under cursor" })
            end,
        },
        config = function()
            local dap = load_extention("x-dap")
            vim.keymap.set("n", '<Leader>dr', function() require("dap").restart() end, { silent = true, noremap = true })
            vim.keymap.set("n", '<Leader>dt', function() require("dap").toggle_breakpoint() end,
                { silent = true, noremap = true })
            vim.keymap.set("n", '<Leader>dc', function() require("dap").continue() end, { silent = true, noremap = true })
            vim.keymap.set("n", '<Leader>dss', function() require("dap").step_over() end,
                { silent = true, noremap = true })
            vim.keymap.set("n", '<Leader>dsi', function() require("dap").step_into() end,
                { silent = true, noremap = true })
        end
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        config = function()
            local mason = load_extention("x-mason-dap")
        end
    }
}

local lisp = {
    {
        "monkoose/nvlime",
        dependencies = {
            'guns/vim-sexp',
            'monkoose/parsley',
            'hrsh7th/nvim-cmp',
        },
        ft = { "lisp" },
        config = function()
            local nvlime = load_extention("x-nvlime")
            nvlime.setup()
        end
    }
}

local clj = {
    {
        "olical/conjure",
        ft = { "clojure", "edn" },
        init = function()
            vim.g["conjure#filtypes"]                  = { "clojure" }

            vim.g["conjure#mapping#enable_defaults"]   = false
            vim.g["conjure#mapping#prefix"]            = "<Leader>"
            -- logs
            -- vim.g["conjure#mapping#log_split"]                 = "ls"
            -- vim.g["conjure#mapping#log_vsplit"]                = "lv"
            -- vim.g["conjure#mapping#log_tab"]                   = "lt"
            -- vim.g["conjure#mapping#log_buf"]                   = "le"
            -- vim.g["conjure#mapping#log_toggle"]                = "lg"
            -- vim.g["conjure#mapping#log_close_visible"]         = "lq"
            -- vim.g["conjure#mapping#log_reset_soft"]            = "lr"
            -- vim.g["conjure#mapping#log_reset_hard"]            = "lR"
            -- vim.g["conjure#mapping#log_jump_to_latest"]        = "ll"

            -- eval
            vim.g["conjure#mapping#eval_current_form"] = "ee"
            -- vim.g["conjure#mapping#eval_comment_current_form"] = "ece"
            -- vim.g["conjure#mapping#eval_root_form"]            = "er"
            -- vim.g["conjure#mapping#eval_comment_root_form"]    = "ecr"
            -- vim.g["conjure#mapping#eval_word"]                 = "ew"
            -- vim.g["conjure#mapping#eval_comment_word"]         = "ecw"
            --
            -- vim.g["conjure#mapping#eval_replace_form"]         = "e!"
            -- vim.g["conjure#mapping#eval_marked_form"]          = "em"
            -- vim.g["conjure#mapping#eval_file"]                 = "ef"
            -- vim.g["conjure#mapping#eval_buf"]                  = "eb"
            -- vim.g["conjure#mapping#eval_visual"]               = "E"
            -- vim.g["conjure#mapping#eval_motion"]               = "E"
            -- vim.g["conjure#mapping#eval_previous"]             = "ep"

            -- vim.g["conjure#mapping#def_word"] = "jj" -- implemented by lsp
            -- vim.g["conjure#mapping#doc_word"] = { "K" } -- implemented by lsp
        end,
        config = function()
        end,
    },
}

lazy.setup(concat(
    other
    , core
    , colorscheme
    , markdown
    , ruby
    , lua
    , local_plugins
    , lisp
    , clj
    , dap
), {})
