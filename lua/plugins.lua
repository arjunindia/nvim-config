
return {
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
},
{
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' }
},
{ "tiagovla/tokyodark.nvim" }, -- lazy
{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
'mbbill/undotree',
}
