vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'                    -- packer
    use 'mbbill/undotree'                           -- undo tree
    use 'norcalli/nvim-colorizer.lua'               -- colourizer
    use 'Alligator/accent.vim'                      -- color scheme
    use 'e-ink-colorscheme/e-ink.nvim'              -- color scheme
    use 'seblj/nvim-echo-diagnostics'
    use 'nvim-treesitter/nvim-treesitter'
    use {                                           -- lsp
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},

            {'L3MON4D3/LuaSnip'},
        }
    }
    -- use 'tlaplus-community/tlaplus-nvim-plugin'
    -- use 'tidalcycles/vim-tidal'

    use 'junegunn/goyo.vim'                         -- zen modee :)
    use 'junegunn/limelight.vim'                    -- hghilight for stuff

    local language_specific = true
    if language_specific then
        use 'kana/vim-textobj-user'
        use 'neovimhaskell/nvim-hs.vim'
        use 'isovector/cornelis'
        use {
            'Julian/lean.nvim',
            requires = {
                {'nvim-lua/plenary.nvim'}
            }
        }
    end
end)
