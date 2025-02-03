return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional for file icons
	config = function()
		local fzflua = require("fzf-lua")
		local map = vim.keymap.set

		-- General FzfLua setup with advanced features
		fzflua.setup({
			winopts = {
				height = 0.85, -- Window height
				width = 0.80, -- Window width
				preview = {
					vertical = "up:45%",
					layout = "flex",
				},
			},
			fzf_opts = {
				["--ansi"] = "",
				["--prompt"] = "> ",
				["--info"] = "inline",
				["--height"] = "100%",
				["--layout"] = "reverse",
				["--preview-window"] = "right:50%",
			},
			files = {
				prompt = "Files❯ ",
				cmd = 'rg --files --hidden --follow -g "!.git/*"', -- Faster file searching with rg
			},
			git = {
				files = {
					prompt = "Git Files❯ ",
					cmd = "git ls-files --exclude-standard",
				},
			},
			grep = {
				prompt = "Rg❯ ",
				input_prompt = "Grep For❯ ",
				cmd = "rg --vimgrep --hidden",
			},
			buffers = {
				prompt = "Buffers❯ ",
				show_all_buffers = true,
				sort_lastused = true,
			},
			diagnostics = {
				prompt = "Diagnostics❯ ",
			},
		})

        -- stylua: ignore start

        -- Keybindings
        map("n", "<leader>pf", function() fzflua.files() end) -- Project files
        map("n", "<C-P>", function() fzflua.git_files() end)  -- Git files
        map("n", "<leader>ps", function()
            fzflua.grep({ search = vim.fn.input("Grep > ") }) -- Grep with input prompt
        end)

        -- Search word under cursor in project-wide files
        map("n", "<leader>sw", function() fzflua.grep_cword() end)

        -- LSP Integration
        map("n", "<leader>sd", function() fzflua.lsp_definitions() end)     -- Definitions
        map("n", "<leader>sr", function() fzflua.lsp_references() end)      -- References
        map("n", "<leader>si", function() fzflua.lsp_implementations() end) -- Implementations

        -- Git status, commits, branches
        map("n", "<leader>gs", function() fzflua.git_status() end)   -- Git status
        map("n", "<leader>gc", function() fzflua.git_commits() end)  -- Git commits
        map("n", "<leader>gb", function() fzflua.git_branches() end) -- Git branches

        -- Diagnostics integration (LSP diagnostics)
        map("n", "<leader>di", function() fzflua.diagnostics() end)

		-- stylua: ignore end
	end,
}
