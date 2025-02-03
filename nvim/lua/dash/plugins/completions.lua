return {
    -- LuaSnip for snippet support
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" }, -- Load common snippets
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },

    -- Completion framework
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",    -- LSP source for nvim-cmp
            "hrsh7th/cmp-buffer",      -- Buffer completions
            "hrsh7th/cmp-path",        -- File path completions
            "hrsh7th/cmp-cmdline",     -- Command line completions
            "saadparwaiz1/cmp_luasnip" -- Snippet completions
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)  -- Use LuaSnip to expand snippets
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = {
                    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), -- Select next item
                    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), -- Select previous item
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Confirm completion
                    ["<C-e>"] = cmp.mapping.abort(), -- Cancel completion
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump() -- Jump into snippet
                        elseif cmp.visible() then
                            cmp.select_next_item() -- Select next completion
                        else
                            fallback() -- Fallback to default Tab behavior
                        end
                    end, { "i", "s", "c" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1) -- Jump back in snippet
                        elseif cmp.visible() then
                            cmp.select_prev_item() -- Select previous completion
                        else
                            fallback() -- Fallback to default Shift+Tab behavior
                        end
                    end, { "i", "s", "c" }),
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
            })

            -- Setup command-line completion
            cmp.setup.cmdline('/', {
                sources = {
                    { name = 'buffer' }  -- Suggest from buffer in search mode
                }
            })

            cmp.setup.cmdline(':', {
                sources = cmp.config.sources({
                    { name = 'cmdline' },  -- Command line completion
                }, {
                    { name = 'path' },      -- Path completions
                })
            })
        end,
    },

    -- -- Neocodeium for AI-assisted completions
    -- {
    --     "monkoose/neocodeium",
    --     event = "VeryLazy",
    --     config = function()
    --         local neocodeium = require("neocodeium")
    --         neocodeium.setup()
    --
    --         local map = vim.keymap.set
    --         map("i", "<C-a>", neocodeium.accept, { desc = "NeoCodeium Accept" })
    --         map("i", "<C-w>", neocodeium.accept_word, { desc = "NeoCodeium Accept Word" })
    --         map("i", "<C-l>", neocodeium.accept_line, { desc = "NeoCodeium Accept Line" })
    --         map("i", "<C-j>", neocodeium.cycle_or_complete, { desc = "NeoCodeium Cycle" })
    --         map("i", "<C-k>", function() neocodeium.cycle_or_complete(-1) end, { desc = "NeoCodeium Cycle Backward" })
    --         map("i", "<C-e>", neocodeium.clear, { desc = "NeoCodeium Clear" })
    --     end,
    -- },

    -- Supermaven for AI-assisted completions
    {
      "supermaven-inc/supermaven-nvim",
      config = function()
        require("supermaven-nvim").setup({
          keymaps = {
            accept_suggestion = "<C-a>",
            clear_suggestion = "<C-e>",
          }
        })
      end,
    },
}
