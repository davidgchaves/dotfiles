"   Mostly from
"   https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
"   https://github.com/mislav/vimfiles/blob/master/vimrc

"   BASIC CONFIGURATION

"
" ---------- NeoBundle Scripts ---------
"

if has('vim_starting')
  " First (changes other options as a side effect)
  set nocompatible               " no compatibility with legacy vi.

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'tpope/vim-sensible'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'kovisoft/paredit'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'tpope/vim-classpath'
NeoBundle 'tpope/vim-surround'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'zenorocha/dracula-theme'

" Ruby Related
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'skalnik/vim-vroom'

" Functional (Clojure, Haskell, Scala, Elixir) Related
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'derekwyatt/vim-scala'

" JS, HTML and CSS Related
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'raichoo/purescript-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'mattn/emmet-vim'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on       " load file type plugins + indentation.

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"
" ---------- End NeoBundle Scripts ---------
"


" General
syntax on                       " enable syntax highlighting.
set showmatch                   " when a bracket is inserted, briefly jump to the matching one.

" Interface
set number                      " display line number.
set cursorline                  " highlight the screen line of the cursor.
set cmdheight=2                 " two lines for the command-line.
set showtabline=2               " always display the line w/ tab page labels.
set winwidth=79                 " 79 columns for the current window.
set scrolloff=8                 " keep at least 8 lines above and below cursor.
set wildmode=list,full          " list all matches without completing, then each full match

" Whitespace
set tabstop=4                   " four spaces for <Tab>.
set softtabstop=4               " four spaces for <Tab> while editing. 
set shiftwidth=4                " four spaces for indentation. 
set expandtab                   " use spaces, not tabs.

" Searching
set hlsearch                    " highlight matches.
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter.

" Buffers
set hidden                      " allow unsaved background buffers and remember mark/undo for them.
set switchbuf=useopen           " when switching between buffers, jump to the first open window that contains the buffer.

" Leader
let mapleader=","               " , is the <leader> key

" I don't like it when the matching parens are automatically highlighted
let loaded_matchparen = 1

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

" trying to fix horrible defaults in html indentation
" indent html, body, head and tbody tags
let g:html_indent_inctags = "html,body,head,tbody,script"


"   COLOR

set t_Co=256                    " set number of colors to 256


"   KEY MAPS

" switch to the previouly edited buffer, same as :b# command.
nnoremap <leader><leader> <c-^>

" insert a hashrocket
imap <c-l> <space>=><space>

" expand directory of current file.
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" switch to the left Split.
nnoremap <c-h> <c-w>h
" switch to the Split below.
nnoremap <c-j> <c-w>j
" switch to the Split above.
nnoremap <c-k> <c-w>k
" switch to the right Split.
nnoremap <c-l> <c-w>l

" bind K to grep word under cursor
" from https://robots.thoughtbot.com/faster-grepping-in-vim
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

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


" Promote variable to RSpec let
function! PromoteToLet()
    :normal! dd
    " :exec '?^\s*it\>'
    :normal! P
    :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
    :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>


"   AUTOCMDS

augroup vimrcEx
    " Autowrap for md files (README.md basically)
    autocmd BufRead,BufNewFile *.md setlocal textwidth=80

    " Autowrap for rdoc files (README.rdoc basically)
    autocmd BufRead,BufNewFile *.rdoc setlocal textwidth=80

    autocmd FileType text setlocal textwidth=78
    autocmd FileType ruby,eruby,haml,yaml,html,javascript,sass,cucumber,coffee,eco set ai sw=2 sts=2 et

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


"   RAINBOW_PARENTHESES.VIM CONFIG

" Parentheses colours using Solarized
let g:rbpt_colorpairs = [
  \ [ '13', '#6c71c4'],
  \ [ '5',  '#d33682'],
  \ [ '1',  '#dc322f'],
  \ [ '9',  '#cb4b16'],
  \ [ '3',  '#b58900'],
  \ [ '2',  '#859900'],
  \ [ '6',  '#2aa198'],
  \ [ '4',  '#268bd2'],
  \ ]

" Enable rainbow parentheses for parens (), brackets [] and braces {}
augroup rainbow_parentheses
  au!
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
augroup END


"   VIM-VROOM CONFIG

" Set cucumber default path (use 'bundle install --binstubs')
let g:vroom_cucumber_path="bin/cucumber"


"   VIM-JSX CONFIG

" Allow JSX in normal JS files
let g:jsx_ext_required = 0


"   THE SILVER SEARCHER (ag) CONFIG
"   from https://robots.thoughtbot.com/faster-grepping-in-vim

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


"   JUST IN CASE ...
map <left>  :echo "BURRO!"<cr>
map <right> :echo "BURRO!"<cr>
map <up>    :echo "BURRO!"<cr>
map <down>  :echo "BURRO!"<cr>

