vim.cmd("set timeoutlen=300")      --Default timeout length to 300 milliseconds
vim.cmd("inoremap jk <Esc>")       -- Press jk in insert mode to enter Normal mode
vim.cmd("vnoremap jk <Esc>")       -- Press jk in visual mode to enter Normal mode

vim.cmd("set clipboard+=unnamedplus")  -- Append system clipboard also to yanking buffers
vim.g.mapleader = " "                  -- Set the leader key to space

vim.cmd("set expandtab")               -- Use spaces instead of tabs
vim.cmd("set tabstop=4")               -- Tab key is display with 4 spaces in normal mode
vim.cmd("set softtabstop=4")           -- Tab key indents by 4 spaces in insert mode
vim.cmd("set shiftwidth=4")            -- >> indents by 4 spaces
vim.cmd("set shiftround")              -- >> indents to next multiple of 'shiftwidth'

