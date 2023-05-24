FROM node:18

RUN apt update \
	&& apt install -y netcat-openbsd

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y

RUN $HOME/.cargo/bin/cargo install --features=ssl websocat

RUN npm install -g @automattic/vip

RUN npm install -g @automattic/vip-go-internal-cli

RUN apt install -y host

RUN ip_address=$(host host.docker.internal | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+') \
    && vipgo config set PROXY=socks://$ip_address:8080


