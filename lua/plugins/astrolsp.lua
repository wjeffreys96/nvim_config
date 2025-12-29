-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
---@type LazySpec
local oresat_zephyr_path = "/home/will/distroboxes/oresat-zephyr/src/oresat/firmware"
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      autoformat = false, -- enable or disable auto formatting on start
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = false, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = false, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      "dts_lsp",
    },
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      dts_lsp = {
        settings = {
          devicetree = {
            defaultIncludePaths = {},
            cwd = string.format("%s", vim.fn.getcwd()),
            defaultShowFormattingErrorAsDiagnostics = false,
            defaultBindingType = "Zephyr",
            defaultZephyrBindings = {},
            autoChangeContext = true,
            allowAdhocContexts = true,
            contexts = {
              {
                ctxName = "frdm_mcxn947",
                cwd = "/home/will/dev/zephyr_pg",
                includePaths = {
                  oresat_zephyr_path .. "/modules/hal/nxp/dts",
                  oresat_zephyr_path .. "/modules/hal/stm32/dts",
                  oresat_zephyr_path .. "/zephyr/include",
                  oresat_zephyr_path .. "/zephyr/include/zephyr",
                  oresat_zephyr_path .. "/zephyr/dts/common",
                  oresat_zephyr_path .. "/zephyr/dts/vendor",
                  oresat_zephyr_path .. "/zephyr/dts/rx",
                  oresat_zephyr_path .. "/zephyr/dts/x86",
                  oresat_zephyr_path .. "/zephyr/dts/xtensa",
                  oresat_zephyr_path .. "/zephyr/dts/sparc",
                  oresat_zephyr_path .. "/zephyr/dts/riscv",
                  oresat_zephyr_path .. "/zephyr/dts/posix",
                  oresat_zephyr_path .. "/zephyr/dts/arm64",
                  oresat_zephyr_path .. "/zephyr/dts/arm",
                  oresat_zephyr_path .. "/zephyr/dts/arc",
                  oresat_zephyr_path .. "/zephyr/dts",
                },
                dtsFile = oresat_zephyr_path .. "/zephyr/boards/nxp/frdm_mcxn947/frdm_mcxn947_mcxn947_cpu0.dts",
                overlays = {
                  "/home/will/dev/zephyr_pg/boards/frdm_mcxn947_mcxn947_cpu0.overlay",
                },
                bindingType = "Zephyr",
                zephyrBindings = {
                  oresat_zephyr_path .. "/zephyr/dts/bindings",
                },
              },
            },
          },
        },
      },
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = "dev" },
              extraArgs = { "--profile", "rust-analyzer" },
              allTargets = false,
            },
          },
        },
      },
    },
    -- customize how language servers are attached
    handlers = {
      dts_lsp = function(_, opts)
        opts.cmd = { "devicetree-language-server", "--stdio" }
        opts.filetypes = { "dts", "dtsi" }
        opts.root_dir = require("lspconfig").util.root_pattern("zephyr", ".git", ".")

        local capabilities = vim.lsp.protocol.make_client_capabilities()

        -- Enable semantic tokens
        capabilities.textDocument = capabilities.textDocument or {}
        capabilities.textDocument.semanticTokens = {
          dynamicRegistration = false,
          requests = {
            range = false,
            full = true,
          },
          tokenTypes = {
            "namespace",
            "class",
            "enum",
            "interface",
            "struct",
            "typeParameter",
            "type",
            "parameter",
            "variable",
            "property",
            "enumMember",
            "decorator",
            "event",
            "function",
            "method",
            "macro",
            "label",
            "comment",
            "string",
            "keyword",
            "number",
            "regexp",
            "operator",
          },
          tokenModifiers = {
            "declaration",
            "definition",
            "readonly",
            "static",
            "deprecated",
            "abstract",
            "async",
            "modification",
            "documentation",
            "defaultLibrary",
          },
          formats = { "relative" },
        }

        -- Enable formatting
        capabilities.textDocument.formatting = {
          dynamicRegistration = false,
        }

        -- Enable folding range support
        capabilities.textDocument.foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        }

        opts.capabilities = capabilities
        require("lspconfig")["dts_lsp"].setup(opts)
      end,
      -- a function without a key is simply the default handler, functions take two parameters, the server name and the configured options table for that server
      -- function(server, opts) require("lspconfig")[server].setup(opts) end

      -- the key is the server that is being setup with `lspconfig`
      -- rust_analyzer = false, -- setting a handler to false will disable the set up of that language server
      -- pyright = function(_, opts) require("lspconfig").pyright.setup(opts) end -- or a custom handler function can be passed
    },
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      -- first key is the `augroup` to add the auto commands to (:h augroup)
      lsp_codelens_refresh = {
        -- Optional condition to create/delete auto command group
        -- can either be a string of a client capability or a function of `fun(client, bufnr): boolean`
        -- condition will be resolved for each client on each execution and if it ever fails for all clients,
        -- the auto commands will be deleted for that buffer
        cond = "textDocument/codeLens",
        -- cond = function(client, bufnr) return client.name == "lua_ls" end,
        -- list of auto commands to set
        {
          -- events to trigger
          event = { "InsertLeave", "BufEnter" },
          -- the rest of the autocmd options (:h nvim_create_autocmd)
          desc = "Refresh codelens (buffer)",
          callback = function(args)
            ---@diagnostic disable-next-line: undefined-field
            if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
          end,
        },
      },
    },
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        -- a `cond` key can provided as the string of a server capability to be required to attach, or a function with `client` and `bufnr` parameters from the `on_attach` that returns a boolean
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        ["<Leader>uY"] = {
          function() require("astrolsp.toggles").buffer_semantic_tokens() end,
          desc = "Toggle LSP semantic highlight (buffer)",
          cond = function(client)
            ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
            return client.supports_method "textDocument/semanticTokens/full" and vim.lsp.semantic_tokens ~= nil
          end,
        },
      },
    },
    -- A custom `on_attach` function to be run after the default `on_attach` function
    -- takes two parameters `client` and `bufnr`  (`:h lspconfig-setup`)
    -- on_attach = function(client, bufnr)
    -- this would disable semanticTokensProvider for all clients
    -- client.server_capabilities.semanticTokensProvider = nil
    -- end,
  },
}
