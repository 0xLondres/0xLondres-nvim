return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				automatic_enable = true,
				ensure_installed = {},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- No Snippets
			capabilities.textDocument.completion.completionItem.snippetSupport = false

			vim.lsp.config.lua_ls = {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			}

			vim.lsp.config.pyright = {
				capabilities = capabilities,
			}

			vim.lsp.config.clangd = {
				capabilities = capabilities,
			}

			vim.lsp.config.texlab = {
				capabilities = capabilities,
				settings = {
					texlab = {
						diagnostics = {
							ignoredPatterns = { ".*" },
						},
						experimental = {
							parser = false,
						},
					},
				},
			}

			vim.lsp.config.marksman = {
				capabilities = capabilities,
			}

			vim.lsp.config.bashls = {
				capabilities = capabilities,
			}

			vim.lsp.enable({
				"lua_ls",
				"pyright",
				"clangd",
				"texlab",
				"marksman",
				"bashls",
			})

			vim.diagnostic.config({
				signs = true,
				update_in_insert = true,
				virtual_text = true,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
