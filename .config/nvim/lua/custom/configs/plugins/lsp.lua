require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    'rust_analyzer',
    'ansiblels',
    'bashls',
    'cssls',
    'dockerls',
    'eslint',
    'graphql',
    'html',
    'jsonls',
    'jdtls',
    'tsserver',
    'lua_ls',
    'marksman',
    'pylsp',
    'yamlls',
  },
}

local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

require("mason-lspconfig").setup_handlers {
  function (server_name)
    require("lspconfig")[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
}
