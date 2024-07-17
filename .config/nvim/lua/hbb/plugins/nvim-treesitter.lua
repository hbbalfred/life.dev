return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      highlight = { enable = true, },
      indent = { enable = true },
      autotag = { enable = true },
      auto_install = false,
      -- ensure these language parsers are installed
      ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "gitignore",
        "html",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "typescript",
        "vimdoc",
        "yaml",
      },
      -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    })
  end,
}
