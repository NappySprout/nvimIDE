return {
  "nvim-mini/mini.nvim",
  version = false,
  config = function()
    require("mini.surround").setup()
    require("mini.pairs").setup()
  end,
}
--[[
V sa<?> to add <?> around visual selection
V sd<?> to delete <?> when within the <?>
]]--
