-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)

  -- Package manager
  use "wbthomason/packer.nvim"


  -- LSP things
  -- use({
  --   "dense-analysis/ale",
  --   config = function() require("config.ale").setup() end,
  -- })
  -- use({
  --   "jose-elias-alvarez/null-ls.nvim",
  --   config = function() require("plugins.null-ls").setup() end,
  --   requires = { "nvim-lua/plenary.nvim" },
  -- })

  -- use({
  --   "jose-elias-alvarez/typescript.nvim",
  --   requires = { "nvim-lua/plenary.nvim" },
  -- })


  -- Themes and colors
  use "dylanaraps/wal.vim"
  use "NLKNguyen/papercolor-theme"
  use "joshdick/onedark.vim"
  use { "dracula/vim", as = "dracula" }


  -- Linting and such


  -- Useful utilities
  use "tpope/vim-commentary"
  use "somini/vim-autoclose"
  use "Yggdroot/indentLine"

  -- Git
  use "tpope/vim-fugitive"
  use "airblade/vim-gitgutter"



end)
