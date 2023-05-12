FROM node:18

RUN apt update \
	&& apt install -y netcat-openbsd

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y

RUN $HOME/.cargo/bin/cargo install --features=ssl websocat

RUN npm install -g @automattic/vip

RUN npm install -g @automattic/vip-go-internal-cli
 
RUN vipgo config set PROXY=socks://192.168.65.2:8080
