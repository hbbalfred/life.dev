return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        highlight = {
            after = "",
        },
    },
    keys = {
        -- stylua: ignore start
        { "<leader>todo", function() Snacks.picker.todo_comments() end, desc = "Todo", },
        -- stylua: ignore end
    },
}
