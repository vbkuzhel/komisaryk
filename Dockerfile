FROM ruby:2.2.2

RUN apt-get update -qq && apt-get install -y build-essential nodejs mysql-client vim default-jre

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for capybara-webkit
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

ENV APP_HOME=/backend
RUN mkdir /$APP_HOME
WORKDIR /$APP_HOME

COPY ./ /$APP_HOME

RUN bundle install

COPY config/database.yml.example /$APP_HOME/config/database.yml

#RUN ln -sf config/database.yml.example /$APP_HOME/config/database.yml

RUN ls -la config