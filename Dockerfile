FROM ubuntu:24.04

RUN apt update && apt upgrade -y && \
        apt install -y curl git gcc make

## install dotfiles
RUN git clone https://github.com/LeafChage/dotfiles.git /dotfiles
WORKDIR /dotfiles

RUN make all

## setting nvim
RUN mkdir /.config
ENV XDG_CONFIG_HOME=/.config
RUN ln -s /dotfiles/vim/nvim/nvim /.config/

RUN echo DOTFILE_EMOJI=1 >> ~/.bashrc && \
   echo DOTFILE_LOCAL=0 >> ~/.bashrc && \
   echo DOTFILE_MEMO=0 >> ~/.bashrc && \
   echo export PATH=\$PATH:/opt/nvim-linux64/bin:/opt/peco_linux_amd64:/opt/fzf/bin >> ~/.bashrc && \
   echo source /dotfiles/bash/.bashrc >> ~/.bashrc

