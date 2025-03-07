return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
                cond = function()
                    return vim.fn.executable 'cmake' == 1
                end,
            },
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "nvim-telescope/telescope-frecency.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "xiyaowong/telescope-emoji.nvim",
            "ghassan0/telescope-glyph.nvim",
        },

        config = function()
            local telescope = require("telescope")
            local builtins = require("telescope.builtin")
            local actions = require("telescope.actions")

            telescope.setup({
                defaults = {
                    path_display = { "smart" },
                    mappings = {
                        i = {
                            ["<C-n>"] = actions.move_selection_next,
                            ["<C-p>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<Esc>"] = actions.close,
                        },
                        n = {
                            ["q"] = actions.close,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        file_ignore_patterns = { "node_modules", ".git", ".venv" },
                        hidden = true,
                    },
                    buffers = {
                        initial_mode = "normal",
                        sort_lastused = true,
                        -- sort_mru = true,
                        mappings = {
                            n = {
                                ["<C-n>"] = actions.move_selection_next,
                                ["<C-p>"] = actions.move_selection_previous,
                                ["<C-j>"] = actions.move_selection_next,
                                ["<C-k>"] = actions.move_selection_previous,
                                ["<Esc>"] = actions.close,
                                ["d"] = actions.delete_buffer,
                            },
                        },
                    },
                },
                live_grep = {
                    file_ignore_patterns = { "node_modules", ".git", ".venv" },
                    additional_args = function(_)
                        return { "--hidden" }
                    end,
                },
                path_display = {
                    filename_first = {
                        reverse_directories = true,
                    },
                },
                extensions = {
                    fzf = {},
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
                git_files = {
                    previewer = false,
                },
            })

            telescope.load_extension("fzf")
            telescope.load_extension("ui-select")
            telescope.load_extension("frecency")
            telescope.load_extension("file_browser")
            telescope.load_extension("emoji")
            telescope.load_extension("glyph")

            vim.keymap.set("n", "<leader>fb", builtins.buffers, { noremap = true, silent = true, desc = "[F]ind [B]uffers" })
            vim.keymap.set("n", "<leader>fd", builtins.diagnostics, { noremap = true, silent = true, desc = "[F]ind [D]iagnostics for all open buffers" })
            vim.keymap.set("n", "<leader>ff", builtins.find_files, { noremap = true, silent = true, desc = "[F]ind [F]iles in pwd" })
            vim.keymap.set("n", "<leader>fg", builtins.live_grep, { noremap = true, silent = true, desc = "[F]ind string in files by [G]rep" })
            vim.keymap.set("n", "<leader>fh", builtins.help_tags, { noremap = true, silent = true, desc = "[F]ind telescope [H]elp docs" })
            vim.keymap.set("n", "<leader>fl", builtins.loclist, { noremap = true, silent = true, desc = "[F]ind [L]oclist items for the current window" })
            vim.keymap.set("n", "<leader>fm", builtins.marks, { noremap = true, silent = true, desc = "[F]ind [M]arks" })
            vim.keymap.set("n", "<leader>fq", builtins.quickfix, { noremap = true, silent = true, desc = "[F]ind [Q]uickfix items" })
            vim.keymap.set("n", "<leader>fr", builtins.oldfiles, { noremap = true, silent = true, desc = "[F]ind from [R]ecent files" })
            vim.keymap.set("n", "<leader>fw", builtins.grep_string, { noremap = true, silent = true, desc = "[F]ind [W]ord under cursor in pwd" })

            vim.keymap.set("n", "<leader>fs", function()
                builtins.lsp_document_symbols {
                    symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module", "Property" },
                }
            end, { noremap = true, silent = true, desc = "[F]ind LSP document [S]ymbols in the current buffer" })

            vim.keymap.set("n", "<leader>tf", ":Telescope file_browser<CR>", { noremap = true, silent = true, desc = "Open [t]elescope [f]ile browser extension" })
            vim.keymap.set("n", "<leader>te", ":Telescope emoji<CR>", { noremap = true, silent = true, desc = "Open [t]elescope [e]moji extension" })
            vim.keymap.set("n", "<leader>tg", ":Telescope glyph<CR>", { noremap = true, silent = true, desc = "Open [t]elescope [g]lyph extension" })
            vim.keymap.set("n", "<leader>tr", ":Telescope frecency<CR>", { noremap = true, silent = true, desc = "Open [t]elescope f[r]ecency extension" })

            vim.keymap.set("n", "<leader>en", function()
                builtins.find_files { cwd = vim.fn.stdpath("config") }
            end, { desc = "Edit Neovim config files" })
            vim.keymap.set("n", "<leader>ep", function()
                ---@diagnostic disable-next-line
                builtins.find_files { cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") }
            end, { desc = "Edit Neovim package files" })

        end,
    },
}
