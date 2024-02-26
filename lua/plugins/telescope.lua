-- telescope for fuzzy finding
return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require("telescope.builtin")
        -- set keymaps for telescope
        -- Ctrl + p will search for files
        vim.keymap.set("n", "<C-p>", builtin.find_files, {})
        -- <leader>fg will search in open files (grep)
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    end
}
