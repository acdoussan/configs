return {
  "nvim-cmp",
  keys = {
    {
      "<Tab>",
      false,
      expr = true,
      silent = true,
      mode = { "i", "s" },
    },
    {
      "<S-Tab>",
      false,
      expr = true,
      silent = true,
      mode = { "i", "s" },
    },
    {
      "<C-n>",
      function()
        return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<cr>"
      end,
      expr = true,
      silent = true,
      mode = { "i", "s" },
    },
    {
      "<C-p>",
      function()
        return vim.snippet.active({ direction = -1 }) and "<cmd>lua vim.snippet.jump(-1)<cr>"
      end,
      expr = true,
      silent = true,
      mode = { "i", "s" },
    },
  }
}
