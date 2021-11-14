-- auto install packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute "packadd packer.nvim"
end

return require("packer").startup(
  {
    function(use)
      -- Packer can manage itself
      use {
        "wbthomason/packer.nvim",
        config = function()
          require("config.packer")
        end
      }

      use "nvim-lua/plenary.nvim"

      -- icons
      use "kyazdani42/nvim-web-devicons"

      -- easy map
      use "Iron-E/nvim-cartographer"

      -- session
      -- use {
      --   "rmagatti/auto-session",
      --   config = function()
      --     require("config.session")
      --   end,
      --   opt = true
      -- }

      -- comments
      use {
        "tpope/vim-commentary",
        config = function()
          require("config.commentary")
        end
      }
      use {
        "folke/todo-comments.nvim",
        config = function()
          require("config.todo-comments")
        end
      }
      use "suy/vim-context-commentstring"

      -- color theme
      -- use 'haishanh/night-owl.vim'
      use "Limbicsys/zephyr-nvim"
      -- use 'joshdick/onedark.vim'

      -- markdown
      use {
        "npxbr/glow.nvim",
        run = ":GlowInstall",
        ft = "markdown"
      }

      -- status line
      use {
        "NTBBloodbath/galaxyline.nvim",
        branch = "main",
        requires = "liuchengxu/vista.vim",
        config = function()
          require("config.statusline")
        end
      }
      use {
        "akinsho/bufferline.nvim",
        config = function()
          require("config.bufferline")
        end
      }

      -- git
      use {
        "lewis6991/gitsigns.nvim",
        config = function()
          require("config.git")
        end
      }
      use {
        "tpope/vim-fugitive",
        config = function()
          require("config.fugitive")
        end
      }
      use {
        "sindrets/diffview.nvim",
        config = function()
          require("config.diffview")
        end
      }
      -- use 'airblade/vim-gitgutter'

      -- project
      use "tpope/vim-projectionist"
      use {
        "windwp/nvim-projectconfig",
        config = function()
          require("nvim-projectconfig").load_project_config()
        end
      }

      -- use {
      --   "easymotion/vim-easymotion",
      --   config = function()
      --     require("config.easymotion")
      --   end
      -- }

      use {
        "phaazon/hop.nvim",
        branch = "v1", -- optional but strongly recommended
        config = function()
          require("config.hop")
        end
      }

      use "tpope/vim-surround"

      -- use 'glepnir/indent-guides.nvim'
      use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
          require("config.indentline")
        end
      }

      -- use 'itchyny/vim-cursorword'
      -- use 'dominikduda/vim_current_word'
      use {
        "RRethy/vim-illuminate",
        config = function()
          require("config.current-word")
        end
      }

      -- use 'neoclide/coc.nvim', {'branch': 'release'}

      -- language
      -- use 'fatih/vim-go', { 'do': ':GoUpdateBinaries' , 'for': 'go'}
      -- use 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}
      -- use 'jackguo380/vim-lsp-cxx-highlight', {'for': 'cpp'}
      use {
        "neoclide/jsonc.vim",
        tf = "json"
      }

      -- fuzzing finder
      use "nvim-lua/popup.nvim"
      use {
        "nvim-telescope/telescope.nvim",
        config = function()
          require("config.telescope")
        end
      }

      use {
        "junegunn/fzf",
        run = function()
          vim.fn["fzf#install()"]()
        end
      }

      use {
        "junegunn/fzf.vim",
        config = function()
          require("config.fzf")
        end
      }

      -- use {
      --   "glepnir/dashboard-nvim",
      --   config = function()
      --     require("config.dashboard")
      --   end
      -- }
      use "MattesGroeger/vim-bookmarks"
      -- use 'bkad/CamelCaseMotion' ", {'on': ['<Plug>CamelCaseMotion_iw', '<Plug>CamelCaseMotion_b', '<Plug>CamelCaseMotion_f']}
      use {
        "chaoren/vim-wordmotion",
        config = function()
          require("config.wordmotion")
        end
      }

      -- use 'edkolev/tmuxline.vim'
      use {
        "ludovicchabant/vim-gutentags",
        config = function()
          require("config.gutentags")
        end
      }
      use {
        "skywind3000/asynctasks.vim",
        config = function()
          require("config.asynctasks")
        end
      }
      use "skywind3000/asyncrun.vim"
      use {
        "puremourning/vimspector",
        keys = {
          "<Plug>VimspectorContinue",
          "<Plug>VimspectorToggleBreakpoint",
          "<Plug>VimspectorToggleConditionalBreakpoint",
          "<Plug>VimspectorAddFunctionBreakpoint"
        },
        config = function()
          require("config.vimspector")
        end
      }

      use {
        "liuchengxu/vista.vim",
        config = function()
          require("config.vista")
        end
      }
      use {
        "theniceboy/fzf-gitignore",
        run = ":UpdateRemotePlugins",
        cmd = "FzfGitignore",
        keys = " <Plug>(fzf-gitignore)"
      }
      use {
        "voldikss/vim-floaterm",
        config = function()
          require("config.floaterm")
        end
      }
      use {
        "mg979/vim-visual-multi",
        branch = "master"
      }

      -- snippets
      -- use 'honza/vim-snippets'
      use "rafamadriz/friendly-snippets"
      use {
        "hrsh7th/vim-vsnip",
        requires = {
          "rafamadriz/friendly-snippets"
          -- "hrsh7th/vim-vsnip-integ"
        },
        config = function()
          require("config.vsnip")
        end
      }

      -- use {
      --   "L3MON4D3/LuaSnip",
      --   config = function()
      --     require("config.luasnip")
      --   end
      -- }
      -- use {"saadparwaiz1/cmp_luasnip"}

      -- text objects
      use "Limbicsys/vim-indent-object"
      use "kana/vim-textobj-user"
      use "kana/vim-textobj-entire"

      use {
        "nvim-treesitter/nvim-treesitter",
        -- We recommend updating the parsers on update
        run = ":TSUpdate",
        branch = "0.5-compat",
        config = function()
          require("config.treesitter")
        end
      }
      -- use 'romgrk/nvim-treesitter-context'

      use {
        "nvim-treesitter/playground",
        requires = "nvim-treesitter/nvim-treesitter",
        cmd = "TSPlaygroundToggle",
        config = function()
          require("config.treesitter-playground")
        end
      }

      -- tree
      use {
        "kyazdani42/nvim-tree.lua",
        config = function()
          require("config.tree")
        end
      }

      -- quick fix
      use {
        "kevinhwang91/nvim-bqf",
        config = function()
          require("config.quickfix")
        end
      }

      -- grep
      use {
        "mhinz/vim-grepper",
        cmd = "Grepper",
        keys = "<plug>(GrepperOperator)",
        config = function()
          require("config.grepper")
        end
      }

      use {
        "windwp/nvim-autopairs",
        -- requires = "hrsh7th/nvim-cmp",
        config = function()
          require("config.autopairs")
        end
      }

      -- lsp
      use {
        "ray-x/lsp_signature.nvim",
        config = function()
          require("config.lsp_signature")
        end,
        opt = true
      }

      use {
        "neovim/nvim-lspconfig",
        requires = {
          "kabouzeid/nvim-lspinstall",
          "folke/lua-dev.nvim",
          "RRethy/vim-illuminate",
          "ray-x/lsp_signature.nvim",
          "hrsh7th/cmp-nvim-lsp"
        },
        config = function()
          require("config.lsp")
          require("config.lsp_handlers")
        end
      }

      use "kabouzeid/nvim-lspinstall"
      -- use 'nvim-lua/completion-nvim'
      use {
        "tami5/lspsaga.nvim",
        branch = "nvim51",
        config = function()
          require("config.lspsaga")
        end
      }
      -- use 'steelsojka/completion-buffers'
      use "folke/lua-dev.nvim"
      -- use 'nvim-lua/lsp-status.nvim'
      -- use 'RishabhRD/popfix'
      -- use 'RishabhRD/nvim-lsputils'
      -- use {
      --   "hrsh7th/nvim-compe",
      --   config = function()
      --     require("config.complete")
      --   end
      -- }

      use "hrsh7th/cmp-buffer"
      use "hrsh7th/cmp-nvim-lsp"
      use "hrsh7th/cmp-path"
      use {
        "hrsh7th/cmp-vsnip",
        requires = "hrsh7th/vim-vsnip"
      }
      use {
        "hrsh7th/nvim-cmp",
        requires = {
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-vsnip",
          "windwp/nvim-autopairs"
        },
        config = function()
          require("config.complete")
        end
      }

      use {
        "norcalli/nvim-colorizer.lua",
        ft = {"lua", "vim"},
        config = function()
          require("colorizer").setup()
        end
      }

      use {
        -- "lukas-reineke/format.nvim",
        "mhartington/formatter.nvim",
        config = function()
          require("config.format")
        end
      }

      use {
        "windwp/nvim-spectre",
        config = function()
          require("config.spectre")
        end
      }

      use {
        "max397574/better-escape.nvim",
        config = function()
          require("config.better-escape")
        end
      }

      use {
        "milkypostman/vim-togglelist",
        config = function()
          require("config.togglelist")
        end
      }
    end,
    config = {
      display = {
        open_fn = require("packer.util").float
      }
    }
  }
)
