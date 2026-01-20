# github-pages gem requires ruby < 4.0,
# hence 3.4
FROM docker.io/library/ruby:3.4-trixie

COPY Gemfile /srv/jekyll/Gemfile

WORKDIR /srv/jekyll
RUN bundle install

CMD [ "jekyll" ]
