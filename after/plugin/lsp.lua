local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- technically these are "diagnostic signs"
-- neovim enables them by default.
-- here we are just changing them to fancy icons.
lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "solargraph" },
  handlers = {
    lsp_zero.default_setup,
  },
})

local lsp_cmp = require("cmp_nvim_lsp")
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'luasnip', keyword_length = 2 },
    { name = 'buffer',  keyword_length = 3 },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-e>'] = cmp.mapping.abort(),
    -- ['<C-Tab>'] = cmp.mapping.complete(),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
    ['<C-p>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({ behavior = 'insert' })
      else
        cmp.complete()
      end
    end),
    ['<C-n>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({ behavior = 'insert' })
      else
        cmp.complete()
      end
    end),
  },

})

local nvim_lsp = require('lspconfig')
local configs = require('lspconfig/configs')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.emmet_ls.setup({
  -- on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "css", "eruby", "html", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  }
})


nvim_lsp.rust_analyzer.setup {
  cmd = vim.lsp.rpc.connect("127.0.0.1", 27631),
  -- When using unix domain sockets, use something like:
  --cmd = vim.lsp.rpc.domain_socket_connect("/path/to/ra-multiplex.sock"),
  settings = {
    ["rust-analyzer"] = {
      lspMux = {
        version = "1",
        method = "connect",
        server = "rust-analyzer",
      },
    },
  },
}
nvim_lsp.ruby_lsp.setup {
  capabilities = lsp_cmp.default_capabilities(capabilities),
  single_file_support = false
}
nvim_lsp.solargraph.setup {
  capabilities = lsp_cmp.default_capabilities(capabilities),
  single_file_support = false
}
nvim_lsp.standardrb.setup {
  capabilities = lsp_cmp.default_capabilities(capabilities),
  single_file_support = false
}
nvim_lsp.denols.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  single_file_support = false
}
