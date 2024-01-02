return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls",
          "clangd",
          "dockerls",
          "html",
          "jsonls",
          "jdtls",
          "tsserver",
          "pyright",
          "sqlls",
          "rubocop",
          }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.html.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.jdtls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.pyright.setup({})
      lspconfig.sqlls.setup({})
      lspconfig.rubocop.setup({
        config = function()
          vim.opt.signcolumn = "yes"
          vim.api.nvim_create_autocmd("FileType", {
            pattern = "ruby",
            callback = function()
              vim.lsp.start {
                name = "rubocop",
                cmd = { "bundle", "exec", "rubocop", "--lsp" },
              }
            end,
          })
        end
      })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
