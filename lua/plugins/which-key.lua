return {
	"folke/which-key.nvim",
	dependencies = {
		"nvim-mini/mini.icons",
	},
	config = function()
		require("which-key").setup({})
	end,
}
