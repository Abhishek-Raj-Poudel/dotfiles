return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        --        ensure_installed = {"lua","html","javascript","zig","css"},
        auto_install = true,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true }
      })
      -- Set Neovim to use Treesitter for folding
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      vim.opt.foldenable = true   -- Enable folding
      vim.opt.foldlevel = 99      -- Open all folds by default
      vim.opt.foldlevelstart = 99 -- Start with all folds open
      vim.opt.foldminlines = 1    -- Minimum lines to create a fold
    end
  }
}
