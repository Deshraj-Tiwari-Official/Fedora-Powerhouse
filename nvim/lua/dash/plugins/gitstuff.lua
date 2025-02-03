return {
	-- Gitsigns: Show Git changes in the sign column
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "▌" },
					change = { text = "▌" },
					delete = { text = "▌" },
					topdelete = { text = "▌" },
					changedelete = { text = "▌" },
				},
			})
		end,
	},

  -- LazyGit: A simple git plugin for Neovim for the impatient
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
}
