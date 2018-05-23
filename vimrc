""""""""""""""""""""""""""""""
" Base conf
""""""""""""""""""""""""""""""
scriptencoding UTF-8

" enable theme
syntax enable

" show current line
set cursorline

" show current column
set cursorcolumn

" color for the current line
hi CursorLine guibg=#4d4d4d

" encoding
set encoding=UTF-8
set fileencodings=UTF-8
set fileencoding=UTF-8

" remove beep
set vb

" remove sound if error
set errorbells
set novisualbell
set t_vb=

" display line number
set number

" backspace
set backspace=indent,eol,start

" show existing tab with 2 spaces width
set softtabstop=2
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab


""""""""""""""""""""""""""""""
" enable backup
""""""""""""""""""""""""""""""
set backup
" backup folder: ~/.vim/backup
if filewritable(expand("$HOME/.vim/backup")) == 2
  set backupdir=$HOME/.vim/backup
else
  if has("unix") || has("win32unix")
    call system("mkdir $HOME/.vim/backup -p")
    set backupdir=$HOME/.vim/backup
  endif
endif


" set history
set history=100

" enable syntax
if has("syntax")
  syntax on
endif

" listen to reload file
set autoread

" show status bar
set laststatus=2

" setup status line
" set statusline=%F%m\ %r\ Line:%l\/%L,%c\ %p%%
" set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'\ \ %{strftime('%H:%M')}
set statusline=%F%m\ %r\ Line:%l\/%L,%c\ %p%%%=\ \ %{strftime('%H:%M')}

" search case insensitive
set ignorecase
set infercase

" if end of file, don t go to begin of file
set hlsearch

" show cursor position
set ruler

" improve vim display
set ttyfast


"""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""
call plug#begin('$HOME/.vim/plugged')

" for JS
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'flowtype/vim-flow', {
      \ 'autoload': {
      \     'filetypes': 'javascript'
      \ },
      \ 'build': {
      \     'mac': 'npm install -g flow-bin',
      \     'unix': 'npm install -g flow-bin'
      \ }}

" coding style
Plug 'editorconfig/editorconfig-vim'

" autocomplete
Plug 'Valloric/YouCompleteMe'

" async tasks
Plug 'Shougo/vimproc.vim'

" show errors ale is async compare to syntastic
" Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'

" show git diff
Plug 'airblade/vim-gitgutter'

" multiple selection
Plug 'terryma/vim-multiple-cursors'

" TypeScript syntaz
Plug 'leafgarland/typescript-vim'

" rename variables
Plug 'ternjs/tern_for_vim'

" automatic closing of quotes, parenthesis, brackets
Plug 'Raimondi/delimitMate'

" search / open file
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'

" browse tags (class / var ...)
Plug 'majutsushi/tagbar'

" add symbol after x characters
Plug 'Yggdroot/indentLine'

" marks
Plug 'jacquesbh/vim-showmarks'

" graphic undo
Plug 'sjl/gundo.vim'

" nice bottom bar with info
Plug 'vim-airline/vim-airline'

" Themes
Plug 'NLKNguyen/papercolor-theme'
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'acarapetis/vim-colors-github'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"""""""""""""""""""""""""""""""
" config plugin airline
"""""""""""""""""""""""""""""""
" let g:airline_theme='simple'
let g:airline_powerline_fonts = 1


"""""""""""""""""""""""""""""""
" Gundo
"""""""""""""""""""""""""""""""
if has('python3')
  let g:gundo_prefer_python3 = 1
endif


"""""""""""""""""""""""""""""""
" config gruvbox theme
"""""""""""""""""""""""""""""""
colorscheme gruvbox
set bg=dark
" set bg=light


"""""""""""""""""""""""""""""""
" config plugin indent
"""""""""""""""""""""""""""""""
let g:indentLine_char = '|'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'


"""""""""""""""""""""""""""""""
" config editorconfig
"""""""""""""""""""""""""""""""
" let g:EditorConfig_exec_path = '/usr/bin/editorconfig'
let g:EditorConfig_core_mode = 'python_external'


"""""""""""""""""""""""""""""""
" config syntastic
"""""""""""""""""""""""""""""""
" eslint its parser and plugin dependencies must be installed locally in
" each project
" let g:syntastic_javascript_checkers=['eslint']
" let g:syntastic_javascript_eslint_generic = 1
" let g:syntastic_javascript_eslint_exec = '/bin/ls'
" let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
" let g:syntastic_javascript_eslint_args='-f compact'

" exec manualy syntastic
" let g:syntastic_mode_map = { 'mode': 'passive' }


"""""""""""""""""""""""""""""""
" ale config
"""""""""""""""""""""""""""""""
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

" enable ale for js
let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\}

" Enable completion where available.
let g:ale_completion_enabled = 1


"""""""""""""""""""""""""""""""
" config gitgutter
"""""""""""""""""""""""""""""""
let g:gitgutter_highlight_lines = 0

" reduce time from 4s to 250ms to refresh gitgutter
set updatetime=250


"""""""""""""""""""""""""""""""
" config ctrl-p plugin: ignore files/folders
"""""""""""""""""""""""""""""""
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|coverage\|dist'
let g:ctrlp_working_path_mode = 0


"""""""""""""""""""""""""""""""
" config ctags
"""""""""""""""""""""""""""""""
let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
\ }


"""""""""""""""""""""""""""""""
" Tern
"""""""""""""""""""""""""""""""
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'


""""""""""""""""""""""""""""""
" Flow
""""""""""""""""""""""""""""""
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" disable typecheking on `:w`
" by default use ale
let g:flow#enable = 0


"""""""""""""""""""""""""""""""
" shortcuts
"""""""""""""""""""""""""""""""
" tabs navigation
nnoremap <S-Tab> :tabprevious<CR>
nnoremap <Tab> :tabnext<CR>

" outindent spaces with tab
inoremap <S-Tab> <C-D>

" outindent in virtual mode
vnoremap < <gv

" indent in virtual mode
vnoremap > >gv

" alignment of file
:nnoremap <localleader>= <Esc>gg=G<C-o>



" NerdTree
map <silent> <C-o> :NERDTreeToggle<CR>
map <silent> <C-f> :NERDTreeFind<CR>

" tagbar
nmap <C-g> :TagbarToggle<CR>

" Gundo
map <silent> <C-h> :GundoToggle<CR>

" show buffer
:nnoremap <localleader>b :ls<CR>:buffer<Space>

" marks
:nnoremap <localleader>m :<CR>:DoShowMarks<CR>
:nnoremap <localleader>m! :<CR>:NoShowMarks<CR>

" delete marks
:delm! | delm A-Z0-9

"""""""""""""""""""""""""""""""
" sessions
"""""""""""""""""""""""""""""""
function! MakeSession()
  exe "NERDTreeClose"
  let b:sessiondir = '$HOME/.vim/sessions'
  let b:filename = split(getcwd(), '/')
  let b:filename = b:filename[-1] . '-' . b:filename[-2] . '-' .b:filename[-3]
  let b:filename = b:sessiondir . '/' . b:filename . '.vim'
  exe "mksession! " . b:filename
  exe ":wqa"
endfunction

function! OpenSession()
  let b:sessiondir = '$HOME/.vim/sessions'
  let b:filename = split(getcwd(), '/')
  let b:filename = b:filename[-1] . '-' . b:filename[-2] . '-' .b:filename[-3]
  let b:filename = b:sessiondir . '/' . b:filename . '.vim'
  exe "source " . b:filename
  exe "NERDTreeFind"
endfunction

function! ListSessions()
  exe "!ls -1 $HOME/.vim/sessions/ "
endfunction

:nnoremap <localleader>q :<CR>:execute MakeSession()<CR>
:nnoremap <localleader>o :<CR>:execute OpenSession()<CR>
