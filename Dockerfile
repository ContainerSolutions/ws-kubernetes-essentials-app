FROM ruby:2.5.0-alpine

MAINTAINER Russell Trow <russell.trow@container-solutions.com>

# Build Application
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/
RUN bundle install
COPY . $APP_HOME

# Environmental Variables
ENV PORT 9292
ENV VERSION 1.0

# Start Server
EXPOSE 9292
CMD ["ruby", "web.rb"]