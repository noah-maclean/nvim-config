-- telescope for fuzzy finding
return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")
            -- set keymaps for telescope
            -- Ctrl + p will search for files
            vim.keymap.set("n", "<C-p>", builtin.find_files, {})
            -- <leader>fg will search in open files (grep)
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        end,
    },
    {
        -- telescope ui select allows code actions to look nicer
        -- (show up by the code rather than at the bottom of the screen)
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
