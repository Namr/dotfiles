require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "cpp", "lua", "rust", "vim", "python", "erlang"},
  
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
  },
}
