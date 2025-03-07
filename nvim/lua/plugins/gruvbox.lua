return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        transparent_mode = false,
    },
    config = function(_, opts)
        require("gruvbox").setup(opts)
        vim.cmd.colorscheme("gruvbox")

        local bg_transparency = false

        local toggle_transparency = function()
            bg_transparency = not bg_transparency
            local new_opts = {
                transparent_mode = bg_transparency
            }
            require("gruvbox").setup(new_opts)
            vim.cmd.colorscheme("gruvbox")
        end

        vim.keymap.set({ "n" }, "<leader>bg", toggle_transparency, { noremap = true, silent = true, desc = "Toggle background transparency" })
    end
}
