function ColorMyPencils()
  color = color or "tokyodark"
  vim.cmd.colorscheme(color)
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#721233", blend = 100 })
  -- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#721233", blend = 100 })
  -- vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalSB", { bg = "none" })
  --
  -- vim.api.nvim_set_hl(0, "ToggleTerm1NormalFloat", { bg = "#1c1e24" })
end

ColorMyPencils()
