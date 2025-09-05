return {
    cmd = { "clangd" },
    filetypes = {
        "c",
        "cpp",
        "objc",
        "objcpp",
        "cuda",
    },
    root_markers = {
        "compile_commands.json",
        "compile_flags.txt",
        ".clangd",
        "CMakeLists.txt",
        "Makefile",
        ".git",
    },
}
