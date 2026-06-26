return {
    "Mathijs-Bakker/godotdev.nvim",
    dependencies = { "nvim-dap", "nvim-dap-ui", "nvim-treesitter" },
    opts = {
        formatter = false,
    },
    config = function(_, opts)
        require("godotdev").setup(opts)

        local callback = function()
            _G.gdscript_indent = function()
                local lnum = vim.fn.prevnonblank(vim.v.lnum - 1)
                if lnum == 0 then
                    return 0
                end

                local prev_line = vim.fn.getline(lnum)
                local ind = vim.fn.indent(lnum)

                -- 上一行以 : 结尾则增加缩进
                if prev_line:match(":%s*$") then
                    ind = ind + vim.fn.shiftwidth()
                end

                return ind
            end
            vim.opt_local.indentexpr = "v:lua.gdscript_indent()"
        end

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "gdscript",
            callback = callback,
        })
    end,
}
