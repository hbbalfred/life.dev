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

        kmap("<leader>ca", vim.lsp.buf.code_action, "Code actions", { "n", "v" })
        -- kmap("<leader>rrn", vim.lsp.buf.rename, "Rename without select")
        -- kmap("<leader>rn", function() return ":IncRename" .. vim.fn.expand("<cword>") end, "Rename")
        kmap("K", vim.lsp.buf.hover, "Signature")
        kmap("<C-h>", vim.lsp.buf.signature_help, "Signature", "i")
        kmap("<leader>F", require("conform").format, "Format")
    end,
})

vim.api.nvim_create_user_command("LspInfo", ":checkhealth vim.lsp", { desc = "Alias to `:checkhealth vim.lsp`" })

vim.api.nvim_create_user_command("LspLog", function()
    vim.cmd(string.format("tabnew %s", vim.lsp.log.get_filename()))
end, {
    desc = "Opens the Nvim LSP client log.",
})
