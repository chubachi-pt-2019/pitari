FROM ruby:2.6.3-alpine
ENV APP_ROOT /usr/src/app

WORKDIR $APP_ROOT
RUN apk add --update --no-cache --virtual=build-dependencies \
      build-base \
      curl-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      mysql-dev \
      postgresql-dev \
      ruby-dev \
      sqlite-dev \
      yaml-dev \
      zlib-dev && \
    apk add --update --no-cache \
      bash \
      less \
      libxslt	\
      nodejs \
      postgresql \
      tzdata \
      yaml && \
    echo 'gem: --no-document' >> ~/.gemrc && \
    cp ~/.gemrc /etc/gemrc && \
    chmod uog+r /etc/gemrc
COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT
RUN bundle install && \
    rm -rf ~/.gem && \
    apk del build-dependencies

EXPOSE 3000
