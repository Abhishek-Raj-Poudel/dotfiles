local servers = {
  "lua_ls",
  "html",
  "emmet_language_server",
  "cssls",
  "jsonls",
  "ts_ls", -- Use tsserver instead for better TS/JS support generally
  -- "tsserver", -- Switched from ts_ls to tsserver
  "tailwindcss",
  "zls",
  "pyright",
  "intelephense",
  -- "golangci_lint_ls",
  "stimulus_ls",
}
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" }, -- Added nvim-lspconfig dependency here for clarity
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_installation = true, -- Added for convenience
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- Define the on_attach function HERE
      local on_attach = function(client, bufnr)
        -- Configure diagnostic display settings
        vim.diagnostic.config({
          virtual_text = true, -- Show errors inline
          signs = true, -- Show signs in the gutter (like the 'E' you already see)
          underline = true, -- Underline the problematic code
          update_in_insert = false, -- Don't update diagnostics in insert mode (can be distracting)
          severity_sort = true, -- Sort diagnostics by severity
          float = { -- Configure the look of the floating window for diagnostics
            source = "always", -- Show the source of the diagnostic (e.g., 'tsserver', 'eslint')
            border = "rounded",
            style = "minimal",
          },
        })

        -- Keymaps for LSP features - SET THESE INSIDE on_attach
        -- This ensures they only apply to buffers where an LSP server is attached
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        -- Optional: Keymaps for diagnostics
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts) -- Open diagnostic float window
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)      -- Go to previous diagnostic
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)      -- Go to next diagnostic
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts) -- Add diagnostics to location list
      end

      -- Loop through servers and attach the on_attach function
      for _, server_name in ipairs(servers) do
        -- Handle potential server-specific settings if needed later
        local server_opts = {
          capabilities = capabilities,
          on_attach = on_attach, -- Pass the on_attach function here!
        }

        -- Example: Server specific settings (if needed)
        -- if server_name == "tsserver" then
        --   server_opts.settings = { ... }
        -- end

        lspconfig[server_name].setup(server_opts)
      end

      -- REMOVE Global LSP Keymaps from here if you set them in on_attach
      -- vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, {})
      -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      -- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
