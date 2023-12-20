local function map(mode, lhs, rhs, opts)
    -- set default value if nothing has been specified
    if opts.noremap == nil then
        opts.noremap = true
    end

    if opts.silent == nil then
        opts.silent = true
    end

    vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map({"n", "v"}, "<space>", "<Nop>", {})

map({"i", "v"}, "jk", "<Esc>", {})
map({"i", "v"}, "kj", "<Esc>", {})
map({"i", "v"}, "ii", "<Esc>", {})

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Movement between panes
map("", "<C-h>", "<C-w>h", {})
map("", "<C-j>", "<C-w>j", {})
map("", "<C-k>", "<C-w>k", {})
map("", "<C-l>", "<C-w>l", {})

map("n", "<leader>sv", "<C-w>v", {}) -- split window vertically
map("n", "<leader>sh", "<C-w>s", {}) -- split window horizontally
map("n", "<leader>se", "<C-w>=", {}) -- make split windows equal in height & width
map("n", "<leader>sx", ":close<CR>", {}) -- close the pane

-- Movement between buffers
map("n", "<A-j>", ":bnext<CR>", {})
map("n", "<A-k>", ":bprevious<CR>", {})
map("n", "<leader>bf", ":bfirst<CR>", {})
map("n", "<leader>bl", ":blast<CR>", {})
map("n", "<A-d>", ":bdelete<CR>", {})
map("n", "<leader>bd", ":bdelete!<CR>", {})

map("n", "<leader>nh", ":nohl<CR>", {}) -- clear search highlights

map("n", "<C-a>", "ggVG", {})
