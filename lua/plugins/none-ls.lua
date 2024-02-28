-- uses LSP data to give information like code actions, formatting and diagnostics
return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- lua formatting
                null_ls.builtins.formatting.stylua,
            },
        })

        -- <leader>gf will call the format function of the file
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
