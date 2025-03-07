return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      -- mini.statusline related
      require("mini.icons").setup() -- enable icons

      -- Enable comment toggling
      require("mini.comment").setup()

      -- Enable going forward/backward with square brackets
      require("mini.bracketed").setup()

      -- Enable mini.surround
      require("mini.surround").setup()

      -- Enable more textobjects with mini.ai
      require("mini.ai").setup()

      -- Enable mini.align to align lin
      require("mini.align").setup()

      -- Enable highlighter for patterns
      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
          bug = { pattern = "%f[%w]()BUG()%f[%W]", group = "MiniHipatternsFixme" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })

      -- local miniclue = require("mini.clue")
      -- miniclue.setup({ -- cute prompts about bindings
      -- triggers = {
      --         { mode = "n", keys = "<Leader>" },
      --         { mode = "x", keys = "<Leader>" },
      --
      --         -- Built-in completion
      --         { mode = "i", keys = "<C-x>" },
      --
      --         -- `g` key
      --         { mode = "n", keys = "g" },
      --         { mode = "x", keys = "g" },
      --
      --         -- Marks
      --         { mode = "n", keys = "'" },
      --         { mode = "n", keys = "`" },
      --         { mode = "x", keys = "'" },
      --         { mode = "x", keys = "`" },
      --
      --         -- Registers
      --         { mode = "n", keys = '"' },
      --         { mode = "x", keys = '"' },
      --         { mode = "i", keys = "<C-r>" },
      --         { mode = "c", keys = "<C-r>" },
      --
      --         -- Window commands
      --         { mode = "n", keys = "<C-w>" },
      --
      --         -- `z` key for folds
      --         { mode = "n", keys = "z" },
      --         { mode = "x", keys = "z" },
      --
      -- Bracketed
      -- { mode = "n", keys = "[" },
      -- { mode = "n", keys = "]" },
      -- },
      --   clues = {
      --     miniclue.gen_clues.builtin_completion(),
      --     miniclue.gen_clues.g(),
      --     miniclue.gen_clues.marks(),
      --     miniclue.gen_clues.registers(),
      --     miniclue.gen_clues.windows(),
      --     miniclue.gen_clues.z(),
      --   },
      -- })
    end,
  },
}
