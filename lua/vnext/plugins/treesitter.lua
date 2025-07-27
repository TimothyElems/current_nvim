return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "bash",
      "bicep",
      "c_sharp",
      "cmake",
      "cpp",
      "css",
      "csv",
      "dart",
      "dockerfile",
      "elixir",
      "erlang",
      "gleam",
      "go",
      "goctl",
      "gomod",
      "gosum",
      "gotmpl",
      "gowork",
      "hcl",
      "heex",
      "html",
      "java",
      "javascript",
      "jinja",
      "json",
      "jsonc",
      "kotlin",
      "ledger",
      "lua",
      "markdown",
      "markdown_inline",
      "nim",
      "query",
      "odin",
      "python",
      "regex",
      "ruby",
      "rust",
      "scss",
      "svelte",
      "sql",
      "terraform",
      "templ",
      "toml",
      "typescript",
      "vim",
      "yaml",
      "zig",
    },
  },
  dependencies = {
    "RRethy/nvim-treesitter-endwise", -- mainly for lua 'closing end' insertion
    "mfussenegger/nvim-ts-hint-textobject",
    "windwp/nvim-ts-autotag",
  },
  config = function(_, opts)
    ---@type TSConfig
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup({
      ensure_installed = opts.ensure_installed,
      highlight = {
        enable = true,
      },
      endwise = {
        enable = true,
      },
      indent = { enable = true },
      autopairs = { enable = true },
    })

    require("nvim-ts-autotag").setup()
  end,
}
