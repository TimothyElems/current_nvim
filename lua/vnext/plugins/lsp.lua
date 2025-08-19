return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      servers = {
        -- Shell/Scripting
        bashls = {},

        -- Docker
        dockerls = {},

        -- Go
        gopls = {
          settings = {
            gofumpt = true,
            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_cgo = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            analyses = {
              fieldalignment = true,
              nilness = true,
              unusedparams = true,
              unusedwrite = true,
              useany = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            semanticTokens = true,
          },
        },

        -- Rust
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              checkOnSave = {
                allFeatures = true,
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
              procMacro = {
                enable = true,
                ignored = {
                  ["async-trait"] = { "async_trait" },
                  ["napi-derive"] = { "napi" },
                  ["async-recursion"] = { "async_recursion" },
                },
              },
              inlayHints = {
                bindingModeHints = {
                  enable = false,
                },
                chainingHints = {
                  enable = true,
                },
                closingBraceHints = {
                  enable = true,
                  minLines = 25,
                },
                closureReturnTypeHints = {
                  enable = "never",
                },
                lifetimeElisionHints = {
                  enable = "never",
                  useParameterNames = false,
                },
                maxLength = 25,
                parameterHints = {
                  enable = true,
                },
                reborrowHints = {
                  enable = "never",
                },
                renderColons = true,
                typeHints = {
                  enable = true,
                  hideClosureInitialization = false,
                  hideNamedConstructor = false,
                },
              },
              lens = {
                enable = true,
                debug = {
                  enable = true,
                },
                implementations = {
                  enable = true,
                },
                run = {
                  enable = true,
                },
                methodReferences = {
                  enable = true,
                },
                references = {
                  adt = {
                    enable = true,
                  },
                  enumVariant = {
                    enable = true,
                  },
                  method = {
                    enable = true,
                  },
                  trait = {
                    enable = true,
                  },
                },
              },
            },
          },
        },

        -- C/C++
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        },

        -- Zig
        zls = {
          settings = {
            zls = {
              enable_inlay_hints = true,
              enable_snippets = true,
              warn_style = true,
              enable_semantic_tokens = true,
              operator_completions = true,
              include_at_in_builtins = true,
              max_detail_length = 1048576,
            },
          },
        },
        -- Dart
        dartls = {
          cmd = { "dart", "language-server", "--protocol=lsp" },
          filetypes = { "dart" },
          init_options = {
            onlyAnalyzeProjectsWithOpenFiles = true,
            suggestFromUnimportedLibraries = true,
            closingLabels = true,
            outline = true,
            flutterOutline = true,
          },
          settings = {
            dart = {
              completeFunctionCalls = true,
              showTodos = true,
              enableSdkFormatter = true,
              lineLength = 100,
            },
          },
        },

        -- D Language
        serve_d = {
          filetypes = { "d" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("dub.json", "dub.sdl", ".git")(fname)
          end,
        },

        -- V Language
        -- Note: V LSP server is vls, but it's still experimental
        -- You might need to build it from source: https://github.com/vlang/vls
        vls = {
          cmd = { "vls" },
          filetypes = { "v", "vsh" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("v.mod", ".git")(fname)
          end,
        },

        -- Crystal
        crystalline = {
          cmd = { "crystalline" },
          filetypes = { "crystal" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("shard.yml", ".git")(fname)
          end,
        },

        -- Lua
        lua_ls = {
          settings = {
            format = {
              enable = false, -- let conform handle the formatting
            },
            diagnostics = { globals = { "vim" } },
            telemetry = { enable = false },
            hint = { enable = true },
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              codeLens = {
                enable = true,
              },
              doc = {
                privateName = { "^_" },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
              completion = {
                callSnippet = "Replace",
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },

        -- Additional compiled languages

        -- Nim
        nimls = {
          filetypes = { "nim" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("*.nimble", ".git")(fname)
          end,
        },

        -- Haskell
        hls = {
          filetypes = { "haskell", "lhaskell" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("*.cabal", "stack.yaml", "cabal.project", "package.yaml",
              "hie.yaml", ".git")(fname)
          end,
        },

        -- OCaml
        ocamllsp = {
          filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("*.opam", "esy.json", "package.json", "dune-project",
              "dune-workspace", ".git")(fname)
          end,
        },

        -- Elixir
        elixirls = {
          cmd = { "elixir-ls" },
          filetypes = { "elixir", "eelixir", "heex", "surface" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("mix.exs", ".git")(fname)
          end,
        },

        -- Erlang
        erlangls = {
          cmd = { "erlang_ls" },
          filetypes = { "erlang" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("rebar.config", "erlang.mk", ".git")(fname)
          end,
        },

        -- Scala
        metals = {
          init_options = {
            statusBarProvider = "on",
            isHttpEnabled = true,
            compilerOptions = {
              snippetAutoIndent = false,
            },
          },
          filetypes = { "scala", "sbt", "java" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("build.sbt", "build.sc", "build.gradle", "pom.xml", ".git")(
              fname)
          end,
        },

        -- Kotlin
        kotlin_language_server = {
          filetypes = { "kotlin" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("settings.gradle", "settings.gradle.kts", "build.gradle",
              "build.gradle.kts", "pom.xml", ".git")(fname)
          end,
        },

        -- Other useful servers
        marksman = {}, -- Markdown
        pyright = {},  -- Python
        templ = {},    -- Templ
        terraformls = {
          filetypes = { "terraform", "terraform-vars", "tf" },
        },
        tinymist = {}, -- Typst
        ts_ls = {},    -- TypeScript/JavaScript
        yamlls = {
          capabilities = {
            textDocument = {
              foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
              },
            },
          },
          settings = {
            redhat = { telemetry = { enabled = false } },
            yaml = {
              schemaStore = {
                enable = true,
                url = "https://www.schemastore.org/api/json/catalog.json",
              },
              format = { enabled = false },
              validate = false,
              schemas = {
                kubernetes = "*.yaml",
                ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] =
                "azure-pipelines*.{yml,yaml}",
                ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/tasks"] =
                "roles/tasks/*.{yml,yaml}",
                ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook"] =
                "*play*.{yml,yaml}",
                ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
                ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
                ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
                ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] =
                "*gitlab-ci*.{yml,yaml}",
                ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] =
                "*api*.{yml,yaml}",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
                "*docker-compose*.{yml,yaml}",
                ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] =
                "*flow*.{yml,yaml}",
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
          end

          -- Enhanced keybindings for compiled languages
          map("<leader>lk", vim.lsp.buf.hover, "Hover")
          map("<leader>lR", vim.lsp.buf.rename, "Rename")
          map("<leader>la", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
          map("<leader>lD", vim.lsp.buf.declaration, "Declaration")
          map("<leader>ld", vim.lsp.buf.definition, "Definition")
          map("<leader>lt", vim.lsp.buf.type_definition, "Type Definition")
          map("<leader>li", vim.lsp.buf.implementation, "Implementation")
          map("<leader>lr", vim.lsp.buf.references, "References")
          -- map("<leader>lf", vim.lsp.buf.format, "Format")
          map("<leader>ls", vim.lsp.buf.signature_help, "Signature Help")
          map("<leader>lw", vim.lsp.buf.workspace_symbol, "Workspace Symbol")
          -- Diagnostic mappings
          map("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
          map("]d", vim.diagnostic.goto_next, "Next Diagnostic")
          map("<leader>le", vim.diagnostic.open_float, "Show Diagnostic")
          map("<leader>lq", vim.diagnostic.setloclist, "Diagnostic List")

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
              end,
            })
          end
        end,
      })

      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())
      for server, server_opts in pairs(opts.servers) do
        server_opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server_opts.capabilities or {})
        lspconfig[server].setup(server_opts)
      end
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- Compiled language servers
        "gopls",
        "rust-analyzer",
        "clangd",
        "zls",
        "dartls",
        "serve-d",
        "crystalline",
        "lua-language-server",
        "haskell-language-server",
        "elixir-ls",
        "kotlin-language-server",
        -- Additional tools
        "bash-language-server",
        "dockerfile-language-server",
        "marksman",
        "pyright",
        "terraform-ls",
        "yaml-language-server",
        "typescript-language-server",
      },
    },
  },
}
