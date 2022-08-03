# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.241.1/containers/ubuntu/.devcontainer/base.Dockerfile

# [Choice] Ubuntu version (use ubuntu-22.04 or ubuntu-18.04 on local arm64/Apple Silicon): ubuntu-22.04, ubuntu-20.04, ubuntu-18.04
ARG VARIANT="jammy"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    perl \
    make \
    # INSTALL MAKE HELPER
    poppler-utils

RUN cd /tmp && \
    wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    zcat install-tl-unx.tar.gz | tar xf - && \
    rm -rf install-tl-unx.tar.gz && \
    cd install-tl-* && \
    perl ./install-tl --no-interaction --scheme=small --no-doc-install --no-src-install

ENV MANPATH=/usr/local/texlive/2022/texmf-dist/doc/man
ENV INFOPATH=/usr/local/texlive/2022/texmf-dist/doc/info
ENV PATH="${PATH}:/usr/local/texlive/2022/bin/x86_64-linux"

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint

COPY gitver.sh /usr/local/bin/gitver
RUN chmod +x /usr/local/bin/gitver
