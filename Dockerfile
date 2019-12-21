FROM ruby:2.6.1-stretch

# /appではなく/var/wwwや/usr/src/appにアプリケーションのファイルを配置することもある
WORKDIR /app

# Bundlerでgemをインストールする
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
