return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = {
      variant = "main", -- Set to "moon" (darkest), "main" (default dark), or "dawn" (light)
      dark_variant = "main", -- Ensure this is also moon if you dynamically change Vim's 'background'
      -- disable_background = false, -- Set to true for transparency
      -- disable_float_background = false, -- Set to true for transparent floats
      disable_italics = false, -- Ensure italics are enabled
      disable_bold = false,    -- Ensure bold is enabled
      disable_underline = false,-- Ensure underline is enabled
      terminal_colors = true, -- Make terminal colors match
      dim_inactive_windows = false, -- Don't dim inactive windows
      styles = {
        comments = "italic",
        conditionals = "italic",
        loops = "italic",
        functions = "bold",
        keywords = "italic",
        strings = "none",
        variables = "none",
        numbers = "none",
        booleans = "italic",
        properties = "italic",
        types = "bold_italic",
        operators = "none",
      },
      -- highlight_groups expects a TABLE, not a function returning a table.
      -- We will define custom highlights needing palette colors in the config function instead.
      -- You could put static overrides here if they don't need palette colors.
      highlight_groups = {
         -- Example of a static override (doesn't need palette):
         -- VertSplit = { fg = "#somecolor", bg = "none" },
         -- We removed the @constant definitions here as they need the palette.
      }
      -- Note: Leaving highlight_groups empty or omitting it is also fine if you only have
      -- dynamic highlights defined in config.
    },
    config = function(_, opts)
      -- Load the colorscheme using the setup function FIRST
      require("rose-pine").setup(opts)
      vim.cmd("colorscheme rose-pine") -- Apply the theme

      -- NOW apply custom highlights that require palette colors
      -- Access the palette after the theme is loaded
      local palette = require("rose-pine.palette")
      if palette then -- Ensure palette loaded correctly
          vim.api.nvim_set_hl(0, "@constant", { fg = palette.iris, bold = true })
          vim.api.nvim_set_hl(0, "@constant.builtin", { fg = palette.gold, bold = true, italic = true })

          -- Add any other custom highlights here using vim.api.nvim_set_hl
          -- vim.api.nvim_set_hl(0, "MyCustomGroup", { fg = palette.foam, bg = palette.base, italic = true })
      else
          vim.notify("Could not load rose-pine palette for custom highlights", vim.log.levels.WARN)
      end

      -- IMPORTANT NOTE ON BACKGROUND OVERRIDE:
      -- Setting Normal bg to #000000 overrides Rosé Pine's background. Use with caution.
      vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
    end,
  },
}
