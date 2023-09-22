# Use the official Ruby image as the base image
FROM ruby:2.7

WORKDIR /app

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN apt-get install -y nodejs

RUN gem install rails

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
