FROM ubuntu:20.04
RUN apt-get update && \
  apt-get install -y\
  git \
  curl \
  autoconf \
  bison \
  build-essential \
  libssl-dev \
  libyaml-dev \
  libreadline6-dev \
  zlib1g-dev \
  libncurses5-dev \
  libffi-dev \
  libgdbm6 \
  libgdbm-dev \
  libdb-dev
RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc && \
  echo 'eval "$(rbenv init -)"' >> ~/.zshrc \
  source ~/.zshrc
RUN rbenv install 2.7.2 && rbenv global 2.7.2