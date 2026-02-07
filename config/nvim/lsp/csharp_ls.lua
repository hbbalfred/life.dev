local function root_pattern(...)
    local patterns = { ... }
    return function(fname)
        local dir = vim.fs.dirname(fname)
        while dir do
            for _, pattern in ipairs(patterns) do
                if #vim.fn.glob(vim.fs.joinpath(dir, pattern)) > 0 then
                    return dir
                end
            end
            local parent_dir = vim.fs.dirname(dir)
            if parent_dir == dir then
                break
            end
            dir = parent_dir
        end
        return nil
    end
end

return {
    cmd = function(dispatchers, config)
        return vim.lsp.rpc.start({ "csharp-ls" }, dispatchers, {
            -- csharp-ls attempt to locate sln, slnx or csproj files from cwd, so set cwd to root directory.
            -- If cmd_cwd is provided, use it instead.
            cwd = config.cmd_cwd or config.root_dir,
            env = config.cmd_env,
            detached = config.detached,
        })
    end,
    root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        on_dir(root_pattern("*.sln")(fname) or root_pattern("*.csproj")(fname) or root_pattern("*.slnx")(fname))
    end,
    filetypes = { "cs" },
    init_options = {
        AutomaticWorkspaceInit = true,
    },
    get_language_id = function(_, ft)
        if ft == "cs" then
            return "csharp"
        end
        return ft
    end,
}
