set nocompatible
filetype plugin indent off     " required!
set rtp+=~/.vim/bundle/vundle/
set noshellslash

call vundle#rc()
" let Vundle manage Vundle
Bundle "gmarik/vundle"

" Bundle "browser.vim"
" Bundle "holgado/minibufexpl.vim"
" Bundle "reinh/vim-makegreen"
" Bundle "sontek/minibufexpl.vim"
" Bundle "synmark.vim"
"Bundle "mileszs/ack.vim"
"Bundle "taglist"
Bundle "vim-scripts/ctrlp.vim"
"Bundle "wincent/Command-T"
"Bundle "tomtom/tcomment_vim"
Bundle "FuzzyFinder"
Bundle "L9"
Bundle "Lokaltog/vim-easymotion"
Bundle "Raimondi/delimitMate"
Bundle "alfredodeza/pytest.vim"
Bundle "ervandew/supertab"
Bundle "fs111/pydoc.vim"
Bundle "https://github.com/altercation/vim-colors-solarized.git"
Bundle "michaeljsmith/vim-indent-object"
Bundle "mitechie/pyflakes-pathogen"
" Bundle "msanders/snipmate.vim"
Bundle "scrooloose/nerdtree"
Bundle "silentfrog/Parameter-Text-Objects"
Bundle "sjl/gundo.vim"
Bundle "sontek/rope-vim"
Bundle "tlib"
Bundle "tpope/vim-abolish"
Bundle "tpope/vim-commentary"
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-git"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-surround"
Bundle "tselectbuffer"
Bundle "vim-scripts/grep.vim"
Bundle "vim-scripts/pep8"
" ...

filetype plugin indent on     " required!
"BundleInstall
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Don't redraw while executing macros (good performance config)
set lazyredraw
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

let g:no_parameter_object_maps = 0

function! MoveLeft(num)
    if a:num>0
        let l:old_wchichwrap = &whichwrap
        set whichwrap+=<,>,h,l,[,]
        exe 'normal ' . a:num . 'h'
        let &whichwrap=l:old_wchichwrap
    endif
endfunction

function! MoveRight(num)
    if a:num>0
        let l:old_wchichwrap = &whichwrap
        set whichwrap+=<,>,h,l,[,]
        exe 'normal ' . a:num . 'l'
        let &whichwrap=l:old_wchichwrap
    endif
endfunction

function! ClearReg()
    let @x=''
    let @y=''
endfunction

nmap <leader>s <ESC>:call ClearReg()<CR>"xdia<ESC>:let b:pos_save = getpos('.')<CR>:call MoveRight(1)<CR>"ydia"xP:call setpos('.', b:pos_save)<CR>"yP`,p[
nmap <leader>t <leader>s<leader>.
nmap <leader>S <leader>'<leader>s<leader>.
nmap <leader>T <leader>'<leader>s

au QuickFixCmdPost * cw

if &term == "screen"
    " set t_ku=k
    " set t_kd=j
    " set t_kr=h
    " set t_kl=l
    inoremap ^[OA=k
    inoremap ^[OB=j
    inoremap ^[OD=h
    inoremap ^[OC=l
endif

set completeopt=menuone,longest,preview
set complete=.,w,b,u,t

let g:SuperTabDefaultCompletionType = "context"

let mapleader = ","
let g:mapleader = ","

set expandtab
set textwidth=0
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
nnoremap <silent> <F4> :Bgrep<CR><CR>

set statusline=%<%f\ %h%w%m%r%y%=L:%l/%L\ (%p%%)\ C:%c%V\ B:%o\ F:%{foldlevel('.')}

filetype on
syntax enable
au BufWritePre * call StripTrailingWhitespace()

set background=light
colorscheme solarized
let g:solarized_contrast="high"    "default value is normal
let g:solarized_hitrail=1

set hidden
if has("gui_running")
    set guifont=Inconsolata\ 15
    set guifont=Consolas:h14
    set guifont=Anonymous\ Pro:h15
    set guifont=Anonymous\ Pro\ 15
endif

set foldmethod=indent
set foldlevel=100

let g:pep8_map='<leader>8'
" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Unfuck my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>
" Use sane regexes.
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

if has("gui_running")
    highlight SpellBad term=underline gui=undercurl guisp=Orange
endif

"map <silent><C-Left> <C-T>
"map <silent><C-Right> <C-]>
inoremap <Nul> <C-x><C-o>

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
            \| exe "normal! g'\"" | endif
set clipboard=unnamed,autoselect,exclude:cons
"allow backspacing over everything in insert mode
set backspace=indent,eol,start

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom
set laststatus=2

"display tabs and trailing spaces
set list
set listchars=tab:?·,nbsp:·
"set listchars=tab:?·,trail:·,nbsp:·

set hlsearch    "hilight searches by default
set incsearch

set nowrap        "dont wrap words
set linebreak   "wrap lines at convenient points

map <F7> <C-R>*
let g:pydiction_location = 'C:\\Users\\Sasha\\.vim\\bundle\\Pydiction\\complete-dict'

" Remove trailing whitespace from code files on save
function! StripTrailingWhitespace()
    " store current cursor location
    silent exe "normal ma<CR>"
    " store the current search value
    let saved_search = @/
    " delete the whitespace (e means don't warn if pattern not found)
    %s/\s\+$//e
    " restore old cursor location
    silent exe "normal `a<CR>"
    " restore the search value
    let @/ = saved_search
endfunction


function! HighlightTooLongLines()
    highlight def link RightMargin Error
    "if &textwidth != 0
    exec 'match RightMargin /\%<' . (82) . 'v.\%>' . (81) . 'v/'
    "endif
endfunction

augroup filetypedetect
    au WinEnter,BufNewFile,BufRead * call HighlightTooLongLines()
    "set colorcolumn=+1,+2,+3,+4,+5,+6,+7,+8,+9,+10
augroup END

set pastetoggle=<F10>
set numberwidth=1

set ruler
set wildmenu
set wildmode=list:longest
set wildignore+=*.o,*.obj,.git,blaze-*
set smartcase
set ignorecase
set title
set scrolloff=3
set history=1000
map <F1> <ESC>
imap <F1> <ESC>
set noswapfile
set updatecount=0

noremap <silent> <ESC><ESC> <ESC>:nohl<CR>:let g:pyflakes_use_quickfix = 1<CR>:cclose<CR>

let g:use_relative_numbers=1
" Toggle line numbers
function! NumberToggle()
    if (g:use_relative_numbers == 1)
        set relativenumber!
    else
        set number!
    endif
endfunc

function! RelNumberToggle()
    if (g:use_relative_numbers == 1)
        let g:use_relative_numbers=0
    else
        let g:use_relative_numbers=1
    endif
    call NumberToggle()
endfunc

nnoremap <leader>l :call NumberToggle()<cr>
nnoremap <leader>; :call RelNumberToggle()<cr>

":au FocusLost * :let g:use_relative_numbers=0
":au FocusGained * :let g:use_relative_numbers=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep //**/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

autocmd InsertEnter * setlocal nocursorline
autocmd InsertLeave * setlocal cursorline
"hi CursorLine cterm=NONE ctermbg=darkgray
let g:solarized_visibility = "normal"
set cursorline

" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk
noremap gj j
noremap gk k

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! Run(args)

    let g:tmp_out = tempname()
    command! Run :call Run(<q-args>)
    execute "!" . a:args . ' >' . g:tmp_out . ' 2>&1'
    copen
    execute 'cgetfile ' . g:tmp_out
endfunction

:command! Q :call CleanClose(0)

map fc <ESC>:call CleanClose(1) <cr>
map fq <ESC>:call CleanClose(0) <cr>

function! CleanClose(tosave)
    if (a:tosave == 1)
        w!
    endif
    let todelbufNr = bufnr("%")
    let newbufNr = bufnr("#")
    if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
        exe "b".newbufNr
    else
        bnext
    endif

    if (bufnr("%") == todelbufNr)
        new
    endif
    exe "bd".todelbufNr
endfunction

" If I forgot to sudo vim a file, do that with :w!!
cmap w!! %!sudo tee > /dev/null %

inoremap <F2> <ESC>u@.
inoremap <silent> <F3> <ESC>:TSelectBuffer<cr>
nmap <silent> <F3> <ESC>:TSelectBuffer<cr>
func! DiffSetup()
    set nofoldenable foldcolumn=0 number
    wincmd b
    set nofoldenable foldcolumn=0 number
    let &columns = &columns * 2
    wincmd =
    winpos 0 0
endfun

if &diff
    autocmd VimEnter * call DiffSetup()
endif

set nojoinspaces
set cb="exclude:.*"
set magic "change the way backslashes are used in search patterns
set viminfo='50,\"200   " read/write a .viminfo file, remember filemarks for 50
" files and store 200 lines of registers

cmap <F5> <C-R>=expand('<cword>')<CR>

map cn <esc>:cn<cr>
map cp <esc>:cp<cr>

" To indent the whole file without having the cursor move to the beginning or
" the end I have the following
fun! BenIndent()
    let oldLine=line('.')
    normal(gg=G)
    exe ':' . oldLine
endfun
map --- :call BenIndent()<CR>

let g:pyflakes_use_quickfix = 0
