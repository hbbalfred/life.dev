return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            pickers = {
                lsp_references = {
                    fname_width = 40,
                    path_display = {
                        shorten = { len = 1, exclude = { 1, -1 } },
                    },
                },
            },
            defaults = {
                sorting_strategy = "ascending",
                layout_strategy = "vertical",
                layout_config = {
                    prompt_position = "top",
                    width = 0.6,
                    preview_cutoff = 1,
                    preview_height = 0.6,
                },
                file_ignore_patterns = {
                    "%.meta", -- unity
                },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        ["<C-q>"] = actions.close,
                        -- ['<C-h>'] = actions.select_horizontal,
                        ["<C-x>"] = actions.delete_buffer,
                        ["<C-p>"] = actions.send_to_qflist + actions.open_qflist,
                    },
                    n = {
                        ["q"] = actions.close,
                        ["<C-q>"] = actions.close,
                    },
                },
            },
        })

        telescope.load_extension("fzf")
    end,
}
