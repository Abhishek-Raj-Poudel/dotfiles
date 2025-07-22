return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            opts = {
                ensure_installed = { "lua_ls","bashls",'biome' },
            },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            {"neovim/nvim-lspconfig",}
        }
    },
}
