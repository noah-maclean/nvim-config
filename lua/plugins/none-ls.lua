-- uses LSP data to give information like code actions, formatting and diagnostics
return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- lua formatter
                null_ls.builtins.formatting.stylua,
                -- prettier formatter
                null_ls.builtins.formatting.prettier,
                -- black formatter for python 
                null_ls.builtins.formatting.black,
                --isort formatter for python imports
                null_ls.builtins.formatting.isort,
                --biome formatting for javascript,
                null_ls.builtins.formatting.biome,
            },
        })

        -- <leader>gf will call the format function of the file
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
