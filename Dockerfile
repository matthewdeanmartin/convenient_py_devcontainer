FROM mcr.microsoft.com/devcontainers/python:0-3.11
LABEL	version="3.11.0"
LABEL	name="conventient_py_devcontainer"
LABEL	maintainer="matthewdeanmartin@gmail.com"
COPY *.sh .
# Podman doesn't support this and will complain
# but without it, docker build keeps trying to us sh
SHELL ["/bin/bash", "-c"]
ENV	PATH	"/root/.local/bin:${PATH}"
ENV PIP_PREFER_BINARY=1

RUN	chmod +x *.sh && ./install_001_debian.sh \
&& ./install_002_fish.sh \
&& ./install_003_pipx.sh

# Microsoft base does not install this by default!
RUN ./install_004_node.sh

# go because so many tools
ENV GO_VERSION 1.19.5
RUN ./install_005_go.sh
ENV PATH /go/bin:/usr/local/go/bin:$PATH
ENV GOPATH /go

RUN ./install_006_github.sh

# rust really wants a per-user installation.
USER vscode
RUN ./install_007_rust.sh

SHELL ["/bin/bash",	"-o",	"pipefail",	"-c"]
CMD	["python3"]
