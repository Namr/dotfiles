vim.g.mapleader = ' '
vim.g.noswapfile = true
vim.g.nohlsearch = true
vim.g.noerrorbells = true

vim.opt.ignorecase = true
vim.opt.hidden = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.exrc = true
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.scrolloff = 8

-- remappings
local function map(kind, lhs, rhs, opts)
  vim.api.nvim_set_keymap(kind, lhs, rhs, opts)
end
local silentnoremap = {noremap = true, silent = true}

map('i', 'jk', '<ESC>', silentnoremap)
