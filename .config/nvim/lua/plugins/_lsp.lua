return {
    {
        "williamboman/mason.nvim",
        lazy = false,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        autostart = true,
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup()
            local on_attach = function(client, bufnr)
                print("LSP started: " .. client.name)
            end
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            vim.lsp.config("pylsp", {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                ignore = {"W391", "E225", "E303", "E711", "E226", "E266", "E275", "W293", "E203", "E302", "E305", "E501", "E231", "W291", "E251"},
                                maxLineLength = 100,
                            }
                        }
                    }
                }
            })

            vim.lsp.config("rust_analyzer", {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    ["rust_analyzer"] = {
                        workspace = {
                            symbol = {
                                search = {
                                    kind = "all_symbols"
                                }
                            }
                        }
                    }
                }
            })

            vim.lsp.config("gopls", {
                on_attach = on_attach,
                capabilities = capabilities,
            })

            vim.lsp.config("svelte", {
                on_attach = on_attach,
                capabilities = capabilities,
            })

            vim.lsp.config("ts_ls", {
                on_attach = on_attach,
                capabilities = capabilities,
            })

        end
    }
}
