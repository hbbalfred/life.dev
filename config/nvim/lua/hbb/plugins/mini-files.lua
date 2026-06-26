return {
    "echasnovski/mini.files",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    keys = {
        {
            "<leader>o",
            function()
                local mf = require("mini.files")
                mf.open(vim.api.nvim_buf_get_name(0), false)
                mf.reveal_cwd()
            end,
            desc = "Mini files",
        },
    },
    opts = {
        content = {
            filter = function(fs_entry)
                return not vim.endswith(fs_entry.name, ".uid") and not vim.endswith(fs_entry.name, ".import")
            end,
        },
        windows = {
            preview = true,
            width_preview = 80,
        },
        mappings = {
            close = "<ESC>",
            go_in = "<C-l>",
            go_in_plus = "<CR>",
            go_out = "H",
            go_out_plus = "<C-h>",
        },
    },
}
