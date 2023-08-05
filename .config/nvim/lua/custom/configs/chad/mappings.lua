local m = {}

m['tmux navigation'] = {
  n = {
    ['<C-h>'] = { '<cmd> TmuxNavigateLeft<CR>', 'window left'},
    ['<C-l>'] = { '<cmd> TmuxNavigateRight<CR>', 'window right'},
    ['<C-j>'] = { '<cmd> TmuxNavigateDown<CR>', 'window down'},
    ['<C-k>'] = { '<cmd> TmuxNavigateUp<CR>', 'window up'},
  },
}

m.undotree = {
  n = {
    ['<leader>u'] = { '<cmd> UndotreeToggle <CR>', 'toggle undotree'},
  },
}

return m
