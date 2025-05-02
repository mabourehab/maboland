"call plug#begin()
"Plug 'godlygeek/tabular'
"Plug 'preservim/vim-markdown'
"Plug 'dracula/vim', { 'as': 'dracula' }
"call plug#end()


"Keep 1000 items in the command history
set history=1000

"Show the cursor position
set ruler

"Show incomplete commands
set showcmd

"Show a menu for tab completion
set wildmenu

"Sets a the minimum number of lines to keep in view when a line is centered
set scrolloff=3

"Do not wrap lines in the middle of a word
set linebreak

"Add numbers to each row
set number

"Copies the ident from the current line to the next line
set autoindent
set smartindent

"Sets the tabs to be spaces, with a shift width of 2 space
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

"Sets the search to ignorecase unless the search pattern has an uppercase
set ignorecase
set smartcase

"Sets syntax highlighting and chooses colours for a dark background and sets
"the elflord colorscheme. Also settings for the search highlight colors.
set incsearch
set hlsearch
syntax enable
hi Search ctermbg=yellow ctermfg=black

"Mapping keys with the following format
"map KEY KEYSTROKES

" Map the leader key to space
let mapleader = " "

"Hotkey to change numbered rows on and off
map <C-n> :set number!<Enter>
map <leader>n :set rnu!<Enter>

"Hotkey to quickly go to start and end of line like on a bash terminal
inoremap <C-e> <End>
nnoremap <C-e> <End>
inoremap <C-a> <Home>
nnoremap <C-a> <Home>

"Hotkeys for tabs with Tab
nnoremap <Tab> >>
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

"Hotkey for quick buffer switching
map <leader>]  :bn<CR>
map <leader>[ :bp<CR>
map <leader><Tab>  :bn<CR>

"Hotkeys for deleting to end of line or beginning of line.
inoremap <C-u> <ESC>d^i
inoremap <C-k> <ESC>d$i
nnoremap <C-u> d^
nnoremap <C-k> d$

"Hotkeys for removing search highlights
nnoremap <C-h> :noh<CR>
inoremap <C-h> <C-o>:noh<CR>

"Hotkeys for clearing the screen
nnoremap <C-l> zt
inoremap <C-l> <ESC>zta

