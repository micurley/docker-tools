# syntax=docker/dockerfile:1.0.0-experimental
FROM python:3.7.4-buster
LABEL maintainer="morgan.curley@gmail.com"
LABEL version="<version>"

RUN apt update -qy \
  && apt upgrade -qy \
  && apt install -qy software-properties-common fish git gdb wget curl stow ncurses-dev silversearcher-ag nodejs npm; \
  curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb && dpkg -i ripgrep_12.1.1_amd64.deb; \
  npm install -g typescript-language-server vscode-css-languageserver-bin vscode-html-languageserver-bin bash-language-server; \
  rm -rf /var/lib/apt/lists/*;

RUN cd /tmp; \
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && \
  chmod u+x nvim.appimage && \
  ./nvim.appimage --appimage-extract && \
  mv squashfs-root / && ln -s /squashfs-root/AppRun /usr/bin/nvim && \
  ln -s /usr/bin/nvim /usr/bin/vim

# RUN pip install --upgrade pip \
#   && pip install poetry \
#   && poetry config virtualenvs.create false

WORKDIR /root

# Download public key for github.com
RUN mkdir -p -m 0700 /root/.ssh && \
  ssh-keyscan -t rsa github.com >> /root/.ssh/known_hosts && \
  chmod go-w /root && \
  chmod 700 /root/.ssh

RUN --mount=type=ssh git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all;
RUN --mount=type=ssh git clone git@github.com:micurley/dotfiles.git; \
  cd dotfiles; stow -t $HOME nvim;

WORKDIR /root/dotfiles

RUN --mount=type=ssh git submodule update --init --recursive

RUN curl -L https://get.oh-my.fish > install_omf; fish install_omf --noninteractive;
RUN fish -c "omf install bobthefish"

CMD ["fish"]
