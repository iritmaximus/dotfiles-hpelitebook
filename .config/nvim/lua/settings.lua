local o   = vim.o
local g   = vim.g
local go  = vim.go


-- map leader as space
g.mapleader      = ' '
g.maplocalleader = ' '

-- syntax
vim.cmd([[ syntax on ]])

-- clipboard
o.clipboard = 'unnamedplus'

-- nice UI things
o.number         = true               -- set line numbers
o.relativenumber = true       -- set relative line numbers
o.scrolloff      = 10              -- screen rolls x amount of lines before
o.signcolumn     = 'yes'         -- shows the column on the left if there is something to show


-- tabs and indenting
o.tabstop     = 2                 -- tablength?
o.softtabstop = 2             -- not completely sure xd
o.shiftwidth  = 2              -- also not sure
o.autoindent  = true           -- automatically indents, duh...
o.smartindent = true          -- knows how to live with if and such (?)
o.smarttab    = true             -- lol
o.expandtab   = true            -- no idea


-- linewrapping and hidden chars
o.wrap      = false                -- no linewrapping if lines go over the border
o.textwidth = 0               -- disables line hard wrapping
o.list      = true                 -- absolutely no clue
o.listchars = 'eol:.,tab:>-,trail:~,extends:>,precedes:<'


-- cursor lines
o.cursorline   = false         -- horisontal line where the cursor is
o.cursorcolumn = false       -- vertical cursorline


-- bottom row commands
o.showcmd   = true              -- lol not this one either
o.showmode  = true            -- shows which mode you are in
o.conceallevel = 0            -- does not 'conceal' for ex. quotations in json


-- no noise from nvim
-- o.noerrorbells visualbell t_vb = '' -- disables noises


-- searching
o.ignorecase  = true           -- search is not case sensitive if all lower
o.smartcase   = true            -- if you include upper, then it is case sensitive
o.incsearch   = true            -- suggest autocomplete's smartly???
o.hlsearch    = true             -- highlights everything searched


-- random settings
o.mouse = 'a'                 -- mouse support
o.t_Co  = 256                  -- set support for 256 colors



-- Undo and backup options
o.backup      = false
o.writebackup = false
o.undofile    = true
o.swapfile    = false
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir   = '/tmp/'


-- colorscheme
vim.cmd("colorscheme dracula")



-- Pluginless stuff

-- o.path = "**"
-- o.wildmenu = true

-- command! MakeTags !ctags -R .  " command to create the 'tags'
