"""" BASIC CONFIGURATION """

" First (changes other options as a side effect)
set nocompatible                " no compatibility with legacy vi.

" General
syntax on                       " enable syntax highlighting.
set showcmd		                " display incomplete commands.
filetype plugin indent on       " load file type plugins + indentation.
set backspace=indent,eol,start  " backspace through everything in Insert Mode.
set showmatch                   " when a bracket is inserted,
                                " briefly jump to the matching one.

" Interface
set number                      " display line number.
set ruler                       " show line/column if the cursor position.
set laststatus=2                " always show status line.
set cursorline                  " highlight the screen line of the cursor.
set cmdheight=2                 " two lines for the command-line.
set showtabline=2               " always display the line w/ tab page labels.
set winwidth=79                 " 79 columns for the current window.
set scrolloff=3                 " keep at least 3 lines above and below cursor.
set wildmenu                    " matches for completion are shown above the
                                " command line with the 1st match highlighted.

" Whitespace
set tabstop=4                   " four spaces for <Tab>.
set softtabstop=4               " four spaces for <Tab> while editing. 
set shiftwidth=4                " four spaces for indentation. 
set expandtab                   " use spaces, not tabs.
set autoindent                  " copy indent from current line when starting
                                " new line.

" Searching
set hlsearch                    " highlight matches.
set incsearch                   " perform search as you type.
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one Capital.

" Buffers
set hidden                      " allow unsaved background buffers and
                                " remember mark/undo for them.
set switchbuf=useopen           " when switching between buffers, jump to the
                                " first open window that contains the buffer.

""" FIXES """ 

" when going 'terminal > vim > terminal' don't clear terminal screen,
" check http://www.shallowsky.com/linux/noaltscreen.html for info.
set t_ti= t_te=
