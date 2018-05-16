FROM node:8-alpine as builder

# YouCompleteMe dependencies
RUN apk --no-cache add --virtual build-deps \
  curl \
  git \
  build-base \
  ncurses-dev \
  cmake \
  python-dev

# vim + python
RUN cd /opt/ \
  && git clone https://github.com/vim/vim.git \
  && cd ./vim/ \
  && ./configure \
    --disable-gui \
    --disable-netbeans \
    --enable-multibyte \
    --enable-pythoninterp \
    --with-features=big \
    --with-python-config-dir=/usr/lib/python2.7/config \
  && make \
  && make install

# user config (already created by parent image)
ENV UID="1000" \
  GID="1000" \
  UHOME=/home/node

# init vim folder
RUN mkdir -p $UHOME/.vim/plugged

# install manually some plugins
# Vim plugin manager
RUN curl -fLo $UHOME/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# YouCompleteMe
RUN cd $UHOME/.vim/plugged \
  && git clone --depth 1  https://github.com/Valloric/YouCompleteMe \
  && cd YouCompleteMe \
  && git submodule update --init --recursive \
  && $UHOME/.vim/plugged/YouCompleteMe/install.py --js-completer

# tern
RUN cd $UHOME/.vim/plugged \
  && git clone https://github.com/ternjs/tern_for_vim.git \
  && cd tern_for_vim \
  && npm install

# vimproc
RUN cd $UHOME/.vim/plugged \
  && git clone https://github.com/Shougo/vimproc.vim.git \
  && cd vimproc.vim \
  && make

# theme
RUN cd $UHOME/.vim/plugged \
  && git clone https://github.com/morhetz/gruvbox.git

# Cleanup
RUN apk del build-deps \
  && rm -rf \
  $UHOME/bundle/YouCompleteMe/third_party/ycmd/clang_includes \
  $UHOME/bundle/YouCompleteMe/third_party/ycmd/cpp \
  /var/cache/* \
  /var/log/* \
  /var/tmp/* \
  && mkdir /var/cache/apk

# build finale image
FROM shenron/yarn:latest

USER root

# user config (already created by parent image)
ENV UID="1000" \
  GID="1000" \
  UHOME=/home/node

# retrieve only wanted binaries
COPY --from=builder /usr/local/bin/ /usr/local/bin
COPY --from=builder /usr/local/share/vim/ /usr/local/share/vim/
COPY --from=builder $UHOME/.vim /$UHOME/.vim

RUN apk --no-cache add \
  bash \
  git \
  ctags \
  python \
  ncurses \
  editorconfig \
  screen

# install npm dependencies
# for tagbar vim plugin
RUN npm install -g \
  jsctags \
  git+https://github.com/Perlence/tstags.git

# fix home folder rights
RUN chown $UID:$GID -R $UHOME

# before the install of all other plugins, set user with good $PATH
USER node

# add global editorconfig
ADD editorconfig $UHOME/.editorconfig

# add global tern-project config
ADD tern-project $UHOME/.tern-project

# create folder for vim sessions
RUN mkdir $UHOME/.vim/sessions/

# add vim conf
ADD vimrc $UHOME/.vim
RUN ln -s $UHOME/.vim/vimrc $UHOME/.vimrc

# install all vim plugins
RUN vim +PlugInstall +qall

ENV TERM=xterm-256color

CMD ["/bin/bash", "-c", "vim"]

WORKDIR $UHOME/app
