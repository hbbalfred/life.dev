return {
    "voldikss/vim-floaterm",
    keys = {
        {
            "<leader>up",
            ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 zsh <CR>",
            { desc = "Float a terminal" },
        },
    },
}
