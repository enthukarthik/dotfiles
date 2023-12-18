return { 
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {
                "bash", 
                "c", 
                "cpp", 
                "css",
                "clojure", 
                "cmake", 
                "dockerfile", 
                "erlang", 
                "glsl", 
                "haskell", 
                "html", 
                "java", 
                "javascript", 
                "json", 
                "latex", 
                "lua", 
                "make",
                "python",
                "tsx",
                "vim",
                "vimdoc"
            },
            highlight = { enable = true },
            indent = { enable = true },  
            autotag = { enable = true },
        })
    end
}
