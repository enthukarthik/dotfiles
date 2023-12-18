return { 
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {"bash", "c", "cpp", "clojure", "cmake", "dockerfile", "erlang", "glsl", "haskell", "html", "java", "javascript", "json", "latex", "lua", "make" },
            highlight = { enable = true },
            indent = { enable = true },  
        })
    end
}
