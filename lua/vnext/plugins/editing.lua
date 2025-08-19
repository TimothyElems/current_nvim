return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile", "InsertLeave" },
    opts = {
      format_on_save = function()
        -- Disable with a global variable
        if not vim.g.autoformat then
          return
        end
        return { async = false, timeout_ms = 500, lsp_fallback = false }
      end,
      -- log_level = vim.log.levels.TRACE,
      formatters_by_ft = {
        elixir = { "mix" },
        gleam = { "gleam" },
        go = { "goimports", "gofmt", "golines", "golangci-lint", "gci" },
        html = { "html_beautify", "prettier" },
        javascript = { "prettier" },
        json = { "prettier", "yq" },
        lua = { "stylua" },
        markdown = { "prettier", "markdownfmt" },
        nim = { "nimpretty" },
        odin = { "odinfmt" },
        python = { "isort", "ruff_format", "ruff_fix", "ruff_organize_imports" },
        ruby = { "rubyfmt" }, 
        rust = { "rustfmt", "typos" },
        sh = { "shfmt" },
        sql = { "typos", "sqruff" },
        terraform = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
        tex = { "latexindent" },
        toml = { "taplo" },
        typst = { "typstfmt" },
        yaml = { "yamlfmt", "yq" },
        zig = { "zigfmt" },
        ["*"] = { "typos" },
      },
    },
    config = function(_, opts)
      local conform = require("conform")
      conform.setup(opts)
      conform.formatters.shfmt = {
        prepend_args = { "-i", "2" }, -- 2 spaces instead of tab
      }
      conform.formatters.stylua = {
        prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" }, -- 2 spaces instead of tab
      }
      conform.formatters.yamlfmt = {
        prepend_args = { "-formatter", "indent=2,include_document_start=true,retain_line_breaks_single=true" },
      }
      vim.g.autoformat = vim.g.autoformat
      vim.api.nvim_create_user_command("ToggleAutoformat", function()
        vim.api.nvim_notify("Toggling autoformat", vim.log.levels.INFO, { title = "conform.nvim", timeout = 2000 })
        vim.g.autoformat = vim.g.autoformat == false and true or false
      end, { desc = "Toggling autoformat" })
      vim.keymap.set("n", "<leader>tF", "<cmd>ToggleAutoformat<cr>", { desc = "Toggle format on save" })
    end,
  },

  {
    "folke/flash.nvim",
    opts = {},
    keys = {
      {
        "ss",
        mode = { "n", "x", "o" },
        -- Jump to any word
        function()
          ---@diagnostic disable: missing-fields
          require("flash").jump({
            pattern = ".", -- initialize pattern with any char
            search = {
              mode = function(pattern)
                -- remove leading dot
                if pattern:sub(1, 1) == "." then
                  pattern = pattern:sub(2)
                end
                -- return word pattern and proper skip pattern
                return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
              end,
            },
          })
        end,
        desc = "Flash",
      },
      -- stylua: ignore start
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter", },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash", },
      -- stylua: ignore end
    },
  },

  {
    "echasnovski/mini.surround",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- Number of lines within which surrounding is searched
      n_lines = 50,
    },
  },

  {
    "gbprod/substitute.nvim",
    keys = {
    -- stylua: ignore start
    { "s", function() require("substitute").operator() end, desc = "Substitute", },
    { "s", mode = "x", function() require("substitute").visual() end, desc = "Substitute", },
      -- stylua: ignore end
    },
    opts = {},
  },

  {
    "folke/todo-comments.nvim",
    event = "BufReadPre", -- needed to highlight keywords
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      highlight = {
        multiline = false, -- I usually only wnat one line to be highlighted
      },
    },
    keys = {
      -- stylua: ignore start
      { "<leader>sT", function() Snacks.picker.todo_comments() end, desc = "Todo", },
      -- stylua: ignore end
    },
  },
  -- -- NerdIcons
   {'glepnir/nerdicons.nvim', cmd = 'NerdIcons', config = function() require('nerdicons').setup({}) end}, 

  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    opts = {},
    keys = {
      -- stylua: ignore start
      { "<leader>R", "", desc = "Search & Replace" },
      { "<leader>RG", "<cmd>GrugFar<cr>", desc = "Open" },
      { "<leader>Rg", "<cmd>lua require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } })<cr>", desc = "Open (Limit to current file)"},
      { "<leader>Rw", "<cmd>lua require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>') } })<cr>", desc = "Search word under cursor", },
      { "<leader>Rs", mode = "v", "<cmd>lua require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand('%') } })<cr>", desc = "Search selection", },
      -- stylua: ignore end
    },
  },

  {
    "echasnovski/mini.align",
    keys = {
      { "ga", mode = { "v" }, desc = "Align" },
      { "gA", mode = { "v" }, desc = "Align with Preview" },
    },
    opts = {},
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "norg", "org" },
    opts = {
      render_modes = { "n" },
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
    },
    config = function(_, opts)
      require("render-markdown").setup(opts)
      vim.api.nvim_set_keymap("n", "<leader>um", "<cmd>RenderMarkdown toggle<cr>", { desc = "Toggle Markdown" })
    end,
  },
}
