vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 5             -- keep 5 lines above and below the cursor during scrolling to have some context

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.expandtab = true          -- Use spaces instead of tabs
vim.opt.tabstop = 4               -- Tab key is display with 4 spaces in normal mode
vim.opt.softtabstop = 4           -- Tab key indents by 4 spaces in insert mode
vim.opt.shiftwidth = 4            -- >> indents by 4 spaces
vim.opt.shiftround = true         -- >> indents to next multiple of 'shiftwidth'

vim.opt.swapfile = false

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.cursorline = true         -- update the entire line where the cursor is

vim.opt.timeoutlen = 300          -- time in milliseconds to wait for a mapped sequence to complete

vim.opt.clipboard = "unnamed"
vim.opt.clipboard:append("unnamedplus")
