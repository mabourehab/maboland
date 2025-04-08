return {
  {
  "catppuccin/nvim", name = "catppuccin", priority = 1000,
  config = function ()
    vim.cmd.colorscheme "catppuccin-macchiato"
  end
  },
  {
    "mofiqul/dracula.nvim",
    config = function ()
    local dracula = require("dracula")
      -- vim.cmd.colorscheme "dracula"
    end
  }
}
