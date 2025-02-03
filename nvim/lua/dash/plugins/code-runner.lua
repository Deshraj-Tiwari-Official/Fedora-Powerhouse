return {
	"CRAG666/code_runner.nvim",
	config = function()
		require("code_runner").setup({
			filetype = {
				 -- python = "python3 -u",

				c = function(...)
					c_base = {
						"cd $dir &&",
						"gcc $fileName -o",
						"/tmp/$fileNameWithoutExt",
					}
					local c_exec = {
						"&& /tmp/$fileNameWithoutExt &&",
						"rm /tmp/$fileNameWithoutExt",
					}
					vim.ui.input({ prompt = "Add more args:" }, function(input)
						c_base[4] = input
						vim.print(vim.tbl_extend("force", c_base, c_exec))
						require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
					end)
				end,

				cpp = function(...)
					c_base = {
						"cd $dir &&",
						"g++ $fileName -o",
						"/tmp/$fileNameWithoutExt",
					}
					local c_exec = {
						"&& /tmp/$fileNameWithoutExt &&",
						"rm /tmp/$fileNameWithoutExt",
					}
					vim.ui.input({ prompt = "Add more args:" }, function(input)
						c_base[4] = input
						vim.print(vim.tbl_extend("force", c_base, c_exec))
						require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
					end)
				end,

				go = function(...)
					go_base = {
						"cd $dir &&",
						"go run $fileName",
					}
					vim.ui.input({ prompt = "Add more args:" }, function(input)
						go_base[3] = input
						vim.print(go_base)
						require("code_runner.commands").run_from_fn(go_base)
					end)
				end,
			},
		})
	end,
}
