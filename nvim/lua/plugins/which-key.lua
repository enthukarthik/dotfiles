return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    enabled = true,
    opts = {
      preset = "helix", -- "classic", "modern", "helix"
      -- TODO Need to figure out a way on how to move the older register mapping
      -- to the new add() function in a hierarchical way
      spec = {},
      notify = true,
      triggers = {
        { "<auto>", mode = "nixsotc" },
        -- { "<leader>", mode = { "n", "v", "x" } },
        -- { "<C-x>", mode = "i" },
      },
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in Normal or <C-r> in INSERT mode
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = false, -- Help for operators like d, y, ... and registers them for motion/text object completion
          motions = true, -- Help for motions
          text_objects = true, -- Help for text objects after entering an operator
          windows = true, -- default bindings on <C-w>
          nav = true, -- Misc bindings to work with windows
          z = true, -- bindings for folds, spelling and other prefixed with z
          g = true, -- bindings for commands prefixed with g
        },
      },
      win = {
        no_overlap = true, -- don't allow the popup to overlap with the cursor
        border = "rounded", -- none, single, double, shadow
        padding = { 2, 2 }, -- extra window padding [top/bottom, right/left]
        -- Additional vim.wo and vim.bo options
        bo = {},
        wo = {
          winblend = 20,
        },
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
      },
      keys = {
        scroll_down = "<C-d>", -- binding to scroll down inside the popup
        scroll_up = "<C-u>", -- binding to scroll up inside the popup
      },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
        ellipsis = "…",
      },
      show_help = true, -- show help message on the command line when the popup is visible
      show_keys = true, -- show the currently pressed key and its label as a message in the cmd line
    },

    config = function(_, opts)
      require("which-key").setup(opts)
    end,
  },
}
