FROM ruby:2.2-alpine

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apk add --update --no-cache nodejs build-base libxml2-dev libxslt-dev
RUN apk add --update --no-cache postgresql-client postgresql-dev ruby-json libcurl tzdata

RUN mkdir /app
WORKDIR /app

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN gem update --system && gem update bundler && bundle install

COPY . .

RUN chmod +x start.sh
EXPOSE 3000
CMD ./start.sh
