FROM ruby:2.7.0

#install  system dependencies
RUN apt-get update && apt-get install -y \
  postgresql-client \
  libxml2-dev \
  libxslt-dev \
  libc-dev \
  libpq-dev \
  imagemagick \
  tzdata \
  nodejs \
  yarn \
  qt5-default \
  libqt5webkit5-dev \
  redis-server \
  git \
  &&  apt-get -q clean \
  && rm -rf /var/lib/apt/lists

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn --force
RUN gem install bundler:2.1.4 --no-document
RUN bundle config set force_ruby_platform true

WORKDIR /app
COPY Gemfile* ./
RUN bundle install
COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

  