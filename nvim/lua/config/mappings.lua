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

map({"i", "v"}, "jk", "<Esc>",{})
map({"i", "v"}, "kj", "<Esc>",{})
map({"i", "v"}, "ii", "<Esc>",{})
