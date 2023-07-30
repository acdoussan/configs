local m = {}

m.general = {
  n = {
    ['<C-h>'] = { '<cmd> TmuxNavigateLeft<CR>', 'window left'},
    ['<C-l>'] = { '<cmd> TmuxNavigateRight<CR>', 'window right'},
    ['<C-j>'] = { '<cmd> TmuxNavigateDown<CR>', 'window down'},
    ['<C-k>'] = { '<cmd> TmuxNavigateUp<CR>', 'window up'},
  },
  i = {
    ['<C-h>'] = { '<Left>' },
    ['<C-l>'] = { '<Right>' },
    ['<C-j>'] = { '<C-o>gj' },
    ['<C-k>'] = { '<C-o>gk' },
  },
}

return m
