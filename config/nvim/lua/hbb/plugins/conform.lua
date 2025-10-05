return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            rust = { "rustfmt", lsp_format = "fallback" },
            json = { "biome" },
            javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
            typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
            cs = { "csharpier", timeout_ms = 10000 },
            python = { "isort", "black", timeout_ms = 10000 },
            c = { "clang-format" },
            cpp = { "clang-format" },
        },
        -- log_level = vim.log.levels.DEBUG,
        formatters = {
            csharpier = {
                command = "csharpier",
                args = { "format" },
            },
        },
    },
}
