return {
  'magicduck/grug-far.nvim',
  config = function()
    require('grug-far').setup({});
  end,
  keys = {
    {'<leader>sr', ':GrugFar<CR>', desc='GrugFar', mode = 'v'},
    {'<leader>sr', '<cmd>GrugFar<CR>', desc='GrugFar'},
  }
}
