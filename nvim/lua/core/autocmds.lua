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

-- HACK to remove any plugin that sets formatoptions tcro and tw for local buffers
vim.cmd([[autocmd BufNewFile,BufRead,BufWinEnter * setlocal formatoptions-=t]])
vim.cmd([[autocmd BufNewFile,BufRead,BufWinEnter * setlocal formatoptions-=c]])
vim.cmd([[autocmd BufNewFile,BufRead,BufWinEnter * setlocal formatoptions-=r]])
vim.cmd([[autocmd BufNewFile,BufRead,BufWinEnter * setlocal formatoptions-=o]])
vim.cmd([[autocmd BufNewFile,BufRead,BufWinEnter * setlocal textwidth=0]])
