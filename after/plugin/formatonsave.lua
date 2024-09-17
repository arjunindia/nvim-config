local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")
local vim_notify = require("format-on-save.error-notifiers.vim-notify")

format_on_save.setup({
  error_notifier = vim_notify,
  experiments = {
    partial_update = "diff",
  },
  exclude_path_patterns = {
    "/node_modules/",
    ".local/share/nvim/lazy",
  },
  formatter_by_ft = {
    css = formatters.lsp,
    html = formatters.lsp,
    java = formatters.lsp,
    json = formatters.biome,
    lua = formatters.lsp,
    markdown = formatters.prettierd,
    openscad = formatters.lsp,
    python = formatters.black,
    rust = formatters.lsp,
    scad = formatters.lsp,
    scss = formatters.lsp,
    sh = formatters.shfmt,
    terraform = formatters.lsp,
    typescript = formatters.prettierd,
    typescriptreact = formatters.prettierd,
    yaml = formatters.lsp,
    go = formatters.lsp,
    ruby = formatters.lsp,
  },

  -- Optional: fallback formatter to use when no formatters match the current filetype
  fallback_formatter = {
    formatters.lsp,
    formatters.remove_trailing_whitespace,
    formatters.remove_trailing_newlines,
    formatters.prettierd,
  },

  -- By default, all shell commands are prefixed with "sh -c" (see PR #3)
  -- To prevent that set `run_with_sh` to `false`.
  run_with_sh = false,
})
