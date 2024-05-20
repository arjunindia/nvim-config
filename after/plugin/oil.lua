-- file explorer
local oil = require("oil")

oil.setup()
vim.keymap.set("n", "<leader>pv", oil.open)
vim.keymap.set("n", "<leader>pp", oil.open_preview)
