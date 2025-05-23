-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Close some special filetype buffers",
  pattern = { "qf", "checkhealth", "help" },
  callback = function()
    vim.keymap.set("n", "<leader>x", "<cmd>bd<cr>", { silent = true, buffer = true })
  end,
})

-- HACK to remove any plugin that sets formatoptions tcro and tw for local buffers
vim.cmd([[autocmd BufNewFile,BufRead,BufWinEnter * setlocal formatoptions-=t]])
vim.cmd([[autocmd BufNewFile,BufRead,BufWinEnter * setlocal formatoptions-=c]])
vim.cmd([[autocmd BufNewFile,BufRead,BufWinEnter * setlocal formatoptions-=r]])
vim.cmd([[autocmd BufNewFile,BufRead,BufWinEnter * setlocal formatoptions-=o]])
vim.cmd([[autocmd BufNewFile,BufRead,BufWinEnter * setlocal textwidth=0]])
