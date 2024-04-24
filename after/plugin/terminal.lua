require("toggleterm").setup({
    -- size can be a number or function which is passed the current terminal
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    on_open = function(term)
        vim.api.nvim_win_set_hl_ns(0, 1234)
        vim.api.nvim_set_hl(1234, "Normal", { bg = "#101010", blend = 70 })
        vim.api.nvim_set_hl(1234, "NormalFloat", { bg = "#101010" })
    end,
    open_mapping = [[<c-\>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
    shade_terminals = true,
    close_on_exit = true,     -- close the terminal window when the process exits

})
