require("mason").setup()
require("mason-lspconfig").setup({
  ensure_instaleld = {"lua_ls", "clangd", "erlang-ls", "gopls"}
})

local cmp = require("cmp")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-o>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    snippet = {
      expand = function (args)
        require('luasnip').lsp_expand(args.body)
      end,
    },

  sources = cmp.config.sources(
  {
    { name = 'nvim_lsp' },
    { name = 'luansip' },
  },
  {
    { name = 'buffer' },
  }),

})

local on_attach = function(_, _) 
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    diagnostics = {
      globals = { "vim" },
    },
    workspace = {
      library = {
        [vim.fn.expand "$VIMRUNTIME/lua"] = true,
        [vim.fn.stdpath "config" .. "/lua"] = true,
      },
    },
  }
}

require("lspconfig").clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("lspconfig").erlangls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("lspconfig").gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}


