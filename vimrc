"   Mostly from
"   https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
"   https://github.com/mislav/vimfiles/blob/master/vimrc

"   BASIC CONFIGURATION

" First (changes other options as a side effect)
set nocompatible                " no compatibility with legacy vi.
call pathogen#infect()          " pathogen config

" General
syntax on                       " enable syntax highlighting.
set showcmd		                " display incomplete commands.
filetype plugin indent on       " load file type plugins + indentation.
set backspace=indent,eol,start  " backspace through everything in Insert Mode.
set showmatch                   " when a bracket is inserted, briefly jump to the matching one.

" Interface
set number                      " display line number.
set ruler                       " show line/column if the cursor position.
set laststatus=2                " always show status line.
set cursorline                  " highlight the screen line of the cursor.
set cmdheight=2                 " two lines for the command-line.
set showtabline=2               " always display the line w/ tab page labels.
set winwidth=79                 " 79 columns for the current window.
set scrolloff=3                 " keep at least 3 lines above and below cursor.
set wildmenu                    " matches for completion are shown above the command line with the 1st match highlighted.

" Whitespace
set tabstop=4                   " four spaces for <Tab>.
set softtabstop=4               " four spaces for <Tab> while editing. 
set shiftwidth=4                " four spaces for indentation. 
set expandtab                   " use spaces, not tabs.
set autoindent                  " copy indent from current line when starting new line.

" Searching
set hlsearch                    " highlight matches.
set incsearch                   " perform search as you type.
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter.

" Buffers
set hidden                      " allow unsaved background buffers and remember mark/undo for them.
set switchbuf=useopen           " when switching between buffers, jump to the first open window that contains the buffer.

" Leader
let mapleader=","               " , is the <leader> key


"   FIXES

" when going 'terminal > vim > terminal' don't clear terminal screen,
" check http://www.shallowsky.com/linux/noaltscreen.html for info.
set t_ti= t_te=

" necessary to avoid strange behaviour using zsh, check
" http://gabebw.wordpress.com/2010/08/02/rails-vim-rvm-and-a-curious-infuriating-bug/
" and https://rvm.io//integration/vim/
set shell=bash

" no more SHIFT + o delay please, check
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
" http://ksjoberg.com/vim-esckeys.html
set noesckeys


"   COLOR

set t_Co=256                    " set number of colors to 256
set background=light            " you can switch between 'light' and 'dark
colorscheme solarized


"   KEY MAPS

nnoremap <leader><leader> <c-^> " switch to the previouly edited buffer, same as :b# command.
imap <c-l> <space>=><space>     " insert a hashrocket

" expand directory of current file.
cnoremap %% <C-R>=expand('%:h').'/'<cr>

nnoremap <c-h> <c-w>h           " switch to the left Split.
nnoremap <c-j> <c-w>j           " switch to the Split below.
nnoremap <c-k> <c-w>k           " switch to the Split above.
nnoremap <c-l> <c-w>l           " switch to the right Split.

" Clear the search buffer when hitting RETURN
function! MapCR()
    nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

" Multipurpose TAB key
" If we're at the beginning of a line THEN Indent ELSE Do-Completion
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>


" Rename Current File
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>


"   AUTOCMDS

augroup vimrcEx
    autocmd FileType text setlocal textwidth=78
    autocmd FileType ruby,eruby,haml,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et

    " Remember last location in file except for commit messages, check :help last-position-jump
    autocmd BufReadPost *
        \   if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$") |
        \       exe "normal g`\"" |
        \   endif

    " RETURN key mapping ON/OFF when in command line window.
    autocmd! CmdwinEnter * :unmap <cr>
    autocmd! CmdwinLeave * :call MapCR()
augroup END


"   RAILS SPECIFIC MAPPINGS
map <leader>gr :topleft :split config/routes.rb<cr> " go to (r)outes.
map <leader>gg :topleft 100 :split Gemfile<cr>      " go to (g)emfile.

" Note to self: for ShowRoutes() to work you need the 'set shell=bash' line.
function! ShowRoutes()
    " Requires 'scratch' plugin
    :topleft 100 :split __Routes__
    " Make sure Vim doesn't write __Routes__ as a file
    :set buftype=nofile
    " Delete everything
    :normal 1GdG
    " Put routes output in buffer
    :0r! rake -s routes
    " Size window to number of lines (1 plus rake output length)
    :exec ":normal " . line("$") . "_ "
    " Move cursor to bottom
    :normal 1GG
    " Delete empty trailing line
    :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>


"   JUST IN CASE ...
map <left>  :echo "BURRO!"<cr>
map <right> :echo "BURRO!"<cr>
map <up>    :echo "BURRO!"<cr>
map <down>  :echo "BURRO!"<cr>
