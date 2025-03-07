-- Modes
-- n = normal mode
-- i = insert mode
-- v = visual mode
-- x = visual block mode
-- t = terminal mode
-- c = command mode

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disable <Space> key in normal and visual modes 
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Easy escape to normal mode
vim.keymap.set({ "i", "v" }, "jk", "<Esc>",{ noremap = true, silent = true, desc = "Escape to normal mode,from INSERT or VISUAL, quicker with jk" })

-- Allow moving the cursor through wrapped lines with j, k
vim.keymap.set({ "n" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Disable arrow keys in the normal mode
vim.keymap.set({ "n" }, "<Left>", "<cmd>echo 'Use h to move!!'<CR>")
vim.keymap.set({ "n" }, "<Right>", "<cmd>echo 'Use l to move!!'<CR>")
vim.keymap.set({ "n" }, "<Up>", "<cmd>echo 'Use k to move!!'<CR>")
vim.keymap.set({ "n" }, "<Down>", "<cmd>echo 'Use j to move!!'<CR>")

-- Scroll and find things and center it on the buffer
vim.keymap.set({ "n" }, "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Scroll down and center" })
vim.keymap.set({ "n" }, "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "Scroll up and center" })
vim.keymap.set({ "n" }, "n", "nzz", { noremap = true, silent = true, desc = "Find next and center" })
vim.keymap.set({ "n" }, "N", "Nzz", { noremap = true, silent = true, desc = "Find prev and center" })

-- Movement between panes
vim.keymap.set({ "n" }, "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Move focus to the left window" })
vim.keymap.set({ "n" }, "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Move focus to the lower window" })
vim.keymap.set({ "n" }, "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Move focus to the upper window" })
vim.keymap.set({ "n" }, "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Move focus to the right window" })

-- Spliting window panes
vim.keymap.set({ "n" }, "<leader>sv", "<C-w>v", { noremap = true, silent = true, desc = "Split window vertically" })
vim.keymap.set({ "n" }, "<leader>sh", "<C-w>s", { noremap = true, silent = true, desc = "Split window horizontally" })
vim.keymap.set({ "n" }, "<leader>se", "<C-w>=", { noremap = true, silent = true, desc = "Make split window panes equal in size" })
vim.keymap.set({ "n" }, "<leader>so", "<C-w>o", { noremap = true, silent = true, desc = "Close all but the current window" })
vim.keymap.set({ "n" }, "<leader>sx", ":close<CR>", { noremap = true, silent = true, desc = "Close the current split window" })

-- Resize window panes with arrow keys
vim.keymap.set({ "n" }, "<C-Up>", ":resize +2<CR>", { noremap = true, silent = true, desc = "Increase the pane window size horizontally" })
vim.keymap.set({ "n" }, "<C-Down>", ":resize -2<CR>", { noremap = true, silent = true, desc = "Decrease the pane window size horizontally" })
vim.keymap.set({ "n" }, "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true, desc = "Increase the pane window size vertically" })
vim.keymap.set({ "n" }, "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true, desc = "Decrease the pane window size vertically" })

-- Movement between buffers
vim.keymap.set({ "n" }, "<Tab>", "<cmd>bnext<CR>", { noremap = true, silent = true, desc = "Move to the next buffer" })
vim.keymap.set({ "n" }, "<S-Tab>", "<cmd>bprevious<CR>", { noremap = true, silent = true, desc = "Move to the previous buffer" })
vim.keymap.set({ "n" }, "<leader>x", "<cmd>bdelete<CR>", { noremap = true, silent = true, desc = "Close the buffer" })

-- Tabs
vim.keymap.set({ "n" }, "<leader>to", ":tabnew<CR>", { noremap = true, silent = true, desc = "New tab" })
vim.keymap.set({ "n" }, "<leader>tx", ":tabclose<CR>", { noremap = true, silent = true, desc = "Close tab" })
vim.keymap.set({ "n" }, "<leader>tn", ":tabn<CR>", { noremap = true, silent = true, desc = "Next tab" })
vim.keymap.set({ "n" }, "<leader>tp", ":tabp<CR>", { noremap = true, silent = true, desc = "Previous tab" })

-- Move text up or down
vim.keymap.set({ "x" }, "<S-j>", ":m '>+1<CR>gv-gv", { noremap = true, silent = true, desc = "Move selected text down" })
vim.keymap.set({ "x" }, "<S-k>", ":m '<-2<CR>gv-gv", { noremap = true, silent = true, desc = "Move selected text up" })

-- Better terminal navigation
vim.keymap.set({ "t" }, "<C-h>", "<C-\\><C-n><C-w>h", { noremap = true, silent = true, desc = "Move from terminal to the left pane" })
vim.keymap.set({ "t" }, "<C-j>", "<C-\\><C-n><C-w>j", { noremap = true, silent = true, desc = "Move from terminal to the below pane" })
vim.keymap.set({ "t" }, "<C-k>", "<C-\\><C-n><C-w>k", { noremap = true, silent = true, desc = "Move from terminal to the above pane" })
vim.keymap.set({ "t" }, "<C-l>", "<C-\\><C-n><C-w>l", { noremap = true, silent = true, desc = "Move from terminal to the right pane" })
vim.keymap.set({ "t" }, "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })
vim.keymap.set({ "t" }, "jk", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })

-- Visual selection remains after indentation
vim.keymap.set({ "v", "x" }, ">", ">gv", { noremap = true, silent = true, desc = "Select the same visual selection once we're done with indentation" })
vim.keymap.set({ "v", "x" }, "<", "<gv", { noremap = true, silent = true, desc = "Select the same visual selection once we're done with indentation" })

-- Other keybindings
vim.keymap.set({ "n" }, "x",'"_x' , { noremap = true, silent = true, desc = "Single char deletion shouldn't change register" })
vim.keymap.set({ "v" }, "p",'"_dP' , { noremap = true, silent = true, desc = "Pasting small content shouldn't change yank register" })
vim.keymap.set({ "n" }, "<Esc>", "<cmd>nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear highlighted text when pressing Esc in normal mode" })
vim.keymap.set({ "n" }, "<leader>sa", "ggVG", { noremap = true, silent = true, desc = "Select all..." })
vim.keymap.set({ "n" }, "<leader>ia", "gg=G", { noremap = true, silent = true, desc = "Indent all..." })
vim.keymap.set({ "n" }, "<leader>rm", ":%s/<C-q><C-m>//g<CR>", { noremap = true, silent = true, desc = "Remove ^M from text copied from windows to linux" })
vim.keymap.set({ "n" }, "<leader>p", "<cmd>Lazy<CR>", { noremap = true, silent = true, desc = "Launch plugin manager" })
vim.keymap.set({ "n" }, "<leader>q", "<cmd>wqa!<CR>", { noremap = true, silent = true, desc = "Save all and quit Neovim" })
vim.keymap.set({ "n" }, "<leader>sn","<cmd>noautocmd w<CR>", { noremap = true, silent = true, desc = "Save file without any autoformatting" })
vim.keymap.set({ "n" }, "<leader>w", "<cmd>w!<CR>", { noremap = true, silent = true, desc = "Save current file" })
vim.keymap.set({ "n" }, "<leader>tw", "<cmd>set wrap!<CR>", { noremap = true, silent = true, desc = "Toggle wrap" })

-- Toggle diagnostics
vim.keymap.set({ "n" }, "<leader>do", function()
    vim.diagnostic.enable(not vim.diagnostic.isenabled())
end)

-- Diagnostic keymaps
vim.keymap.set({ "n" }, "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set({ "n" }, "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set({ "n" }, "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set({ "n" }, "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Save and load session
vim.keymap.set({ "n" }, "<leader>ms", ":mksession! .session.vim<CR>", { noremap = true, silent = false, desc = "Save session" })
vim.keymap.set({ "n" }, "<leader>ls", ":source .session.vim<CR>", { noremap = true, silent = false, desc = "Load session" })
