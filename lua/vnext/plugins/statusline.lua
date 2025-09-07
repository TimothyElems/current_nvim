-- return {
--   "nvim-lualine/lualine.nvim",
--   event = "BufReadPost",
--   opts = {
--     extensions = { "lazy", "quickfix", "neo-tree" },
--     options = {
--       disabled_filetypes = { statusline = { "neo-tree", "Outline", "snacks_picker_list" } },
--     },
--     sections = {
--       lualine_a = {}, -- hide mode
--       lualine_b = {
--         "branch",
--         "diff",
--         "diagnostics",
--         "lsp_status",
--       },
--       lualine_c = {
--         {
--           "filename",
--           file_status = true, -- Displays file status (readonly status, modified status)
--           newfile_status = true, -- Display new file status (new file means no write after created)
--           path = 3, -- 0: Just the filename
--           -- 1: Relative path
--           -- 2: Absolute path
--           -- 3: Absolute path, with tilde as the home directory
--           -- 4: Filename and parent dir, with tilde as the home directory
--         },
--       },
--       lualine_x = { "searchcount", "filetype" },
--       lualine_y = { "progress" },
--       lualine_z = { "location" },
--     },
--   },
--   config = function(_, opts)
--     -- Show info when recording a macro
--     local function is_macro_recording()
--       local reg = vim.fn.reg_recording()
--       if reg == "" then
--         return ""
--       end
--       return "󰑋 " .. reg
--     end
--
--     table.insert(opts.sections.lualine_x, 1, {
--       is_macro_recording,
--       color = { fg = "#333333", bg = "#ff6666" },
--       separator = { left = "", right = "" },
--       cond = function()
--         return is_macro_recording() ~= ""
--       end,
--     })
--
--     -- Don't display encoding if encoding is UTF-8
--     local function encoding()
--       local ret, _ = (vim.bo.fenc or vim.go.enc):gsub("^utf%-8$", "")
--       return ret
--     end
--
--     table.insert(opts.sections.lualine_x, 1, {
--       encoding,
--       cond = function()
--         return encoding() ~= ""
--       end,
--     })
--
--     -- Don't display fileformat if fileformat is unix
--     local function fileformat()
--       local ret, _ = vim.bo.fileformat:gsub("^unix$", "")
--       return ret
--     end
--
--     table.insert(opts.sections.lualine_x, 1, {
--       fileformat,
--       cond = function()
--         return fileformat() ~= ""
--       end,
--     })
--
--     local function wordCount()
--       local wc = vim.fn.wordcount()
--       if wc == nil then
--         return ""
--       end
--       if wc["visual_words"] then -- text is selected in visual mode
--         return wc["visual_words"] .. " Words/" .. wc["visual_chars"] .. " Chars (Vis)"
--       else -- all of the document
--         return wc["words"] .. " Words"
--       end
--     end
--
--     table.insert(opts.sections.lualine_y, 1, {
--       wordCount,
--       cond = function()
--         local ft = vim.bo.filetype
--         local count = {
--           latex = true,
--           tex = true,
--           text = true,
--           markdown = true,
--           vimwiki = true,
--         }
--         return count[ft] ~= nil
--       end,
--     })
--
--     require("lualine").setup(opts)
--   end,
-- }











-- return {
--   "nvim-lualine/lualine.nvim",
--   event = "BufReadPost",
--   opts = {
--     extensions = { "lazy", "quickfix", "neo-tree" },
--     options = {
--       disabled_filetypes = { statusline = { "neo-tree", "Outline", "snacks_picker_list" } },
--     },
--     sections = {
--       lualine_a = {}, -- hide mode
--       lualine_b = {
--         "branch",
--         "diff",
--         "diagnostics",
--         "lsp_status",
--       },
--       lualine_c = {
--         {
--           "filesize",
--           cond = function()
--             return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
--           end,
--         },
--         {
--           "filename",
--           file_status = true, -- Displays file status (readonly status, modified status)
--           newfile_status = true, -- Display new file status (new file means no write after created)
--           path = 1, -- 0: Just the filename
--           -- 1: Relative path
--           -- 2: Absolute path
--           -- 3: Absolute path, with tilde as the home directory
--           -- 4: Filename and parent dir, with tilde as the home directory
--         },
--       },
--       lualine_x = { "searchcount", "filetype" },
--       lualine_y = { 
--         function()
--           return vim.fn.line('$') .. " lines"
--         end
--       },
--       lualine_z = { "location" },
--     },
--   },
--   config = function(_, opts)
--     -- Show info when recording a macro
--     local function is_macro_recording()
--       local reg = vim.fn.reg_recording()
--       if reg == "" then
--         return ""
--       end
--       return "󰑋 " .. reg
--     end
--
--     table.insert(opts.sections.lualine_x, 1, {
--       is_macro_recording,
--       color = { fg = "#333333", bg = "#ff6666" },
--       separator = { left = "", right = "" },
--       cond = function()
--         return is_macro_recording() ~= ""
--       end,
--     })
--
--     -- Don't display encoding if encoding is UTF-8
--     local function encoding()
--       local ret, _ = (vim.bo.fenc or vim.go.enc):gsub("^utf%-8$", "")
--       return ret
--     end
--
--     table.insert(opts.sections.lualine_x, 1, {
--       encoding,
--       cond = function()
--         return encoding() ~= ""
--       end,
--     })
--
--     -- Don't display fileformat if fileformat is unix
--     local function fileformat()
--       local ret, _ = vim.bo.fileformat:gsub("^unix$", "")
--       return ret
--     end
--
--     table.insert(opts.sections.lualine_x, 1, {
--       fileformat,
--       cond = function()
--         return fileformat() ~= ""
--       end,
--     })
--
--     local function wordCount()
--       local wc = vim.fn.wordcount()
--       if wc == nil then
--         return ""
--       end
--       if wc["visual_words"] then -- text is selected in visual mode
--         return wc["visual_words"] .. " Words/" .. wc["visual_chars"] .. " Chars (Vis)"
--       else -- all of the document
--         return wc["words"] .. " Words"
--       end
--     end
--
--     table.insert(opts.sections.lualine_y, 1, {
--       wordCount,
--       cond = function()
--         local ft = vim.bo.filetype
--         local count = {
--           latex = true,
--           tex = true,
--           text = true,
--           markdown = true,
--           vimwiki = true,
--         }
--         return count[ft] ~= nil
--       end,
--     })
--
--     require("lualine").setup(opts)
--   end,
-- }












return {
  "nvim-lualine/lualine.nvim",
  event = "BufReadPost",
  opts = {
    extensions = { "lazy", "quickfix", "neo-tree" },
    options = {
      disabled_filetypes = { statusline = { "neo-tree", "Outline", "snacks_picker_list" } },
      component_separators = { left = '|', right = '|' },
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = function(str)
            local modes = {
              ["NORMAL"] = "N",
              ["INSERT"] = "I", 
              ["VISUAL"] = "V",
              ["V-LINE"] = "VL",
              ["V-BLOCK"] = "VB",
              ["COMMAND"] = "C",
              ["REPLACE"] = "R",
              ["TERMINAL"] = "T",
            }
            return modes[str] or str:sub(1,1)
          end,
        }
      },
      lualine_b = {
        "branch",
        {
          "diff",
          symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
          colored = true,
        },
        {
          "diagnostics",
          sources = { 'nvim_diagnostic' },
          symbols = { error = ' ', warn = ' ', info = ' ' },
          colored = true,
        },
      },
      lualine_c = {
        {
          "filesize",
          cond = function()
            return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
          end,
        },
        {
          "filename",
          file_status = true,
          newfile_status = true,
          path = 1,
        },
        {
          -- LSP server name in center
          function()
            local msg = 'No LSP'
            local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
            local clients = vim.lsp.get_clients()
            if next(clients) == nil then
              return msg
            end
            for _, client in ipairs(clients) do
              local filetypes = client.config.filetypes
              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return "LSP: " .. client.name
              end
            end
            return msg
          end,
          icon = ' ',
          color = { fg = '#ffffff', gui = 'bold' },
        },
      },
      lualine_x = { 
        "searchcount", 
        "filetype" 
      },
      lualine_y = { 
        function()
          return vim.fn.line('$') .. " lines"
        end
      },
      lualine_z = { "location" },
    },
  },
  config = function(_, opts)
    -- Show info when recording a macro
    local function is_macro_recording()
      local reg = vim.fn.reg_recording()
      if reg == "" then
        return ""
      end
      return "󰑋 " .. reg
    end

    table.insert(opts.sections.lualine_x, 1, {
      is_macro_recording,
      color = { fg = "#333333", bg = "#ff6666" },
      separator = { left = "", right = "" },
      cond = function()
        return is_macro_recording() ~= ""
      end,
    })

    -- Don't display encoding if encoding is UTF-8
    local function encoding()
      local ret, _ = (vim.bo.fenc or vim.go.enc):gsub("^utf%-8$", "")
      return ret
    end

    table.insert(opts.sections.lualine_x, 1, {
      encoding,
      cond = function()
        return encoding() ~= ""
      end,
    })

    -- Don't display fileformat if fileformat is unix
    local function fileformat()
      local ret, _ = vim.bo.fileformat:gsub("^unix$", "")
      return ret
    end

    table.insert(opts.sections.lualine_x, 1, {
      fileformat,
      cond = function()
        return fileformat() ~= ""
      end,
    })

    local function wordCount()
      local wc = vim.fn.wordcount()
      if wc == nil then
        return ""
      end
      if wc["visual_words"] then -- text is selected in visual mode
        return wc["visual_words"] .. " Words/" .. wc["visual_chars"] .. " Chars (Vis)"
      else -- all of the document
        return wc["words"] .. " Words"
      end
    end

    table.insert(opts.sections.lualine_y, 1, {
      wordCount,
      cond = function()
        local ft = vim.bo.filetype
        local count = {
          latex = true,
          tex = true,
          text = true,
          markdown = true,
          vimwiki = true,
        }
        return count[ft] ~= nil
      end,
    })

    require("lualine").setup(opts)
  end,
}
