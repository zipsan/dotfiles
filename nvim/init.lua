require("options")

-- lazy.nvim のセットアップ
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "       -- リーダーキーをスペースに設定

require("lazy").setup({
    {
          "neovim/nvim-lspconfig",
          dependencies = {
              "williamboman/mason.nvim",
              "williamboman/mason-lspconfig.nvim",
              "hrsh7th/cmp-nvim-lsp",
          },
          config = function()
              -- 必ず最初にmason.nvimをsetupする
              require("mason").setup()
              require("mason-lspconfig").setup({
                  ensure_installed = { "pyright" },
                  automatic_installation = true,
              })

              -- LSP Config
              local capabilities = require('cmp_nvim_lsp').default_capabilities()

              require("lspconfig").pyright.setup({
                  capabilities = capabilities,
                  on_attach = function(client, bufnr)
                      -- LSPが起動したときに実行される設定
                  end,
                  settings = {
                      python = {
                          analysis = {
                              autoSearchPaths = true,
                              diagnosticMode = "workspace",
                              useLibraryCodeForTypes = true,
                          },
                      },
                  },
              })
          end,
      },
      {
          "hrsh7th/nvim-cmp",
          event = "InsertEnter",
          dependencies = {
              "hrsh7th/cmp_luasnip",
              "L3MON4D3/LuaSnip",
              "saadparwaiz1/cmp_luasnip",
          },
          config = function()
              local cmp = require("cmp")
              local luasnip = require("luasnip")
              cmp.setup({
                  snippet = {
                      expand = function(args)
                          luasnip.lsp_expand(args.body)
                      end,
                  },
                  mapping = cmp.mapping.preset.insert({
                      ["<C-n>"] = cmp.mapping.select_next_item(),
                      ["<C-p>"] = cmp.mapping.select_prev_item(),
                      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                      ["<C-f>"] = cmp.mapping.scroll_docs(4),
                      ["<C-Space>"] = cmp.mapping.complete(),
                      ["<CR>"] = cmp.mapping.confirm({ select = true }),
                  }),
                  sources = cmp.config.sources({
                      { name = "nvim_lsp" },
                      { name = "luasnip" },
                      { name = "buffer" },
                      { name = "path" },
                  }),
              })
          end
      },
      {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- インストール後にパーサーを更新
    config = function()
      require("nvim-treesitter.configs").setup({
        -- 使用する言語のパーサーを指定
        ensure_installed = {
          "python",
          "lua",
          "vim",
          "vimdoc",
          "query",
          -- 他の言語 (必要に応じて追加)
          "c",
          "cpp",
          "java",
          "javascript",
          "typescript",
          "html",
          "css",
        },

        -- 自動的にパーサーをインストール/更新
        auto_install = true,

        highlight = {
          enable = true, -- ハイライトを有効化
          -- disable = { "python" }, -- 特定の言語のハイライトを無効化 (必要な場合)
        },
        indent = {
          enable = true, -- インデントを有効化
          -- disable = { "python" },  -- 特定の言語のインデントを無効化 (必要な場合)
        },
        -- その他の nvim-treesitter の設定 (必要に応じて)
        -- incremental_selection = { ... },
        -- textobjects = { ... },
        -- ...
      })

      -- (オプション) nvim-treesitter-textobjects の設定
      -- require("nvim-treesitter.configs").setup({
      --   textobjects = {
      --     select = {
      --       enable = true,
      --       -- ...
      --     },
      --     move = {
      --       enable = true,
      --       -- ...
      --     },
      --     -- ...
      --   },
      -- })

      -- (オプション) nvim-treesitter-context の設定
      -- ...
    end,
    dependencies = {
      -- (オプション) 便利な textobjects を追加 (関数、クラスなどの選択)
      -- "nvim-treesitter/nvim-treesitter-textobjects",

      -- (オプション) 長い関数などのコンテキストを表示
      -- "romgrk/nvim-treesitter-context",
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme tokyonight")
    end,
  },
})
