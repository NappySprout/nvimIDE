return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dashboard = { enabled = true },
    picker = { enabled = true },
    explorer = { enabled = true },
  },
  keys = {
    { "<leader>f", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>b", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    { "<leader>gg", function() Snacks.lazygit.open() end, desc = "Lazygit" },
  }
}
