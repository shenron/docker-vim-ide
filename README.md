# `shenron/vim-ide:latest`

My vim configuration for JavaScript development. Dependencies availalble:
- yarn 1.60
- npm 5.6.0
- node 8.x
- screen (to run in backgroud webpack dev server or something else ...)

![vim-ide Demo](https://i.imgur.com/3y1jq8A.gif)
###### (demo: auto autocomplete, NERDTree, tagbar, Gundo and save/restore session)
 
Vim sessions can be stored if the `/home/node/.vim/sessions` is mapped to a volume.
Today only one session can be saved, because the name of the session refer to the `WORKDIR` (`/home/node/app`).
So all sessions rewrite the `app.node.home.vim` file.

 ### Run the container:
  - `docker run -ti --rm -v $(pwd):/home/node/app shenron/vim-ide`

######  If some troubles with your display try to open the `bash` and launch vim manually 
 - `docker run -ti --rm -v $(pwd):/home/node/app vim-ide /bin/bash`  
 - `vim`

### Install without Docker
If for some reasons you want to install `vim-ide` on your host (Gnu Linux / OSX), 

1. check mandatory dependencies
- python
- git
- cmake
- ctags
- editorconfig
- jsctags `(from npm install -g jsctags)`
- tstags `(from npm install -g git+https://github.com/Perlence/tstags.git)`

2. clone the project in `~/.vim/`
`git clone https://github.com/shenron/docker-vim-ide.git ~/.vim/`

3. run `cd ~/.vim/ && ./host-install`


 ### Plugins
1. pangloss/vim-javascript
2. posva/vim-vue
3. editorconfig/editorconfig-vim
4. Valloric/YouCompleteMe
5. Shougo/vimproc.vim
6. w0rp/ale
7. airblade/vim-gitgutter
8. terryma/vim-multiple-cursors
9. leafgarland/typescript-vim
10. ternjs/tern_for_vim
11. Raimondi/delimitMate
12. ctrlpvim/ctrlp.vim
13. scrooloose/nerdtree
14. majutsushi/tagbar
15. Yggdroot/indentLine
16. jacquesbh/vim-showmarks
17. sjl/gundo.vim
18. vim-airline/vim-airline
19. severin-lemaignan/vim-minimap
20. tpope/vim-fugitive


### Themes
1. NLKNguyen/papercolor-theme
2. crusoexia/vim-monokai
3. morhetz/gruvbox
4. acarapetis/vim-colors-github
5. vim-airline/vim-airline-themes

### Shortcuts
- tabs navigation
  > `nnoremap <S-Tab> :tabprevious<CR>`

  > `nnoremap <Tab> :tabnext<CR>`

- NerdTree toggle
  > `map <silent> <C-o> :NERDTreeToggle<CR>`

  > `map <silent> <C-f> :NERDTreeFind<CR>`

- Align file
  > `:nnoremap <localleader>= <Esc>gg=G<C-o>`

- outindent /indent
  > `vnoremap < <gv` 
  > `vnoremap > >gv`

- tagbar
  > `nmap <C-g> :TagbarToggle<CR>`

- Gundo toggle
  > `map <silent> <C-h> :GundoToggle<CR>`

- show buffer
  > `:nnoremap <localleader>b :ls<CR>:buffer<Space>`

- marks
  > `:nnoremap <localleader>m :<CR>:DoShowMarks<CR>`

  > `:nnoremap <localleader>m! :<CR>:NoShowMarks<CR>`

- delete marks
  > `:delm! | delm A-Z0-9`

- sessions
  > `:nnoremap <localleader>q :<CR>:execute MakeSession()<CR>`

  > `:nnoremap <localleader>o :<CR>:execute OpenSession()<CR>`
