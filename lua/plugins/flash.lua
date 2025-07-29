return {
  -- Flash enhances the built-in search functionality by showing labels at the end of each match, letting you quickly jump to a specific location.
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    ---@type Flash.Config
    opts = { },
    keys = {
      { "<leader>ff", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "[F]lash [f] jump" },
      { "<leader>ft", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "[F]lash [T]reesitter" },
    },
  },
}
