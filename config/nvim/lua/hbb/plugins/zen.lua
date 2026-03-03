return {
    "folke/zen-mode.nvim",
    opts = {
        plugins = {
            alacritty = {
                enabled = true,
                font = "24",
            },
        },
    },
    keys = {
        { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    },
}
