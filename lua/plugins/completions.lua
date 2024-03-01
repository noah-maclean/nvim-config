-- all plugins needed for completions in nvim
return {
    {
        -- uses lsp data in cmp
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        -- luasnip for the snippets
        "L3MON4D3/LuaSnip",
        dependencies = {
            -- completion luasnip to perform the completions
            "saadparwaiz1/cmp_luasnip",
            -- friendly snippets for VSCode-like snippets
            "rafamadriz/friendly-snippets",
        },
    },
    {
        -- nvim-cmp is the completion engine that sources external completion sources
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            -- loads the snippets from friendly snippets
            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                snippet = {
                    expand = function(args)
                        -- using luasnip as the snippet expansion/engine
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    -- gives the window a border
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- For luasnip users.
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
}
