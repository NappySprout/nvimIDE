return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {'mason-org/mason-lspconfig.nvim', opts = {automatic_enable = true}},
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    {
      "mason-org/mason.nvim",
      opts = {},
      keys = {
        { "<leader>cm", '<cmd>Mason<CR>', desc = "Mason" },
      },
    }
  },
  config = function()
  end
}
-- :h lspconfig-all is helpful to enable lsp
