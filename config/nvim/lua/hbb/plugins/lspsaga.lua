return {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
        require("lspsaga").setup({
            lightbulb = {
                enable = false,
            },
            rename = {
                keys = {
                    quit = "<Esc>",
                },
            },
            outline = {
                win_width = 50,
                keys = {
                    jump = "<CR>",
                },
            },
            callhierarchy = {
                keys = {
                    edit = "<CR>",
                },
            },
            finder = {
                keys = {
                    toggle_or_open = "<CR>",
                },
            },
        })
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
}
