" Set the leader key to space
let mapleader = " "

" Enable syntax highlighting
syntax on

" Set color scheme
set background=dark
colorscheme desert

" Custom color modifications
highlight Normal ctermfg=14 ctermbg=0 guifg=#00FFFF guibg=#000000
highlight Comment ctermfg=10 guifg=#00FF00
highlight Constant ctermfg=13 guifg=#FF00FF
highlight Identifier ctermfg=11 guifg=#FFFF00
highlight Statement ctermfg=202 guifg=#FF5F00
highlight PreProc ctermfg=205 guifg=#FF5FAF
highlight Type ctermfg=49 guifg=#00FFAF
highlight Special ctermfg=199 guifg=#FF00AF

" General settings
set number          " Show line numbers
set ruler           " Show cursor position
set cursorline      " Highlight current line
set showmatch       " Highlight matching brackets
set incsearch       " Incremental search
set hlsearch        " Highlight search results
set ignorecase      " Case-insensitive search
set smartcase       " Case-sensitive if uppercase present
set expandtab       " Use spaces instead of tabs
set shiftwidth=4    " Set indentation to 4 spaces
set tabstop=4       " Set tab width to 4 spaces
set softtabstop=4   " Set soft tabstop to 4 spaces
set autoindent      " Enable auto-indentation
set smartindent     " Enable smart indentation
set wrap            " Enable line wrapping
set linebreak       " Wrap lines at convenient points
set laststatus=2    " Always show status line
set wildmenu        " Enhanced command-line completion
set showcmd         " Show partial commands in the last line of the screen
set history=1000    " Increase command history

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Set a colorful status line
set statusline=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\ %n\           " buffer number
set statusline+=%#Visual#       " colour
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     " colour
set statusline+=%R                        " readonly flag
set statusline+=%M                        " modified [+] flag
set statusline+=%#Cursor#               " colour
set statusline+=%#CursorLine#     " colour
set statusline+=\ %t\                   " short file name
set statusline+=%=                          " right align
set statusline+=%#CursorLine#   " colour
set statusline+=\ %Y\                   " file type
set statusline+=%#CursorIM#     " colour
set statusline+=\ %3l:%-2c\         " line + column
set statusline+=%#Cursor#       " colour
set statusline+=\ %3p%%\                " percentage

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable file type detection
filetype plugin indent on

" Auto-reload files when changed outside of Vim
set autoread
au CursorHold * checktime

" Show invisible characters
set list
set listchars=space:·,tab:»·,eol:¬,trail:•,extends:❯,precedes:❮
