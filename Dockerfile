FROM ruby:2.6.6
RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn
RUN gem install bundler --version "2.1.4" --no-document --quiet
RUN mkdir /web
WORKDIR /web
COPY . .
RUN yarn install
RUN bundle install
CMD [ "chmod a+rw /tmp/puma.sock"]
CMD [ "bundle", "exec", "puma", "-C", "config/puma.rb" ]
