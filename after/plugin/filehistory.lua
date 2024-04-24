-- These are the default values
require('file_history').setup {
    -- This is the location where it will create your file history repository
    backup_dir = "~/.file-history-git",
    -- command line to execute git
    git_cmd = "git"
}
require('telescope').load_extension('file_history')

vim.api.nvim_exec(
    [[
nnoremap <silent> <leader>Bb :Telescope file_history backup tag=
nnoremap <silent> <leader>Bh :Telescope file_history history<CR>
nnoremap <silent> <leader>Bl :Telescope file_history log<CR>
nnoremap <silent> <leader>Bf :Telescope file_history files<CR>
nnoremap <silent> <leader>Bq :Telescope file_history query after=
]],
    true)
