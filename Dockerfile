FROM ruby:2.6.3
ENV LANG C.UTF-8
WORKDIR /tmp
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs && \
    rm -rf /var/lib/apt/lists/* && \
    gem install bundler

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

RUN mkdir -p /usr/src/app 
WORKDIR /usr/src/app

EXPOSE 3000
