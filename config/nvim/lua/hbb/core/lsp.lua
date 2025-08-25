-- read filenames on lsp/ directory and enable those
local lsp_files = {}
local lsp_dir = vim.fn.stdpath("config") .. "/lsp/"

for _, file in ipairs(vim.fn.globpath(lsp_dir, "*.lua", false, true)) do
    -- Read the first line of the file
    local f = io.open(file, "r")
    local first_line = f and f:read("*l") or ""
    if f then
        f:close()
    end
    -- Only include the file if it doesn't start with "-- disable"
    if not first_line:match("^%-%- disable") then
        local name = vim.fn.fnamemodify(file, ":t:r") -- `:t` gets filename, `:r` removes extension
        table.insert(lsp_files, name)
    end
end

vim.lsp.enable(lsp_files)

vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then
            return
        end

        local kmap = function(keys, func, desc, mode)
            if desc then
                desc = "LSP: " .. desc
            end
            if not mode then
                mode = "n"
            end
            vim.keymap.set(mode, keys, func, { buffer = ev.buf, noremap = true, silent = true, desc = desc })
        end

        -- set keybinds
        kmap("gR", "<cmd>Telescope lsp_references<CR>", "Show LSP references") -- show definition, references
        kmap("gD", vim.lsp.buf.declaration, "Go to declaration") -- go to declaration
        kmap("gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions") -- show lsp definitions
        kmap("gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations") -- show lsp implementations
        kmap("gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions") -- show lsp type definitions

        kmap("<leader>ca", vim.lsp.buf.code_action, "See available code actions", { "n", "v" }) -- see available code actions, in visual mode will apply to selection

        kmap("<leader>rrn", vim.lsp.buf.rename, "Rename without select") -- smart rename
        kmap("<leader>rn", "<cmd>Lspsaga rename<CR>", "Rename within select") -- smart rename

        kmap("<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics") -- show  diagnostics for file
        kmap("<leader>d", vim.diagnostic.open_float, "Show line diagnostics") -- show diagnostics for line
        kmap("[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Go to previous diagnostic") -- jump to previous diagnostic in buffer
        kmap("]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Go to next diagnostic") -- jump to next diagnostic in buffer

        kmap("K", vim.lsp.buf.hover, "Show documentation for what is under cursor") -- show documentation for what is under cursor
        kmap("<C-h>", vim.lsp.buf.signature_help, "Show LSP signature", "i")

        kmap("<leader>vv", "<cmd>Lspsaga incoming_calls<CR>", "Hierarchy incoming calls") -- https://nvimdev.github.io/lspsaga/callhierarchy/
        kmap("<leader>vV", "<cmd>Lspsaga outgoing_calls<CR>", "Hierarchy outgoing calls") -- https://nvimdev.github.io/lspsaga/callhierarchy/
        kmap("<leader>vo", "<cmd>Lspsaga outline<CR>", "Outline") -- https://nvimdev.github.io/lspsaga/outline/
        kmap("<leader>va", "<cmd>Lspsaga finder<CR>", "Finder") -- https://nvimdev.github.io/lspsaga/finder/

        kmap("<leader>rs", "<cmd>LspRestart<CR>", "Restart LSP") -- mapping to restart lsp if necessary

        -- kmap('n', '<leader>F', vim.lsp.buf.format, opts)
        kmap("<leader>F", require("conform").format, "Format current buffer with LSP")
    end,
})

vim.api.nvim_create_user_command("LspInfo", ":checkhealth vim.lsp", { desc = "Alias to `:checkhealth vim.lsp`" })

vim.api.nvim_create_user_command("LspLog", function()
    vim.cmd(string.format("tabnew %s", vim.lsp.log.get_filename()))
end, {
    desc = "Opens the Nvim LSP client log.",
})

