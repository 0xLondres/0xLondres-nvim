local kind_icons = {
	Text = "󰉿",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰜢",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "󰈇",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "󰙅",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰊄",
}

return {
	{
		"hrsh7th/cmp-nvim-lsp",
		dependencies = {
			"hrsh7th/cmp-emoji",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				completion = {
					completeopt = "menu, menuone, noinsert" .. (auto_select and "" or ",noselect"),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-c>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<TAB>"] = cmp.mapping.select_next_item(),
					["<S-TAB>"] = cmp.mapping.select_prev_item(),
				}),
				sources = cmp.config.sources({
					{ name = "lazydev" },
					{ name = "nvim_lsp", duplicate = 0 },
					{ name = "path", duplicate = 0 },
				}, {
					{ name = "buffer", keyword_length = 4, duplicate = 0 },
					{ name = "emoji", duplicate = 0 },
				}),
				formatting = {
					fields = { "kind", "abbr" },
					format = function(_, item)
						-- ícono a la izquierda
						if kind_icons[item.kind] then
							item.kind = kind_icons[item.kind]
						end

						-- truncar texto largo
						local max_width = 40
						if vim.fn.strdisplaywidth(item.abbr) > max_width then
							item.abbr = vim.fn.strcharpart(item.abbr, 0, max_width - 1) .. "…"
						end

						return item
					end,
				},
			})
		end,
	},
}
