return {
    {
        -- mason package manager for LSP servers
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        -- allows mason to talk to lspconfig
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                -- ensures that the LSPs in the table below are installed in the config
                -- lua_ls: lua, tsserver: javascript, pyright: python, html: html, cssls: css
                ensure_installed = { "lua_ls", "tsserver", "pyright", "html", "cssls" },
            })
        end,
    },
    {
        -- configures the LSPs (duh)
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- run the setup function for any LSPs that are installed/required
            lspconfig.lua_ls.setup({})
            lspconfig.tsserver.setup({})
            lspconfig.pyright.setup({})
            lspconfig.html.setup({})
            lspconfig.cssls.setup({})

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
