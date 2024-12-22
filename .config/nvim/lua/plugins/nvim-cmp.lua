return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    opts.mapping ={
      ["<Tab>"] = cmp.config.disable,
      ['<S-Tab>'] = cmp.config.disable,
      ['<Down>'] = cmp.config.disable,
      ['<Up>'] = cmp.config.disable,
      ['<CR>'] = cmp.config.disable,
      ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
      ['<C-a>'] = cmp.mapping.complete(),
      ['<C-d>'] = cmp.mapping.abort(),
    }

    opts.experimental = {
      ghost_text = false,
    }

  end,
}
