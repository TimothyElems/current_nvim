return {
  { "nvim-lua/plenary.nvim", lazy = true },
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedarkpro').setup {
        -- style = 'darker'
      }
      -- Enable theme
      require('onedarkpro').load(
        vim.cmd("colorscheme onedark_dark")
      )
    end
  },
  -- Markdown Peek
  {
      "toppair/peek.nvim",
      event = { "VeryLazy" },
      build = "deno task --quiet build:fast",
      config = function()
          require("peek").setup()
          vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
          vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
      end,
  },
  {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},
  {
    'akinsho/toggleterm.nvim', 
    version = "*", 
    config = function()
      require("toggleterm").setup({
        -- Add other toggleterm config options here
        float_opts = {
          border = "curved",
          winblend = 10,
        },
      })
      
      -- Create a function to toggle a floating terminal
      local Terminal = require('toggleterm.terminal').Terminal
      local float_term = Terminal:new({ 
        direction = "float",
        on_open = function(term)
          vim.cmd("startinsert!")
        end,
      })
      
      function _G.toggle_float_term()
        float_term:toggle()
      end
      
      -- Map capital T to open a new floating terminal
      vim.api.nvim_set_keymap('n', 'T', '<cmd>lua toggle_float_term()<CR>', {noremap = true, silent = true})
      
      -- Map Escape in terminal mode to hide the terminal without exiting
      vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n><cmd>ToggleTerm<CR>', {noremap = true, silent = true})
      
      -- Alternative: Map capital C to close/hide the terminal from normal mode
      vim.api.nvim_set_keymap('n', 'C', '<cmd>ToggleTerm<CR>', {noremap = true, silent = true})
    end
  },
  {
    "Pocco81/auto-save.nvim",
    enabled = true,
    execution_message = {
        message = function() -- message to print on save
            return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
    end,
        dim = 0.18,         -- dim the color of `message`
        cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
    },
    trigger_events = { "InsertLeave" },
  },
  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = {},
    init = function()
      -- From https://github.com/LazyVim/LazyVim/blob/5115b585e7df4cedb519734ffc380b7e48a366f1/lua/lazyvim/util/mini.lua
      -- From https://github.com/LazyVim/LazyVim/blob/d35a3914bfc0c7c1000184585217d58a81f5da1a/lua/lazyvim/plugins/ui.lua#L310
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },

  {
    "Bekaboo/dropbar.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    },
    config = function()
      vim.api.nvim_set_hl(0, "WinBar", { bg = "NONE" }) -- no background for dropbar
    end,
  },

  {
    "mikavilpas/yazi.nvim",
    lazy = true, -- use `event = "VeryLazy"` for netrw replacement
    keys = {
      -- NOTE: my mapping <leader>lf is soo good but in the LSP cluster
      {
        "<leader>lf",
        "<cmd>Yazi<cr>",
        desc = "Open Yazi (file manager)",
      },
    },
    opts = {
      open_for_directories = true,
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    -- dependencies = {
    --   { "rcarriga/nvim-notify" },
    -- },
    keys = {
      { "<leader>n", "", desc = "Noice" },
      { "<leader>nn", "<cmd>Noice all<cr>", desc = "Open Noice" },
    },
    opts = {
      cmdline = {
        view = "cmdline", -- classic cmdline at the botton
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          -- ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      messages = {
        view_search = false, -- do not show search count as virtualtext
      },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        long_message_to_split = true, -- long messages will be sent to a split
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
  },

  {
    "catgoose/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    keys = {
      { "<leader>ux", "<cmd>ColorizerToggle<cr>", desc = "Colorizer" },
    },
    opts = {},
  },
 
  {
      'akinsho/bufferline.nvim',
      version = "*",
      dependencies = 'nvim-tree/nvim-web-devicons',
      config = function()
        require("bufferline").setup({
          options = {
            -- Numbers the tabs with a superscript (using ordinal position)
            numbers = function(opts)
                -- Use opts.raise(opts.ordinal) for superscript ordinal number
                -- Or opts.raise(opts.id) for superscript buffer ID
                -- Let's show the ordinal number as superscript
                return opts.raise(opts.ordinal)
            end,

            -- Can pin tabs (handled by command mapping below)
            -- The built-in 'pinned' group handles the display order

            -- Has a clear way to pick tabs (handled by command mapping below)

            -- Has unique names (default behavior often handles this by adding context,
            -- but we can ensure truncation is on for tidiness)
            truncate_names = true, -- Truncate names if they are too long
            -- max_name_length = 18, -- Adjust as needed
            -- max_prefix_length = 15, -- Adjust as needed
            -- show_duplicate_prefix = true, -- Usually true by default, helps with uniqueness

            -- It can group (define your groups here)
            -- This requires defining specific rules (matchers) for your files.
            -- This is just the basic structure. You'll need to add your actual groups.
            groups = {
                options = {
                   toggle_hidden_on_enter = true,
                },
                items = {
                    -- Example: Add the built-in 'ungrouped' group
                    -- require('bufferline.groups').builtin.ungrouped,
                    -- Add your custom groups here, e.g.:
                    -- {
                    --   name = "MyProjectFiles",
                    --   matcher = function(buf)
                    --     return buf.path:match("path/to/your/project")
                    --   end,
                    -- },
                },
            },


            -- Sloped tabs
            separator_style = "slant", -- Or "padded_slope" if needed
            tab_size = 28,
            diagnostics = "nvim_lsp",
            diagnostics_update_on_event = true,
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
              return "("..count..")"
            end,

            -- with underline indicators (blue)
            indicator = {
               style = 'underline', -- Use underline style for the indicator
               -- icon = '▎', -- Omit icon when using underline style
            },

            -- Can close a single tab with a key binding (handled by mapping below)
            -- We will map a key to the standard ':bd' command or BufferLinePickClose

            -- Optional: Show close icon on hover (requires Neovim 0.8+)
            hover = {
                enabled = true,
                delay = 200,
                reveal = {'close'}
            },

            -- Show buffer close icons
            show_buffer_close_icons = true,
            show_close_icon = true, -- Show close button on the tabpage if mode is 'tabs'
            show_tab_indicators = true, -- Ensure indicators are shown


            -- You might want these navigation mappings enabled as well
            -- see the docs for more options like moving buffers
            -- nnoremap <silent>[b :BufferLineCycleNext<CR>
            -- nnoremap <silent>b] :BufferLineCyclePrev<CR>

          }, -- end options

          -- Configure highlights for the blue underline indicator
          highlights = {
              -- For the selected buffer's indicator
              indicator_selected = {
                  underline = true,
                  sp = "#0077ff", -- Example blue color (adjust as needed for your colorscheme)
              },
              -- For visible but not selected buffer's indicator
               indicator_visible = {
                  underline = true,
                  sp = "#0077ff", -- Example blue color (adjust as needed for your colorscheme)
              },
               -- For non-visible buffer's indicator (optional)
               -- indicator = {
               --    underline = true,
               --    sp = "#0077ff", -- Example blue color (adjust as needed for your colorscheme)
               -- },
          } -- end highlights

        }) -- end setup call

        -- ### Key Mappings ###

        -- Can close a single tab with a key binding
        -- This maps <leader>x to close the current buffer/window using the standard :bd command
        -- vim.keymap.set('n', '<leader>x', '<cmd>bd<CR>', { desc = 'Close current buffer/tab', silent = true })

        -- It can pin tabs
        -- Map <leader>p to toggle pinning the current buffer
        -- Uses the command found in the documentation: :BufferLineTogglePin
        vim.keymap.set('n', '<leader>p', '<cmd>BufferLineTogglePin<CR>', { desc = 'Toggle pin current buffer', silent = true })

        -- Has a clear way to pick tabs
        -- Map <leader>P to use the pick UI to select and go to a buffer
        -- Uses the command found in the documentation: :BufferLinePick
        vim.keymap.set('n', '<leader>P', '<cmd>BufferLinePick<CR>', { desc = 'Pick buffer to jump to', silent = true })

        -- Map <leader>D to use the pick UI to select and close a buffer
        -- Uses the command found in the documentation: :BufferLinePickClose
        vim.keymap.set('n', '<leader>D', '<cmd>BufferLinePickClose<CR>', { desc = 'Pick buffer to close', silent = true })


      end, -- end config function
  },

  -- Optional: Add nvim-web-devicons for file icons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  {
  "basola21/PDFview",
  lazy = false,
  dependencies = { "nvim-telescope/telescope.nvim" }
  },
}
