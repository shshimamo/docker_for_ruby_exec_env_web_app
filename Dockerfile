FROM ruby:2.6.1-stretch

# /appではなく/var/wwwや/usr/src/appにアプリケーションのファイルを配置することもある
WORKDIR /app

# Bundlerでgemをインストールする
COPY Gemfile Gemfile.lock ./
RUN bundle install

# エントリーポイントを設定する
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

# アプリケーションのファイルコピーする
COPY . ./

# サーバーを実行するたえｍのコマンドとポートを設定する
CMD ["ruby", "app.rb", "-o", "0.0.0.0"]
EXPOSE 4567
