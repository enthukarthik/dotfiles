vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 999             -- keep few lines above and below the cursor during scrolling. 999 ensure scrolling happens from the middle of the screen

vim.opt.mouse = 'a'
vim.opt.mousemoveevent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.expandtab = true          -- Use spaces instead of tabs
vim.opt.tabstop = 4               -- Tab key is display with 4 spaces in normal mode
vim.opt.softtabstop = 4           -- Tab key indents by 4 spaces in insert mode
vim.opt.shiftwidth = 4            -- >> indents by 4 spaces
vim.opt.shiftround = true         -- >> indents to next multiple of 'shiftwidth'

vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.wildmode = 'longest:full,full'

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.cursorline = true         -- update the entire line where the cursor is

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300          -- time in milliseconds to wait for a mapped sequence to complete

vim.opt.clipboard = "unnamed,unnamedplus"

vim.opt.list = true
vim.opt.listchars = { tab = '→ ', trail = '·', extends = '»', precedes = '«', eol = '¬' }

vim.opt.wrap = false

vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

vim.opt.backspace = "indent,eol,start"

vim.opt.breakindent = true

vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.termguicolors = true

vim.opt.virtualedit = "block" -- <C-v> works on block even if there are no characters to select

vim.opt.inccommand = "split" -- results of search/substitution show in a split window below

