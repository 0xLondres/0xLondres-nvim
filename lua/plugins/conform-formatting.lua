return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				c = { "clang-format" },
				tex = { "latexindent" },
				bash = { "shfmt" },
				sh = { "shfmt" },
				zsh = { "shfmt" },
				markdown = { "mdformat" },
			},
			format_on_save = {
				lps_fallback = true,
				async = false,
				time_out = 500,
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				time_out = 500,
			})
		end, {})
	end,
}
