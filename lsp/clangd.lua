return {
    cmd = { 'clangd'},
    root_markers = {'.git/', 'compile_commands.json', 'compile_flags.txt' },
    filetypes = { 'c', 'cpp' },
    -- init_options = {
    --     usePlaceholders = true,
    --     completeUnimported = true,
    --     clangdFileStatus = true,
    --     compilationDatabasePath = "./LJ.ECL/Output/Build/CMake",
    -- }

    config = function()
        local capabilities = vim.lsp.protocol.get_client_capabilities()
        local lspconfig = vim.lsp.config
        lspconfig['clangd'].setup({capabilities = capabilities})
    end
}
