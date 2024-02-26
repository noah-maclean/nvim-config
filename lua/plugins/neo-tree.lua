-- neo-tree for a file tree
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        -- set keymaps for neo-tree
        -- Ctrl + n reveals file tree on the left
        vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
    end
}

