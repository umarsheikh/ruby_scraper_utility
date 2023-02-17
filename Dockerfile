FROM ruby:3.2.1
WORKDIR .
COPY Gemfile* ./
RUN bundle install
COPY . ./
