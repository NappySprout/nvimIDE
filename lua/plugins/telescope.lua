return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {'<leader><leader>', '<cmd>Telescope find_files<CR>', desc='findfiles'},
    {'gr', '<cmd>Telescope lsp_references<CR>', desc='go to reference', mode='n'},
    {'gd', '<cmd>Telescope lsp_definitions<CR>', desc='go to definition', mode='n'},
    {'gI', '<cmd>Telescope lsp_implementations<CR>', desc='go to implementation', mode='n'},
  },
  opts = {
    defaults = {
      -- Set path_display to "smart" to show the filename and surrounding path,
      -- truncating the long common path on the left.
      path_display = { "smart" }, -- Other options are "truncate" or "filename_first"
    },
  },
}
