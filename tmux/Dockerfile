FROM ubuntu:17.04

RUN apt-get update

# Utils
RUN apt-get install -y \
    zip \
    unzip \
    git \
    apt-transport-https \
    ca-certificates \
    curl \
    iputils-ping \
    telnet \
    build-essential \
    vim \
    wget \
    software-properties-common

# AWS CLI
RUN apt-get install -y \
    python \
    python-setuptools \
    python-dev
RUN easy_install pip
RUN pip install --upgrade pip
RUN pip install awscli --upgrade --user
RUN cp /root/.local/bin/aws /usr/local/bin

# Docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
RUN apt-get update && apt-get install -y docker-ce

# Docker compose
RUN curl -L https://github.com/docker/compose/releases/download/1.16.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

# Composer
RUN apt-get install -y \
    php \
    php7.0-zip \
    php-curl \
    php-xml \
    php-mcrypt \
    php-mysql
RUN EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig) \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');") \
    && if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]; then >&2 echo 'ERROR: Invalid installer signature'; rm composer-setup.php; exit 1; fi \
    && php composer-setup.php --quiet \
    && RESULT=$? \
    && rm composer-setup.php \
    && exit $RESULT

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

# Enable phar support
RUN sed -i 's/;phar.readonly = On/phar.readonly = Off/g' /etc/php/7.0/cli/php.ini

# Install Neovim and Tmux
RUN apt-get -y install software-properties-common
RUN apt-get -y update
RUN apt-get -y install neovim
RUN apt-get -y install python-dev python-pip python3-dev python3-pip
RUN pip3 install --upgrade neovim

# fzf
# RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# RUN ~/.fzf/install

# RUN apt-get apt-get clean && apt-get update && apt-get install -y locales tmux
# RUN locale-gen sv_SE.UTF-8
# RUN echo export LC_CTYPE=sv_SE.UTF-8 >> /root/.bashrc
