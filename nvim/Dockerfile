# docker run -it --rm \
# -v /var/run/docker.sock:/var/run/docker.sock \
# -v $HOME:$HOME \
# -v $PWD:$PWD \
# -w $PWD \
# bernljung/nvim nvim "${args[@]}"
#
FROM ubuntu:17.04

RUN apt-get update

ENV TERM xterm256-color
# Install Neovim
RUN apt-get update
RUN apt-get -y install \
    git \
    curl \
    neovim \
    python3-dev \
    python3-pip
RUN pip3 install --upgrade neovim


CMD [ "nvim" ]

# fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
RUN ~/.fzf/install --no-key-bindings --no-completion --no-update-rc
