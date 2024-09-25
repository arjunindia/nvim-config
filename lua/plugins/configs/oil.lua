    -- file explorer
local oil = require("oil")

oil.setup()

vim.keymap.set("n", "<leader>fv", oil.open)
vim.keymap.set("n", "<leader>fp", function()
    oil.open_preview({
        split = "botright"
    })
end
)
