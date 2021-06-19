# vipgo-cli-docker
A Docker wrapper for VIP Go internal CLI

## Installation and usage
1. Copy Dockerfile from this repository to your computer.
2. Run `docker build . --tag vipgo-cli` to build the image.
3. Run `docker run -it -v ~/.ssh/id_rsa:/root/.ssh/id_rsa:ro -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub:ro vipgo-cli bash` 
to start container and immediately enter the shell with access to VIP Go CLI (`vipgo`). You may add the `--rm` flag to force 
the container to be automatically deleted on exit.
