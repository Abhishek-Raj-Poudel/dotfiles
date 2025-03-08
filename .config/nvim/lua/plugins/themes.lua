return {

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    styles = {                   -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { "italic" },   -- Change the style of comments
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },

    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme catppuccin]])
      vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })    -- for floating windows, if needed
    end,
  },
}
