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

      -- session
      use {
        "rmagatti/auto-session",
        config = function()
          require("config.session")
        end
      }

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
        "glepnir/galaxyline.nvim",
        branch = "main",
        requires = "liuchengxu/vista.vim",
        config = function()
          require("config.statusline")
        end
      }
      use {
        "akinsho/nvim-bufferline.lua",
        config = function()
          require("config.bufferline")
        end
      }

      -- git
      use "lewis6991/gitsigns.nvim"
      use "tpope/vim-fugitive"
      use "sindrets/diffview.nvim"
      -- use 'airblade/vim-gitgutter'

      -- project
      use "tpope/vim-projectionist"
      use {
        "windwp/nvim-projectconfig",
        config = function()
          require("nvim-projectconfig").load_project_config()
        end
      }

      use {
        "easymotion/vim-easymotion",
        config = function()
          require("config.easymotion")
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
      -- use 'jiangmiao/auto-pairs'
      use {
        "glepnir/dashboard-nvim",
        config = function()
          require("config.dashboard")
        end
      }
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
        "fszymanski/fzf-gitignore",
        run = ":UpdateRemotePlugins"
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
      use "hrsh7th/vim-vsnip-integ"
      use {
        "hrsh7th/vim-vsnip",
        requires = {
          "rafamadriz/friendly-snippets",
          "hrsh7th/vim-vsnip-integ"
        },
        config = function()
          require("config.vsnip")
        end
      }

      -- text objects
      use "michaeljsmith/vim-indent-object"
      use "kana/vim-textobj-user"
      use "kana/vim-textobj-entire"

      use {
        "nvim-treesitter/nvim-treesitter",
        -- We recommend updating the parsers on update
        run = ":TSUpdate",
        config = function()
          require("config.treesitter")
        end
      }
      -- use 'romgrk/nvim-treesitter-context'

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
        requires = "hrsh7th/nvim-compe",
        config = function()
          require("config.autopairs")
        end
      }

      -- lsp
      use {
        "neovim/nvim-lspconfig",
        requires = {
          "kabouzeid/nvim-lspinstall",
          "folke/lua-dev.nvim",
          "RRethy/vim-illuminate"
        },
        config = function()
          require("config.lsp")
        end
      }

      use "kabouzeid/nvim-lspinstall"
      -- use 'nvim-lua/completion-nvim'
      use {
        "glepnir/lspsaga.nvim",
        config = function()
          require("config.lspsaga")
        end
      }
      -- use 'steelsojka/completion-buffers'
      use "folke/lua-dev.nvim"
      -- use 'nvim-lua/lsp-status.nvim'
      -- use 'RishabhRD/popfix'
      -- use 'RishabhRD/nvim-lsputils'
      use {
        "hrsh7th/nvim-compe",
        config = function()
          require("config.complete")
        end
      }

      use {
        "norcalli/nvim-colorizer.lua",
        config = function()
          require("colorizer").setup()
        end
      }

      use "lukas-reineke/format.nvim"
    end,
    config = {
      display = {
        open_fn = require("packer.util").float
      }
    }
  }
)
