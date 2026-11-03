-- Tests de Jest (NestJS) desde el editor. Atajos en <leader>t (LazyVim test.core).
return {
	{
		"nvim-neotest/neotest",
		dependencies = { "nvim-neotest/neotest-jest" },
		opts = {
			adapters = {
				["neotest-jest"] = {
					jestCommand = "pnpm jest",
					cwd = function(path)
						return vim.fs.root(path, "package.json")
					end,
				},
			},
		},
	},
}
