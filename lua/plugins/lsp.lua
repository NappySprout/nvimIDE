return {
  'neovim/nvim-lspconfig',
  lazy = false,
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } }, },
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
        map('gd', vim.lsp.buf.definition, '[G]oto [D]efintion')
        map('<leader>cr', vim.lsp.buf.rename, '[G]oto [D]efintion')
      end
    })
    local home = os.getenv('HOME')
    local workspace_path = home .. '/.local/share/nvim/jdtls-workspace/'
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
    local workspace_dir = workspace_path .. project_name
    vim.lsp.enable('lua_ls')
    vim.lsp.config['jdtls'] = {
      -- Use root_markers for clean project root detection
      root_markers = { 'pom.xml', 'build.gradle', '.git' },
      cmd = {
        '/Library/Java/JavaVirtualMachines/zulu-21.jdk/Contents/Home/bin/java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens',
        'java.base/java.util=ALL-UNNAMED',
        '--add-opens',
        'java.base/java.lang=ALL-UNNAMED',
        '-javaagent:' .. home .. '/.local/share/nvim/mason/packages/jdtls/lombok.jar',
        '-jar',
        vim.fn.glob(home .. '/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
        '-configuration',
        home .. '/.local/share/nvim/mason/packages/jdtls/config_mac',
        '-data',
        workspace_dir,
      },
      settings = {
        java = {
          referencesCodeLens = {
            enabled = true,
          },
          inlayHints = {
            parameterNames = {
              enabled = 'all',
            },
          },
        },
      },
    }
    vim.lsp.enable('jdtls')

  end
}
