" Install plugins via the command vim +PlugInstall +qa
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure to use single quotes for plugins

" install colorschemes; fetches https://github.com/chriskempson/base16-vim
Plug 'chriskempson/base16-vim'

" install vim-vinegar (improves netrw)
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'

Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

Plug 'tpope/vim-surround'
Plug 'AndrewRadev/dsf.vim'  " vim-surround is great for craeting surrounding functions, but I didn't see how to delete them

call plug#end()

" set leader
let mapleader = "\<Space>"

" Use jk/kj for escape to normal
inoremap jk <esc>
inoremap kj <esc>

" Basic Behavior
set number                         " line numbersi
set relativenumber
set ruler                          " show line and column number of the cursor on right side of statusline
set showmatch                      " highlight matching parenthesis / brackets [{()}]
set visualbell                     " blink cursor on error, instead of beeping

" Split Pane Behavior
set splitright                     " open vertically split panes to the right
set splitbelow                     " open horizonatlly split panes below
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" netrw file explorer config
let g:netrw_liststyle = 3		   " tree listing format in netrw file explorer

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu
" Use filetype-based syntax highlighting, ftplugins, and indentation
syntax enable
filetype plugin indent on
" Tab Settings
set tabstop=4                      " width that a tab character displays as
set expandtab                      " convert <TAB> key-presses to spaces
set shiftwidth=4                   " number of spaces to use for each step of (auto) indent
set softtabstop=4                  " backspace after pressing <TAB> will remove up to this many spaces
set autoindent                     " copy indent from current line when starting a new line
set listchars=eol:&,tab:>-         " show <TAB> characters and EOL
" Search Settings
set incsearch                      " search as characters are entered
set hlsearch                       " highlight matches
set ignorecase                     " case insensitive search
" put colorscheme files in ~/.vim/colors/
set background=dark
" backspace wonkeyness on my mac
set backspace=indent,eol,start
" colorscheme base16-tomorrow-night "base16-default-dark molokai, murphy, slate, badwolf, solarized
map <F4> :colorscheme torte<CR>
map <F5> :colorscheme base16-default-dark<CR>

" get same colorscheme as terminal via .vimrc_background
set t_Co=256
let base16colorspace=256
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
else
  colorscheme base16-tomorrow-night 
endif

" save text folding
augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

" use filetype-based syntax highlighting, ftplugins, and indentation
syntax enable
filetype plugin indent on

"nmap <S-F> :set syntax=fortran<CR>:let b:fortran_fixed_source=!b:fortran_fixed_source<CR>:set syntax=text<CR>:set syntax=fortran<CR>
set viminfo='20,\"90,h,%

" handle 08 and 09 as numbers when CTRL-A and CTRL-X
set nrformats-=octal

" vim-tmux-runner config
nnoremap <leader>sl :VtrSendLinesToRunner<cr>
vnoremap <leader>sl :VtrSendLinesToRunner<cr>
nnoremap <leader>or :VtrOpenRunner<cr>
nnoremap <leader>kr :VtrKillRunner<cr>

" vim-tmux-runner config for python
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 1
let g:VtrAppendNewline = 1

" python file settings
autocmd FileType python
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
	\ set encoding=utf-8
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"" javascript html and css spacing
"au BufNewFile,BufRead *.js, *.html, *.css
"    \ set tabstop=2
"    \ set softtabstop=2
"    \ set shiftwidth=2
"" fortran/mos2k spacing
"au BufNewFile,BufRead *.f
"    \ set tabstop=3
"    \ set softtabstop=3
"    \ set shiftwidth=3
