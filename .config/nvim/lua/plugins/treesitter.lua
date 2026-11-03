return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"css",
				"scss",
				"gitignore",
				"go",
				"graphql",
				"http",
				"rust",
				"sql",
				"ruby",
				"embedded_template",
				"angular",
				"tsx",
				"typescript",
				"javascript",
				"toml",
			},
		},
		init = function()
			-- MDX
			vim.filetype.add({
				extension = {
					mdx = "mdx",
				},
			})
			vim.treesitter.language.register("markdown", "mdx")
		end,
	},
}
