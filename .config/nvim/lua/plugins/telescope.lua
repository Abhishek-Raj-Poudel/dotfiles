return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim',
{ -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      }
    },
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      -- Telescope key bindings
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true, silent = true, desc = "Fine File" })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { noremap = true, silent = true, desc = "Fine text in Files" })

      vim.keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<cr>', {noremap=true, silent=true, desc="Find All Todos"})

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
            '--hidden',              -- Include hidden files
            '--no-ignore',           -- Do not respect .gitignore or .ignore
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
