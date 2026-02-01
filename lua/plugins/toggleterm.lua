return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				shade_terminals = true,
				start_in_insert = true,
			})
		end,
	},
}
