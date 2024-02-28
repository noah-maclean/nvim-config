-- treesitter for highlighting and indenting
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- configure treesitter
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            -- ensure that these languages are installed
            ensure_installed = { "lua", "javascript", "c", "markdown", "python", "html", "css" },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
