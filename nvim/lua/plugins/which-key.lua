return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")
		local spc_opts = {
			prefix = vim.g.mapleader,
		}
		local spc_mappings = {
			a = { "Alpha Homepage" },
			n = { "Filesystem Tree Toggle" },
			-- Telescope
			f = {
				name = "File Ops",
				f = { "Find File" },
				g = { "Live Grep" },
				r = { "Open Recent File" },
				n = { "New File" },
				e = { "Edit File" },
			},
			-- Mason and None-ls
			g = {
				name = "Code Ops",
				-- Mason
				h = { "Code Hover" },
				d = { "Code Definition" },
				r = { "Code References" },
				c = { "Code Action" },
				-- None-ls
				f = { "Code Format" },
			},
		}
		wk.register(spc_mappings, spc_opts)
	end,
}
