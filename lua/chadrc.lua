---@diagnostic disable: inject-field
---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "rosepine",
	theme_toggle = { "rosepine", "one_light" },
	transparency = false,
	changed_themes = {},
	hl_add = {},
	hl_override = {},
	integrations = {},
}

-- ADD THIS ENTIRE SECTION:
M.ui = {
	cmp = {
		icons_left = false, -- only for non-atom styles!
		lspkind_text = true,
		style = "default", -- default/flat_light/flat_dark/atom/atom_colored
		format_colors = {
			tailwind = false, -- will work for css lsp too
			icon = "󱓻",
		},
	},

	telescope = { style = "borderless" }, -- borderless / bordered

	statusline = {
		enabled = true,
		theme = "default", -- default/vscode/vscode_colored/minimal
		-- default/round/block/arrow separators work only for default statusline theme
		-- round and block will work for minimal theme only
		separator_style = "default",
		order = nil,
		modules = nil,
	},

	-- lazyload it when there are 1+ buffers
	tabufline = {
		enabled = true,
		lazyload = true,
		treeOffSetFt = "NvimTree",
		order = { "treeOffset", "buffers", "tabs", "btns" },
		modules = nil,
		bufwidth = 21,
	},
}

M.nvdash = {
	load_on_startup = true,
	header = {
		"███╗   ██╗███████╗██████╗ ██╗   ██╗",
		"████╗  ██║██╔════╝██╔══██╗██║   ██║",
		"██╔██╗ ██║█████╗  ██████╔╝██║   ██║",
		"██║╚██╗██║██╔══╝  ██╔══██╗╚██╗ ██╔╝",
		"██║ ╚████║███████╗██║  ██║ ╚████╔╝ ",
		"╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ",
		"                                   ",
		"        Powered By:  eovim       ",
		"           By: 0xLondres           ",
		"                                   ",
	},
	buttons = {
		{ txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
		{ txt = "  Recent Files", keys = "r", cmd = "Telescope oldfiles" },
		{ txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
		{ txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
		{ txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

		{ txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

		{
			txt = function()
				local stats = require("lazy").stats()
				local ms = math.floor(stats.startuptime) .. " ms"
				return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
			end,
			hl = "NvDashFooter",
			no_gap = true,
		},

		{ txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
	},
}

M.lsp = {
	signature = true,
}

M.cheatsheet = {
	theme = "grid",
	excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" },
}

M.colorify = {
	enabled = true,
	mode = "virtual",
	virt_text = "󱓻 ",
	highlight = {
		hex = true,
		lspvars = true,
	},
}

M.mason = {
	pkgs = {},
	skip = {},
}

return M
