return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufWritePost", "BufReadPost", "InsertLeave" },
    opts = {
      linters_by_ft = {
        dockerfile = { "hadolint" },
        go = { "golangcilint" },
        lua = { "selene" },
        -- markdown = { "markdownlint-cli2" },
        yaml = { "yamllint" },
      },
    },
    config = function(_, opts)
      local lint = require("lint")
      lint.linters_by_ft = opts.linters_by_ft
      local lint_augroup = vim.api.nvim_create_augroup("linting", { clear = true })
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
        lint.try_lint()
        end,
      })
    end,
  },

--   {
--   "folke/trouble.nvim",
--   opts = {
--     auto_open = true,
--     auto_close = false,
--     open_no_results = true,  -- Keep window open even with no results
--     win = {
--       position = "bottom",
--       size = { height = 10 }
--     },
--     modes = {
--       diagnostics = {
--         auto_open = true,
--         -- Remove any buffer filtering to scan entire project
--         filter = {},
--       },
--     },
--   },
--   cmd = "Trouble",
--   -- Auto-open on VimEnter
--   event = "VimEnter",
--   config = function(_, opts)
--     require("trouble").setup(opts)
--     -- Auto-open diagnostics when Neovim starts
--     vim.defer_fn(function()
--       require("trouble").open("diagnostics")
--     end, 100)
--   end,
--   keys = {
--     {
--       "<leader>xx",
--       "<cmd>Trouble diagnostics toggle<cr>",
--       desc = "Diagnostics (Trouble)",
--     },
--     {
--       "<leader>xX",
--       "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
--       desc = "Buffer Diagnostics (Trouble)",
--     },
--     {
--       "<leader>cs",
--       "<cmd>Trouble symbols toggle focus=false<cr>",
--       desc = "Symbols (Trouble)",
--     },
--     {
--       "<leader>cl",
--       "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
--       desc = "LSP Definitions / references / ... (Trouble)",
--     },
--     {
--       "<leader>xL",
--       "<cmd>Trouble loclist toggle<cr>",
--       desc = "Location List (Trouble)",
--     },
--     {
--       "<leader>xQ",
--       "<cmd>Trouble qflist toggle<cr>",
--       desc = "Quickfix List (Trouble)",
--     },
--   },
-- },
--
--








{
  "folke/trouble.nvim",
  dependencies = {
    "ya2s/nvim-nonicons",
  },
  opts = {
    auto_open = true,
    auto_close = true,  -- Auto close when no errors
    open_no_results = false,  -- Don't open when no results
    focus = false,
    win = {
      position = "bottom",
      size = { height = 12 },
      border = "rounded",
      title = " 󰒡 Trouble ",
      title_pos = "left",
      padding = { top = 1, bottom = 1, left = 2, right = 2 },
    },
    preview = {
      type = "split",
      relative = "win",
      position = "right",
      size = 0.35,
      border = "rounded",
      title = " 󰈙 Preview ",
      title_pos = "left",
    },
    modes = {
      diagnostics = {
        auto_open = true,
        auto_close = true,
        filter = {
          -- Include all severity levels for project-wide scanning
          severity = {
            vim.diagnostic.severity.ERROR,
            vim.diagnostic.severity.WARN,
            vim.diagnostic.severity.INFO,
            vim.diagnostic.severity.HINT,
          },
        },
      },
    },
    -- Enhanced icons using nonicons
    icons = {
      indent = {
        top = "│ ",
        middle = "├╴",
        last = "└╴",
        fold_open = " ",
        fold_closed = " ",
        ws = "  ",
      },
      folder_closed = " ",
      folder_open = " ",
      kinds = {
        Array = " ",
        Boolean = " ",
        Class = " ",
        Constant = " ",
        Constructor = " ",
        Enum = " ",
        EnumMember = " ",
        Event = " ",
        Field = " ",
        File = " ",
        Function = " ",
        Interface = " ",
        Key = " ",
        Method = " ",
        Module = " ",
        Namespace = " ",
        Null = " ",
        Number = " ",
        Object = " ",
        Operator = " ",
        Package = " ",
        Property = " ",
        String = " ",
        Struct = " ",
        TypeParameter = " ",
        Variable = " ",
      },
    },
  },
  cmd = "Trouble",
  -- Auto-open on VimEnter
  event = "VimEnter",
  config = function(_, opts)
    require("trouble").setup(opts)
    -- Auto-open diagnostics when Neovim starts
    vim.defer_fn(function()
      require("trouble").open("diagnostics")
    end, 100)
  end,
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
},






  -- {
  --   "folke/trouble.nvim",
  --   opts = {
  --     auto_open = true,
  --     auto_close = false,
  --     win = {
  --       position = "bottom",
  --       size = { height = 10 }
  --     },
  --     modes = {
  --       diagnostics = {
  --         auto_open = true,
  --       },
  --     },
  --   }, -- for default options, refer to the configuration section for custom setup.
  --   cmd = "Trouble",
  --   keys = {
  --     {
  --       "<leader>xx",
  --       "<cmd>Trouble diagnostics toggle<cr>",
  --       desc = "Diagnostics (Trouble)",
  --     },
  --     {
  --       "<leader>xX",
  --       "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  --       desc = "Buffer Diagnostics (Trouble)",
  --     },
  --     {
  --       "<leader>cs",
  --       "<cmd>Trouble symbols toggle focus=false<cr>",
  --       desc = "Symbols (Trouble)",
  --     },
  --     {
  --       "<leader>cl",
  --       "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
  --       desc = "LSP Definitions / references / ... (Trouble)",
  --     },
  --     {
  --       "<leader>xL",
  --       "<cmd>Trouble loclist toggle<cr>",
  --       desc = "Location List (Trouble)",
  --     },
  --     {
  --       "<leader>xQ",
  --       "<cmd>Trouble qflist toggle<cr>",
  --       desc = "Quickfix List (Trouble)",
  --     },
  --   },
  -- },
  --
  --
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    "windwp/nvim-autopairs",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- enable_check_bracket_line = false, -- Don't add pairs if it already has a close pair in the same line
      -- ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
      check_ts = true, -- use treesitter to check for a pair.
      ts_config = {
        lua = { "string" }, -- it will not add pair on that treesitter node
        javascript = { "template_string" },
        java = false, -- don't check treesitter on java
      },
    },
  },
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   requires = 'kevinhwang91/promise-async',
  --   opts = {
  --
  --   }
  -- },
  { "nvim-telescope/telescope-ui-select.nvim" },
  {
    'AckslD/muren.nvim',
    config = true,
  },
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    opts = {
      symbol_folding = {
        -- Depth past which nodes will be folded by default
        autofold_depth = 1,
      },
      guides = {
        enabled = false,
      },
    },
    keys = {
      { "<leader>to", "<cmd>Outline<cr>", desc = "Toggle Outline" },
    },
  },

  {
    "allaman/kustomize.nvim",
    -- dev = true,
    ft = "yaml",
    opts = {
      enable_lua_snip = true,
      kinds = {
        auto_close = true,
        show_filepath = true,
        show_line = true,
      },
      run = {
        deprecations29 = {
          args = { "-t", "1.29", "-c=false", "--helm3=false", "-l=error", "-e", "-f" },
          cmd = "kubent",
        },
        deprecations30 = {
          args = { "-t", "1.30", "-c=false", "--helm3=false", "-l=error", "-e", "-f" },
          cmd = "kubent",
        },
        trivy = {
          args = { "-q", "fs" },
          cmd = "trivy",
        },
      },
    },
    config = function(_, opts)
      require("which-key").add({
        { "<leader>k", group = "Kustomize" },
      })
      require("kustomize").setup(opts)
    end,
  },
  {
    "fredrikaverpil/godoc.nvim",
    cmd = { "GoDoc" },
    opts = {},
  },
}
