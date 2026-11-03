return {
	{
		"coder/claudecode.nvim",
		lazy = false,
		dependencies = { "folke/snacks.nvim" },
		config = function()
			require("claudecode").setup({})
		end,
		keys = {
			{ "<leader>a", nil, desc = "AI/Claude Code" },
			{
				"<leader>ac",
				function()
					local buf = vim.api.nvim_get_current_buf()
					local name = vim.api.nvim_buf_get_name(buf)
					if #vim.api.nvim_list_wins() == 1 and name == "" then
						vim.cmd("enew")
					end
					vim.cmd("ClaudeCode")
				end,
				desc = "Toggle Claude",
			},
			{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude", mode = { "n", "t" } },
			{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
			{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
			{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select model" },
			{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection to Claude" },
			{
				"<leader>as",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file to Claude",
				ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
			},
			{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
			{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Reject diff" },
		},
		opts = {
			terminal = {
				split_side = "right",
				split_width_percentage = 0.40,
				provider = "snacks",
				auto_close = true,
				-- Terminal-mode key to hide the Claude panel and return focus to code.
				-- You can also use <C-h> (mapped in keymaps.lua) to jump directly
				-- from the Claude terminal to the left code window.
				snacks_win_opts = {
					keys = {
						claude_hide = {
							"<leader>af",
							function(self)
								self:hide()
							end,
							mode = "t",
							desc = "Hide Claude panel",
						},
						claude_scroll_up = {
							"<ScrollWheelUp>",
							function()
								vim.cmd("stopinsert")
								vim.cmd("normal! 3<C-y>")
								vim.cmd("startinsert")
							end,
							mode = "t",
							desc = "Scroll Claude window up",
						},
						claude_scroll_down = {
							"<ScrollWheelDown>",
							function()
								vim.cmd("stopinsert")
								vim.cmd("normal! 3<C-e>")
								vim.cmd("startinsert")
							end,
							mode = "t",
							desc = "Scroll Claude window down",
						},
					},
				},
			},
			diff_opts = {
				layout = "vertical",
				open_in_new_tab = false,
				keep_terminal_focus = false,
			},
		},
	},
}
