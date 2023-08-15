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

m.tabufline = {
  n = {
    ['<leader>th'] = { function() require("nvchad_ui.tabufline").move_buf(-1) end, 'move tab to the left'},
    ['<leader>tl'] = { function() require("nvchad_ui.tabufline").move_buf(1) end, 'move tab to the right'},
  },
}

return m
