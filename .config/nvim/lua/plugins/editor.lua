return {
	-- Buscador (fzf-lua). LazyVim ya define <leader><space>, <leader>/ y los <leader>s*;
	-- acá van los atajos propios con ";".
	{
		"ibhagwan/fzf-lua",
		opts = {
			files = { hidden = true },
			grep = { hidden = true },
		},
		keys = {
			{ "<leader><leader>", "<cmd>FzfLua files<cr>", desc = "Find Files (cwd)" },
			{ ";f", "<cmd>FzfLua files<cr>", desc = "Find Files (cwd)" },
			{ ";r", "<cmd>FzfLua live_grep<cr>", desc = "Live grep (cwd, incluye ocultos)" },
			{ "\\\\", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
			{ ";t", "<cmd>FzfLua help_tags<cr>", desc = "Help" },
			{ ";;", "<cmd>FzfLua resume<cr>", desc = "Resume last picker" },
			{ ";e", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Diagnostics" },
			{ ";s", "<cmd>FzfLua treesitter<cr>", desc = "Treesitter symbols" },
			{
				"<leader>fP",
				function()
					require("fzf-lua").files({ cwd = require("lazy.core.config").options.root })
				end,
				desc = "Find Plugin File",
			},
		},
	},

	-- Explorador
	{
		"nvim-neo-tree/neo-tree.nvim",
		keys = {
			{ "sf", "<cmd>Neotree reveal<cr>", desc = "Explorer en el archivo actual" },
		},
	},

	-- Abrir el archivo en Bitbucket/GitHub (blame queda en <leader>gb de LazyVim)
	{
		"folke/snacks.nvim",
		keys = {
			{
				"<leader>go",
				function()
					Snacks.gitbrowse()
				end,
				desc = "Git Browse",
				mode = { "n", "x" },
			},
		},
	},
}
