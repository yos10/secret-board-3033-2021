FROM --platform=linux/x86_64 node:14.15.4-slim

# Debian JP Project - ミラーサイトについて
# https://www.debian.or.jp/using/mirror.html
RUN sed -i 's/http:\/\/deb.debian.org/http:\/\/debian-mirror.sakura.ne.jp/g' /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y locales vim tmux
RUN locale-gen ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP
RUN yarn global add htpasswd@2.4.4
ENV LANG ja_JP.UTF-8
ENV TZ Asia/Tokyo
WORKDIR /app
COPY package.json .
RUN yarn install
COPY . /app
CMD ["sh", "run.sh"]
