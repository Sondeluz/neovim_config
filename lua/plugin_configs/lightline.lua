--Set statusbar
vim.g.lightline = {
  colorscheme = 'space-vim-dark',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
} 
