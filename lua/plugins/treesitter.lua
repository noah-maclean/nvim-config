-- treesitter for highlighting and indenting
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- configure treesitter
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            -- automatically installs a language when a parser is not present
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
