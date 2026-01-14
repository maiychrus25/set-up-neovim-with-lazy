return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      integrations = {
        treesitter = true,
        telescope = true,
        gitsigns = true,
        cmp = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
