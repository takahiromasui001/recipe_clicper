# ベースイメージを指定
FROM ruby:3.1.2-alpine

# 必要なパッケージをインストール
RUN apk add --update --no-cache \
  build-base \
  mysql-dev \
  tzdata \
  bash \
  libxml2-dev \
  libxslt-dev \
  # zlib-dev \
  # libffi-dev \
  musl-dev \
  libc6-compat \
  chromium \
  nss \
  freetype \
  harfbuzz \
  ca-certificates \
  ttf-freefont \
  font-noto-cjk \
  nodejs \
  yarn \
  && rm -rf /var/cache/apk/*

# Nokogiriライブラリをインストール
RUN gem install nokogiri

# アプリケーションを配置するディレクトリを作成
RUN mkdir -p /app

# 作業ディレクトリを設定
WORKDIR /app

# ホストのGemfileとGemfile.lockをコピーして、依存関係を解決
COPY Gemfile* /app/
RUN bundle install --jobs 4 --retry 3

# アプリケーションファイルをコピー
COPY . /app/

# ポート番号を設定
EXPOSE 3000

# コンテナ起動時に実行するコマンドを指定
CMD ["rails", "server", "-b", "0.0.0.0"]