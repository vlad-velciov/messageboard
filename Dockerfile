FROM ruby:2.7.2

ENV RACK_ENV='production'

RUN bundle config --global frozen 1

ADD . /application
WORKDIR /application

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

CMD bundle exec puma
