FROM ruby:3.2-bookworm

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    imagemagick \
    libyaml-dev \
    nodejs \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /site

COPY Gemfile ./
RUN bundle install

EXPOSE 4000 35729

CMD ["sh", "-lc", "bundle install && bundle exec jekyll serve --host 0.0.0.0 --port 4000 --livereload --force_polling"]
