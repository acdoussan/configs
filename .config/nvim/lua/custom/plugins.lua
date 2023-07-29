local plugins = {
   {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      dependencies = {
         -- LSP Support
         {'neovim/nvim-lspconfig'},
         {'williamboman/mason.nvim'},
         {'williamboman/mason-lspconfig.nvim'},

         -- Autocompletion
         {'hrsh7th/nvim-cmp'},
         {'hrsh7th/cmp-buffer'},
         {'hrsh7th/cmp-path'},
         {'saadparwaiz1/cmp_luasnip'},
         {'hrsh7th/cmp-nvim-lsp'},
         {'hrsh7th/cmp-nvim-lua'},

         -- Snippets
         {'L3MON4D3/LuaSnip'},
         {'rafamadriz/friendly-snippets'},
      },
      config = function()
         require 'custom.configs.lsp'
      end,
      lazy = false,
   },
   {
      'nvim-treesitter/nvim-treesitter',
      config = function()
         require 'custom.configs.treesitter'
      end,
   },
   {
      'nvim-treesitter/nvim-treesitter-context',
      lazy = false,
   },
   {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.0',
      dependencies = { {'nvim-lua/plenary.nvim'}, {'nvim-treesitter/nvim-treesitter'} },
      config = function(_, opts)
         dofile(vim.g.base46_cache .. "telescope")
         local telescope = require "telescope"
         telescope.setup(opts)

        -- load extensions
        for _, ext in ipairs(opts.extensions_list) do
          telescope.load_extension(ext)
        end

         require 'custom.configs.telescope'
      end,
      lazy = false,
   },
   {
      'mbbill/undotree',
      config = function()
         require 'custom.configs.undotree'
      end,
      lazy = false,
   },
   {
     'christoomey/vim-tmux-navigator',
     lazy = false,
   }
}

return plugins
