"-----------------------
"| Custom Key Mappings |
"-----------------------
let g:mapleader = ','
"space bar to enter command mode
nnoremap <space> :
":Q to quit without saving
cnoremap Q q!
"Meta + . to repeat last command
nnoremap <M-.> <Cmd><up><CR>
",0 to go to end of line
nnoremap <leader>0 $
",y/p to copy/paste to system
vnoremap <leader>y "+y
nnoremap <leader>y "+y
vnoremap <leader>p "+p
nnoremap <leader>p "+p
"Y to copy to end of line
nnoremap Y y$
"Calculate current line
py from math import *
nnoremap <leader>c yy:echo pyeval('<C-r>0')<CR>
"Calculate current line to register a and paste result with =
nnoremap <leader>C yy:let @a = string(pyeval('<C-r>0'))<CR>$a = <esc>"ap
"Replace =expr with result
vnoremap <leader>= s<esc>:let @a = string(pyeval('<C-r>"'))<CR>"ap
"Insert new line above/below
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>
"Drag lines
vnoremap <M-j> <Cmd>m'>+<CR>gv
vnoremap <M-k> <Cmd>m-2<CR>gv
nnoremap <M-j> ddp
nnoremap <M-k> ddkP
inoremap <M-j> <esc>ddp
inoremap <M-k> <esc>ddkP
vnoremap <M-down> <Cmd>m'>+<CR>gv
vnoremap <M-up> <Cmd>m-2<CR>gv
nnoremap <M-down> ddp
nnoremap <M-up> ddkP
inoremap <M-down> <esc>ddp
inoremap <M-up> <esc>ddkP
",/ to clear search highlighting
nnoremap <leader>/ <Cmd>noh<CR>

"-------------------
"| Plugin Mappings |
"-------------------
"Terminal Floaterm
nnoremap <C-t> <Cmd>FloatermToggle<CR>
tnoremap <C-t> <C-\><C-n><Cmd>FloatermToggle<CR>
"LazyGit
nnoremap <leader>gg <Cmd>FloatermNew lazygit<CR>
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"------------
"| Settings |
"------------
set number				"Enable line numbers
set relativenumber		"Line numbers relative to current line
set tabstop=4			"4 spaces for tab
set shiftwidth=4		"4 spaces for tab in front
set expandtab			"Converts tabs to spaces
set smarttab			"smarter tabbing
set autoindent			"Autoindents next line
set smartindent			"Smart indents in code
colorscheme slate		"Set colorscheme 
syntax on				"Enable syntax highlighting
set mouse=a				"Enables mouse
set linebreak			"Prevents words from breaking over line
set breakindent			"Indent wrapped lines
let &showbreak='    '	"Indent amount
set scrolloff=7         "keeps 7 lines below cursor when scrolling
set showcmd             "Shows current mode"

"--------------------------------------
"| Auto install vim-plug if not found |
"--------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"--------------------------------------
"| Auto PlugInstall upon opening nvim |
"--------------------------------------
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

"-----------
"| Plugins |
"-----------
call plug#begin('~/.config/nvim/autoload/plugged')
"Autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
"Snippets
Plug 'L3MON4D3/LuaSnip', {'tag': 'v<CurrentMajor>.*', 'do': 'make install_jsregexp'}
Plug 'saadparwaiz1/cmp_luasnip'
"Open a terminal over current session
Plug 'voldikss/vim-floaterm'
"Latex support
Plug 'lervag/vimtex'
"Buffer tab header
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
"File explorer
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
"Git status
Plug 'mhinz/vim-signify'
"Start screen with quick file access
Plug 'mhinz/vim-startify'
"Comment/uncomment lines
Plug 'tpope/vim-commentary'
"Custom info bar
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
"Undo tree of all undos
Plug 'mbbill/undotree'
"Quick word maneuvering
Plug 'unblevable/quick-scope'
"Quick container editing
Plug 'tpope/vim-surround' 
"Dependencies
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'

" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'

" let g:startify_custom_header = [
"  \ '     ___        ___        ___                              ___     ',
"  \ '    /__/\      /  /\      /  /\          ___     ___       /__/\    ',
"  \ '    \  \:\    /  /:/_    /  /::\        /__/\   /  /\     |  |::\   ',
"  \ '     \  \:\  /  /:/ /\  /  /:/\:\       \  \:\ /  /:/     |  |:|:\  ',
"  \ ' _____\__\: /  /:/ /:/ /  /:/  \:\       \  \:/__/::\   __|__|:|\:\ ',
"  \ '/__/:::::::/__/:/ /:/ /__/:/ \__\:\  ___  \__\\__\/\:\_/__/::::| \:\',
"  \ '\  \:\~~\~~\  \:\/:/ /\  \:\ /  /:/ /__/\ |  |:| \  \:\\  \:\~~\__\/',
"  \ ' \  \:\  ~~ \  \::/ /: \  \:\  /:/  \  \:\|  |:|  \__\::\  \:\      ',
"  \ '  \  \:\     \  \:\/:/  \  \:\/:/    \  \:\__|:|  /__/:/ \  \:\     ',
"  \ '   \  \:\     \  \::/    \  \::/      \__\::::/   \__\/   \  \:\    ',
"  \ '    \__\/      \__\/      \__\/           ~~~~             \__\/    ',
"  \]

call plug#end()

"---------------------
"| Lua plugin config |
"---------------------
lua <<EOF

-- LuaSnip config
require("luasnip").config.set_config({
-- Enable autotriggered snippets
enable_autosnippets = true,
-- Use Tab to trigger visual selection
store_selection_keys = "<Tab>",
update_events = 'TextChanged,TextChangedI'
})

-- Load all snippets from the nvim/LuaSnip directory at startup
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
snippet = {
    expand = function(args)
    require('luasnip').lsp_expand(args.body)
    end,
    },
    mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
    })
    })

-- lspconfig 
local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

--file explorer
require('telescope').load_extension('fzf')
require("telescope").load_extension("file_browser")
--lsp config
require('mason-config')
--bufferline
require("bufferline").setup{}
--lualine
require('lualine').setup()

EOF
