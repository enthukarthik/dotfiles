return {
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<C-\\>", "<cmd>ToggleTerm<CR>" },
      { "<leader>tr", "<cmd>ToggleTerm direction=vertical size=120<CR>" },
    },
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<C-\>]],
        hide_number = false,
        autochdir = true,
        direction = "float",
        float_opts = {
          border = "double",
          winblend = 20,
        },
      })
    end,
  },
}
