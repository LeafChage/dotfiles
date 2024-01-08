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

---@param keymap string
---@param action string
local nmap = function(keymap, action)
    vim.keymap.set("n", keymap, action, { noremap = true, silent = true })
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
            nmap('<Leader>1', [[<CMD>ZenMode<CR>]])
        end
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
            nmap('<Leader>ff', [[<CMD>lua require('x-telescope-builtin').find_files()<CR>]])
            nmap('<Leader>fb', [[<CMD>lua require('x-telescope-builtin').buffers()<CR>]])
            nmap('<Leader>fg', [[<CMD>lua require('x-telescope-builtin').live_grep()<CR>]])
            nmap('<Leader>fh', [[<CMD>lua require('x-telescope-builtin').help_tags()<CR>]])
            nmap("<Leader>fn", [[<CMD>lua require('x-telescope-file-browser').file_browser()<CR>]])
            nmap("<Leader>fp", [[<CMD>Telescope neoclip<CR>]])
            nmap('<leader>fa', [[<CMD>Telescope aerial<CR>]])
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

local lisp = {
    {
        "monkoose/nvlime",
        dependencies = {
            'monkoose/parsley',
            'hrsh7th/nvim-cmp',
        },
        config = function()
            local nvlime = load_extention("x-nvlime")
            nvlime.setup()
        end
    }
}


lazy.setup(concat(other, core, colorscheme, markdown, ruby, local_plugins, lisp), {})
