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
        "numToStr/Comment.nvim",
        config = function()
            load_extention("x-comment")
        end
    },
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
        -- float terminal
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            load_extention("x-toggleterm")
        end
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
        build = ":MasonUpdate",
        config = function()
            -- lspの設定は全部ここで行う
            load_extention('x-lsp')
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim'
        }
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
        config = function()
            load_extention('x-treesitter')
        end
    },
    ---
    --- fuzzy finder
    ---
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
            'AckslD/nvim-neoclip.lua',
            "stevearc/aerial.nvim",
        },
        config = function()
            load_extention('x-telescope')
            vim.keymap.set("n", '<Leader>ff', [[<CMD>lua require('x-telescope-builtin').find_files()<CR>]],
                { silent = true, noremap = true })
            vim.keymap.set("n", '<Leader>fb', [[<CMD>lua require('x-telescope-builtin').buffers()<CR>]],
                { silent = true, noremap = true })
            vim.keymap.set("n", '<Leader>fg', [[<CMD>lua require('x-telescope-builtin').live_grep()<CR>]],
                { silent = true, noremap = true })
            vim.keymap.set("n", '<Leader>fh', [[<CMD>lua require('x-telescope-builtin').help_tags()<CR>]],
                { silent = true, noremap = true })
            vim.keymap.set("n", "<Leader>fn", [[<CMD>lua require('x-telescope-file-browser').file_browser()<CR>]],
                { silent = true, noremap = true })
            vim.keymap.set("n", "<Leader>fp", [[<CMD>Telescope neoclip<CR>]], { silent = true, noremap = true })
            vim.keymap.set("n", '<leader>fa', [[<CMD>Telescope aerial<CR>]], { silent = true, noremap = true })
        end
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

local local_plugins = {
}

local copilot = {
    {
        "github/copilot.vim",
        config = function()
            load_extention("x-copilot")
        end
    }
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
        config = function()
            local nvlime = load_extention("x-nvlime")
            nvlime.setup()
        end
    }
}

local clj = {
    {
        "liquidz/vim-iced",
        dependencies = { "guns/vim-sexp" },
        ft = { "clojure" },
        init = function()
            vim.g.iced_enable_default_key_mappings = false
        end,
        config = function()
            local _ = load_extention("x-iced")
        end,
        keys = {
            { "<Leader>rr", [[<Plug>(iced_connect)]],                        mode = "n" },
            { "<Leader>rj", [[<Plug>(iced_jack_in)]],                        mode = "n" },
            { "<Leader>sv", [[<Plug>(iced_eval)<Plug>(sexp_inner_element)]], mode = "n" },
            { '<Leader>ss', [[<Plug>(iced_eval)<Plug>(sexp_outer_list)]],    mode = "n" },
            { '<Leader>st', [[<Plug>(iced_eval_outer_top_list)]],            mode = "n" },
            { '<Leader>jj', [[<Plug>(iced_def_jump)]],                       mode = "n" },
            { '<Leader>k',  [[<Plug>(iced_document_popup_open)]],            mode = "n" },
            { '==',         [[<Plug>(iced_format)]],                         mode = "n" },
            { '<Leader>f',  [[<Plug>(iced_format_all)]],                     mode = "n" },
        }
    },
    {
        "lamp/cmp-iced",
        dependencies = {
            'hrsh7th/nvim-cmp',
        },
        ft = { "clojure" },
        config = function()
            local _ = load_extention("x-iced-cmp")
        end,
    }
}

local obsidian = {
    {
        "epwalsh/obsidian.nvim",
        dependencies = { "nvim-lua/plenary.nvim", },
        ft = { "markdown", "md" },
        config = function()
            local obsidian = load_extention("x-obsidian");
        end,
        keys = {
            { "<Leader>ot", [[<cmd>ObsidianTags<CR>]],        desc = "search file by tags" },
            { "<Leader>of", [[<cmd>ObsidianQuickSwitch<CR>]], desc = "search file" },
            { "<Leader>on", [[<cmd>ObsidianRename<CR>]],      desc = "rename this file" },
            { "<Leader>od", [[<cmd>ObsidianUnlink<CR>]],      desc = "remove this file" },
        }
    }
}



lazy.setup(concat(
    other
    , core
    , colorscheme
    , markdown
    , ruby
    , local_plugins
    , lisp
    , clj
    , dap
-- ,obsidian
), {})
