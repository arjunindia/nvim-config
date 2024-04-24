local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

format_on_save.setup({
    exclude_path_patterns = {
        "/node_modules/",
        ".local/share/nvim/lazy",
    },
    formatter_by_ft = {
        css = formatters.lsp,
        html = formatters.lsp,
        java = formatters.lsp,
        javascript = formatters.lsp,
        json = formatters.lsp,
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

        -- Add custom formatter
        filetype1 = formatters.remove_trailing_whitespace,
        filetype2 = formatters.custom({
            format = function(lines)
                return vim.tbl_map(function(line)
                    return line:gsub("true", "false")
                end, lines)
            end
        }),

        -- in one of the parent directories.
        javascript = {
            formatters.if_file_exists({
                pattern = ".eslintrc.*",
                formatter = formatters.eslint_d_fix
            }),
            formatters.if_file_exists({
                pattern = { ".prettierrc", ".prettierrc.*", "prettier.config.*" },
                formatter = formatters.prettierd,
            }),
            -- By default it stops at the git repo root (or "/" if git repo not found)
            -- but it can be customized with the `stop_path` option:
            formatters.if_file_exists({
                pattern = ".prettierrc",
                formatter = formatters.prettierd,
                stop_path = function()
                    return "/my/custom/stop/path"
                end
            }),
        },
    },

    -- Optional: fallback formatter to use when no formatters match the current filetype
    fallback_formatter = {
        formatters.remove_trailing_whitespace,
        formatters.remove_trailing_newlines,
        formatters.prettierd,
    },

    -- By default, all shell commands are prefixed with "sh -c" (see PR #3)
    -- To prevent that set `run_with_sh` to `false`.
    run_with_sh = false,
})
