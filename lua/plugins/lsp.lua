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
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(event)
        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end
        map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
        map('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
      end
    })
  end
}
-- :h lspconfig-all is helpful to enable lsp
