return {
  "j-hui/fidget.nvim",
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        delay = 200,
      })
    end,
  },
  {
    "m4xshen/autoclose.nvim",
    config = function()
      require("autoclose").setup()
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
      require("onedarkpro").setup({
        options = {
          transparency = true,
        },
      })
      vim.cmd("colorscheme onedark_dark")
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
      require("todo-comments").setup({
        vim.keymap.set("n", "<leader>tq", vim.cmd.TodoQuickFix),
      })
    end,
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    lazy = false,
    config = function()
      local harpoon = require('harpoon')
      harpoon:setup({})

      -- File Operations
      vim.keymap.set('n', '<leader>ha', function() harpoon:list():append() end, { desc = 'Harpoon: Add current file' })
      vim.keymap.set('n', '<leader>he', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon: List all Harpoon files' })
      vim.keymap.set('n', '<leader>hx', function() harpoon:list():clear() end, { desc = 'Harpoon: Clear all Harpoon files' })

      -- File Selection
      vim.keymap.set('n', '<leader>hh', function() harpoon:list():select(1) end, { desc = 'Harpoon: Select Harpoon file 1'})
      vim.keymap.set('n', '<leader>hj', function() harpoon:list():select(2) end, { desc = 'Harpoon: Select Harpoon file 2'})
      vim.keymap.set('n', '<leader>hk', function() harpoon:list():select(3) end, { desc = 'Harpoon: Select Harpoon file 3'})
      vim.keymap.set('n', '<leader>hl', function() harpoon:list():select(4) end, { desc = 'Harpoon: Select Harpoon file 4'})

    end,
  },
}
