return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", opt = true },
    },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'molokai'
            },
            sections = {
                lualine_a = {
                    'mode',
                    'searchcount',
                    {
                        'buffers',
                        mode = 1, -- Display only the buffer index
                    }
                },
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {
                    {
                        'filename',
                        path = 3, -- Display absolute path with ~ for home directory
                    }
                },
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location', '%b %B', '%h%m%r'} -- location, ASCII & Hex, [Help][Read Only] flags
            },
            extensions = {
                "neo-tree",
            },
        })
    end
}
