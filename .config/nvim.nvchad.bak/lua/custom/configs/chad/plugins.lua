local plugins = {
  {
    'neovim/nvim-lspconfig',
    config = function()
      require 'custom.configs.plugins.lsp'
      require 'plugins.configs.lspconfig'
    end,
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      mapping = {
        ["<Tab>"] = require('cmp').config.disable,
        ['<S-Tab>'] = require('cmp').config.disable,
        ['<Down>'] = require('cmp').config.disable,
        ['<Up>'] = require('cmp').config.disable,
        ['<CR>'] = require('cmp').config.disable,
        ['<C-p>'] = require('cmp').mapping.select_prev_item(),
        ['<C-n>'] = require('cmp').mapping.select_next_item(),
        ['<C-y>'] = require('cmp').mapping.confirm({ select = true }),
        ['<C-a>'] = require('cmp').mapping.complete(),
        ['<C-d>'] = require('cmp').mapping.abort(),
      }
    }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "graphql",
        "html",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "latex",
        "lua",
        "markdown_inline",
        "nix",
        "python",
        "rust",
        "smithy",
        "sql",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
      },
      indent = {
        enable = true
      }
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    lazy = false,
  },
  {
    'mbbill/undotree',
    lazy = false,
  },
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      local defaultOpts = require "plugins.configs.nvimtree"
      defaultOpts.view.width = 60
      return defaultOpts
    end,
  },
}

return plugins
