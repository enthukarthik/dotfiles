-- Load basic configurations
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Load custom plugins
require("lazy").setup({
  require("plugins.gruvbox"),
  require("plugins.neo-tree"),
  require("plugins.bufferline"),
  require("plugins.lualine"),
  require("plugins.nvim-treesitter"),
  require("plugins.telescope"),
  require("plugins.nvim-lspconfig"),
  require("plugins.nvim-cmp"),
  require("plugins.none-ls"),
  require("plugins.vim-sleuth"),
  require("plugins.indent-blankline"),
  require("plugins.which-key"),
  require("plugins.mini"),
  require("plugins.lazygit"),
  require("plugins.toggleterm"),
  require("plugins.nvim-colorizer"),
})
