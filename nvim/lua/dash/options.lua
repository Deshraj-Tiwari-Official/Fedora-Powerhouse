vim.api.nvim_set_hl(0, 'YankHighlight', { bg = '#B3BF93', fg = '#f8f8f2' })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = 'YankHighlight'})
  end,
})
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.api.nvim_set_hl(0, 'Visual', { bg = '#5c6370' })
  end,
})
local opt = vim.opt
vim.g.autoformat = true
vim.o.mouse = ""
vim.o.hlsearch = false
opt.guicursor = ""
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.incsearch = true
opt.number = true
opt.relativenumber = true
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.updatetime = 100
opt.timeoutlen = 1000
opt.cursorline = true
opt.scrolloff = 8
opt.termguicolors = true
opt.wrap = false
