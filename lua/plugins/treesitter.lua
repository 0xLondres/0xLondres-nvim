pcall(function()
	dofile(vim.g.base46_cache .. "syntax")
	dofile(vim.g.base46_cache .. "treesitter")
end)

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	init = function()
		local parsers = {
			"c",
			"cpp",
			"make",
			"python",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"markdown",
			"markdown_inline",
			"bash",
		}
		local installed = require("nvim-treesitter.config").get_installed()
		local to_install = vim.iter(parsers)
			:filter(function(p)
				return not vim.tbl_contains(installed, p)
			end)
			:totable()
		if #to_install > 0 then
			require("nvim-treesitter").install(to_install)
		end

		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
