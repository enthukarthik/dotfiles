-- Avoiding all the module warnings with healthcheck
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

if vim.g.neovide then
  vim.opt.guifont = "JetBrainsMono Nerd Font:h13"
  vim.g.neovide_transparency = 0.9 -- content and title bar, both should be transparent
  vim.g.transparency = 0.1
  vim.g.neovide_hide_mouse_when_typing = true
end

vim.opt.number = true -- enable line number
vim.opt.relativenumber = true -- enable relative line number
vim.opt.numberwidth = 5 -- always keep the number width to 2 to avoid text juggle

vim.opt.mouse = "a" -- enable mouse mode, can be useful for resizing splits, if required

vim.opt.showmode = false -- Don't show mode, since it's already part of status line
vim.opt.showtabline = 2 -- Always show tab line

vim.opt.smartindent = true -- Do smart auto indenting when starting new line
vim.opt.autoindent = true -- It should be on when smartindent is on
vim.opt.breakindent = true -- Break indent for long lines so that they look visually indented

vim.opt.wrap = false -- Don't wrap lines
vim.opt.linebreak = true -- Companion to wrap, don't split words

vim.opt.autowrite = true -- Enable autowrite
vim.opt.undofile = true -- Save undo history
vim.opt.undolevels = 10000 -- Save 10000 undo history max
vim.opt.backup = false -- Don't create backup files
vim.opt.writebackup = false -- if a file is being edited by another program, it is not allowed to be edited
vim.opt.swapfile = false -- Don't created swap files

vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- unless capital letters are in the search term
vim.opt.hlsearch = true -- highlight the search term

vim.opt.signcolumn = "yes" -- Keep signcolumn on by default, useful in LSP and Git. Otherwise text shifts a lot

vim.opt.updatetime = 250 -- Decreate update time to swap file
vim.opt.timeoutlen = 300 -- Decrease mapped keymap sequence wait time (jk mapping for example)

vim.opt.inccommand = "nosplit" -- Preview substitution live in a split window, as you type

vim.opt.cursorline = false -- Don't highlight the entire line where the cursor is

vim.opt.scrolloff = 4 -- Minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 4 -- Minimal number of screen characters to scroll while navigating horizontally

vim.opt.termguicolors = true -- Enable termguicolors to make some colorschemes happy
vim.opt.background = "dark" -- Background color preference

vim.opt.conceallevel = 3 -- Hide markup for bold and italic
-- vim.opt.concealcursor = "nvic"      -- Modes in which text in the cursor line appears concealed
vim.opt.virtualedit = "block,onemore" -- Useful for rect selection (use <C-q> in windows) and <C-o> movement in Insert mode

vim.opt.fileencoding = "utf-8" -- Default file encoding to utf-8

vim.opt.shortmess:append("Is") -- No intro msg and no "Search hit BOTTOM" message
vim.opt.iskeyword:append("-") -- Consider hyphenated words as a single word

vim.opt.cmdheight = 0

-- Use rg
vim.opt.grepprg = [[rg --glob "!.git" --no-heading --vimgrep --follow $*]]
vim.opt.grepformat = vim.opt.grepformat ^ { "%f:%l:%c:%m" }

-- Tab settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 4 -- During indentation (>>/<<) how much space to add
vim.opt.tabstop = 4 -- Visual guide to show how many space to show for tab key
vim.opt.softtabstop = 4
vim.opt.shiftround = true

-- :h fo-table. Format options
vim.opt.formatoptions = {}
vim.opt.formatoptions = {
  ["1"] = true, -- Don't break after one letter word
  ["2"] = true, -- Use indent from 2nd line of a paragraph
  q = true, -- Continue comments with gq"
  n = true, -- Recognize numbered list
  l = true, -- Don't format when a line is alredy longer than textwidth when insert started
  j = true, -- Remove comment leader when joining lines
  v = true, -- Only break at a blank during the current insert command
  r = false, -- Don't continue comments when pressing enter
  o = false, -- Don't insert comment leader during o or O in normal mode
  c = false, -- Don't auto-wrap comments using textwidth
  t = false, -- Don't auto-wrap text using textwidth
}

-- How splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display some whitespace characters in the editor
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", trail = "·", extends = "»", precedes = "«", eol = "¬", nbsp = "␣" }

-- Insert mode completion options
-- Open a popup menu with possible completion options, even if there is only one possibility
-- Don't select anything unless I've selected an option
vim.opt.completeopt = "menu,menuone,noinsert,noselect,popup"
vim.opt.pumblend = 20 -- popup blend
vim.opt.pumheight = 10 -- no. of entries in the popup

-- Sync clipboard between OS and Neovim
-- Schedule the setting after 'UiEnter' because it can increase the startup-time.
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)
