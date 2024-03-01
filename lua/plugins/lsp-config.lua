return {
    {
        -- mason package manager for LSP servers
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        -- allows mason to talk to lspconfig
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        }
    },
    {
        -- configures the LSPs (duh)
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            -- allows completions to be used with the lsp data
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")

            -- run the setup function for any LSPs that are installed/required
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities
            })
            lspconfig.pyright.setup({
                capabilities = capabilities
            })
            lspconfig.html.setup({
                capabilities = capabilities
            })
            lspconfig.cssls.setup({
                capabilities = capabilities
            })

            -- keymaps for information from LSPs
            -- K gives information about the text under the cursor
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            -- gd (go to definition) takes you to the definition of the text/function under the cursor
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            -- <leader>ca loads the code actions
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
