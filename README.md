# `shenron/vim-ide:latest`

My vim configuration for JavaScript development. Dependencies availalble:
- yarn 1.60
- npm 5.6.0
- node 8.x
 
Vim sessions can be stored if the `/home/node/.vim/sessions` is mapped to a volume
(today only one session is saved, because the name of the session is link to the `WORKDIR` `/home/node/app`)

 ### Run the container:
  - `docker run -ti --rm -v $(pwd):/home/node/app shenron/vim-ide`

### Install without Docker
If for some reasons you want to install `vim-ide` on your host (Gnu Linux / OSX), check mandatory 
dependencies and run `host-install`
- python
- git
- cmake
- ctags
- editorconfig
- jsctags (from npm install -g jsctags)
- tstags (from npm install -g git+https://github.com/Perlence/tstags.git)


######  If some troubles with your display try to open the `bash` and launch vim manually 
 - `docker run -ti --rm -v $(pwd):/home/node/app vim-ide /bin/bash`  
 - `vim`

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

### Themes
19. NLKNguyen/papercolor-theme
20. crusoexia/vim-monokai
21. morhetz/gruvbox
22. acarapetis/vim-colors-github
23. vim-airline/vim-airline-themes

### Shortcuts
- tabs navigation
  > nnoremap <C-Left> :tabprevious<CR>
  > nnoremap <C-Right> :tabnext<CR>

- NerdTree toggle
  > map <silent> <C-o> :NERDTreeToggle<CR>
map <silent> <C-f> :NERDTreeFind<CR>

- tagbar
  > nmap <C-g> :TagbarToggle<CR>

- Gundo toggle
  > map <silent> <C-h> :GundoToggle<CR>

- show buffer
  > :nnoremap ,b :ls<CR>:buffer<Space>

- marks
  > :nnoremap ,m :<CR>:DoShowMarks<CR>
  > :nnoremap ,m! :<CR>:NoShowMarks<CR>

- delete marks
  > :delm! | delm A-Z0-9

- sessions
  > :nnoremap ,q :<CR>:execute MakeSession()<CR>
  > :nnoremap ,o :<CR>:execute OpenSession()<CR>
