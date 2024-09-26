return {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1500,
    lsp_format = "fallback",
  },
}
