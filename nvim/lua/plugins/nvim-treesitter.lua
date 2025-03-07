return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function ()
            local configs = require("nvim-treesitter.configs")
            local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

            configs.setup({
                -- The first 8 parsers must be installed
                ensure_installed = { "c", "lua", "luadoc", "vim", "vimdoc", "query", "markdown", "markdown_inline",
                    "angular", "arduino", "asm", "awk", "bash", "bibtex", "bicep", "c_sharp", "clojure", "cmake",
                    "comment", "commonlisp", "cpp", "css", "csv", "cuda", "diff", "disassembly", "dockerfile",
                    "doxygen", "editorconfig", "elixir", "erlang", "fish", "fsharp",
                    "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
                    "glsl", "go", "graphql", "haskell", "haskell_persistent", "hlsl", "html", "http",
                    "ini", "java", "javascript", "json", "jsonc", "json5", "jsonnet", "kotlin", "kusto", "latex",
                    "llvm", "luap", "make", "matlab", "nasm", "ninja", "objdump", "ocaml", "ocaml_interface",
                    "passwd", "pem", "perl", "php", "powershell", "printf", "python", "racket", "regex", "ruby",
                    "rust", "scala", "scheme", "slint", "sql", "ssh_config", "swift", "tcl", "tmux", "toml", "tsx",
                    "typescript", "wgsl", "xml", "yaml", "zig"
                },
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<Enter>",             -- Start selecting the treesitter node currently under the cursor
                        node_incremental = "<Enter>",           -- Expand the selection to the treesitter parent node
                        scope_incremental = false,                -- Select the entire scope for the node selected
                        node_decremental = "<Backspace>",       -- Decrease the selection to the treesitter child node
                    },
                },
                textobjects = {
                    select = {
                        enable = true,

                        -- Automatically jump forward to textobj if the cursor is not on any node,
                        -- similar to targets.vim
                        lookahead = true,

                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["aa"] = "@parameter.outer",
                            ["ia"] = "@parameter.inner",
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                            -- You can also use captures from other query groups like `locals.scm`
                            ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
                        },
                        -- You can choose the select mode (default is charwise 'v')
                        selection_modes = {
                            -- 'v' means select the capture group char by char during {action}
                            -- 'V' means select the capture group line by line during {action}
                            --      so if there is something on the line where capture group
                            --      starts or ends it also gets the {action}
                            -- 'C-v' (C-q in windows) starts block wise selection during {action}
                            --      virtualedit setting having "block" will make it less jarring
                            ['@parameter.outer'] = 'v',
                            ['@function.outer'] = 'v',
                            ['@class.outer'] = 'V',
                        },
                        -- If you set this to `true` (default is `false`) then any textobject is
                        -- extended to include preceding or succeeding whitespace. Succeeding
                        -- whitespace has priority in order to act similarly to the built-in
                        -- `ap`.
                        --
                        include_surrounding_whitespace = true,
                    },

                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>a"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<leader>A"] = "@parameter.inner",
                        },
                    },

                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]m"] = "@function.outer",
                            ["]]"] = { query = "@class.outer", desc = "Next class start" },
                            --
                            -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
                            -- ["]o"] = "@loop.*",
                            -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
                            --
                            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                            ["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
                            -- ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                        },
                        goto_next_end = {
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                        -- Below will go to either the start or the end, whichever is closer.
                        -- Use if you want more granular movements
                        -- Make it even more gradual by adding multiple queries and regex.
                        -- goto_next = {
                            --     ["]d"] = "@conditional.outer",
                            -- },
                            -- goto_previous = {
                                --     ["[d"] = "@conditional.outer",
                                -- }
                            },
                        },
                    })

                    -- Repeat movement with ; and ,
                    -- ensure ; goes forward and , goes backward regardless of the last direction
                    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
                    vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

                    -- vim way: ; goes to the direction you were moving.
                    -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
                    -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

                    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
                    vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
                    vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
                    vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
                    vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
                end
            }
        }
