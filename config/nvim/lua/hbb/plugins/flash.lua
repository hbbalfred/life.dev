return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = {
            char = {
                enabled = false,
            },
        },
        jump = {
            pos = "start",
            offset = 0,
        },
    },
    keys = {
    -- stylua: ignore start
    { "<leader>f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        -- { "<leader>ft", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        -- { "<leader>fs", mode = { "n", "x", "o" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        -- stylua: ignore end
    },
}
