-- treesitter for highlighting and indenting
return {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    -- configure treesitter
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
        -- ensure that these languages are installed
        ensure_install = {"lua", "javascript", "html", "css", "python"},
        highlight = { enable = true },
        indent = { enable = true } 
        })
    end
}




