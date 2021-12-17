FROM --platform=linux/x86_64 node:14.15.4-slim

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
