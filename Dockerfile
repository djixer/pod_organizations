FROM ruby:3.0.3
RUN apt-get update -qq && apt-get install -y nodejs locales
RUN echo "ru_RU.UTF-8 UTF-8" > /etc/locale.gen && \
  locale-gen ru_RU.UTF-8 && \
  /usr/sbin/update-locale LANG=ru_RU.UTF-8
ENV LC_ALL ru_RU.UTF-8
ENV APP_PATH=/usr/src
WORKDIR $APP_PATH
COPY Gemfile* $APP_PATH/
RUN bundle install
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]