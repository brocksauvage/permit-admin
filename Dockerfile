FROM ruby:2.6.3

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apt-transport-https && \
    echo 'deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main' >> \
    /etc/apt/sources.list.d/pgdg.list && \
    wget -q -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update && apt-get install -y \
    postgresql-client-12

WORKDIR /root/app
COPY Gemfile* ./
RUN bundle install
