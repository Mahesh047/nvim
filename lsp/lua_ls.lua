return {
	cmd = { 'lua-language-server' },

	filetypes = { 'lua' },

	root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git', },

	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
            diagonostics = {
                global = {
                    'vim',
                    'require'
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            },
		}

	},
    config = function()
        local capabilities = vim.lsp.protocol.get_client_capabilities()
        local lspconfig = vim.lsp.config
        lspconfig['lua_ls'].setup({capabilities = capabilities})
    end
}
