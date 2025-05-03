require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'catppuccin-latte',
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  },
}
