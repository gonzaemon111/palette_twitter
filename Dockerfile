FROM ruby:2.6.4

ARG USER="palette_twitter"
ARG UID="3000"
ARG GROUP="palette_twitter"
ARG GID="3000"
ARG WORKSPACE=/home/palette_twitter

ENV LANG C.UTF-8
    
RUN apt-get update && apt-get install -y vim less

RUN apt-get install -y build-essential libpq-dev default-mysql-client nodejs && \
    gem install bundler

RUN mkdir -p $WORKSPACE
WORKDIR $WORKSPACE
COPY / ./
RUN bundle install -j4


RUN groupadd -r --gid $GID $GROUP && \
    useradd -r --uid $UID --gid $GID $USER && \
    chown -R $USER:$GROUP $WORKSPACE

USER $USER
EXPOSE  3000