return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      -- Telescope key bindings
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

      -- Telescope setup
      telescope.setup({
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden', -- Include hidden files
            '--no-ignore', -- Do not respect .gitignore or .ignore
          },
          file_ignore_patterns = {}, -- Ensure no ignore patterns block .env
        },
      })
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      })
      telescope.load_extension("ui-select")
    end,
  },
}
