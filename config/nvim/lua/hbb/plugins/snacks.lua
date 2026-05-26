return {
    "folke/snacks.nvim",
    dependencies = { "folke/trouble.nvim" },
    priority = 1000,
    lazy = false,
    opts = {
        animate = { enabled = false },
        bigfile = { enabled = true },
        bufdelete = { enabled = true },
        dashboard = { enabled = false },
        debug = { enabled = true },
        dim = { enabled = false },
        explorer = { enabled = true },
        gh = { enabled = false },
        git = { enabled = false },
        gitbrowse = { enabled = false },
        image = { enabled = false },
        indent = {
            enabled = true,
            indent = { char = "┊" },
            scope = { enabled = false },
        },
        input = { enabled = true },
        keymap = { enabled = true },
        layout = { enabled = true },
        lazygit = { enabled = false },
        notifier = { enabled = true },
        notify = { enabled = true },
        picker = {
            enabled = true,
            exclude = { "*.uid", ".import" },
            layout = {
                preset = "dropdown",
            },
            layouts = {
                dropdown = {
                    layout = {
                        width = 0.667,
                        height = 0.999,
                    },
                },
            },
            win = {
                input = {
                    keys = {
                        ["<c-q>"] = { "cancel", mode = "i" },
                    },
                },
            },
        },
        profiler = { enabled = true },
        quickfile = { enabled = true },
        rename = { enabled = true },
        scope = { enabled = true },
        scratch = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = true },
        terminal = { enabled = true },
        toggle = { enabled = true },
        util = { enabled = true },
        win = { enabled = true },
        words = { enabled = false },
        zen = { enabled = true },
    },
    init = function()
        vim.g.snacks_animate = false
        vim.b.snacks_animate = false
    end,
    -- stylua: ignore start
    keys = {
        { "<leader>up", function() Snacks.terminal("zsh") end, desc = "Float terminal" },
        { "<leader>e", function() Snacks.explorer() end, desc = "File explorer" },
        { "<leader>so", function() Snacks.zen.zoom() end, desc = "Focus pane" },
        { "<leader>z", function() Snacks.zen() end, desc = "Zen mode" },
        -- Pickers
        { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart find files" },
        { "<leader>p", function() Snacks.picker.files() end, desc = "Find files" },
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
        { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find git files" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
        { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>fc", function() Snacks.picker.files({cwd = vim.fn.stdpath("config")}) end, desc = "Configs" },
        -- Grep and search
        { "<leader>sa", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>sb", function() Snacks.picker.grep_buffers() end, desc = "Grep buffers" },
        { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
        { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer diagnostics" },
        { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command history" },
        -- LSP
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto definition" },
        { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto declaration" },
        { "gR", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
        { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto implementation" },
        { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto t[y]pe definition" },
        { "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls incoming" },
        { "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls outgoing" },
        { "<leader>w", function() Snacks.picker.lsp_symbols() end, desc = "LSP symbols" },
        { "<leader>W", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP workspace symbols" },
    },
    -- stylua: ignore end
}
