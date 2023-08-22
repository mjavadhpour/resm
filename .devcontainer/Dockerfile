# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.241.1/containers/ubuntu/.devcontainer/base.Dockerfile

# [Choice] Ubuntu version (use ubuntu-22.04 or ubuntu-18.04 on local arm64/Apple Silicon): ubuntu-22.04, ubuntu-20.04, ubuntu-18.04
ARG VARIANT="jammy"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    perl \
    make \
    # INSTALL MAKE HELPER
    poppler-utils

RUN cd /tmp && \
    wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    zcat < install-tl-unx.tar.gz | tar xf - && \
    cd install-tl-* && \
    perl ./install-tl --no-interaction --scheme=small --no-doc-install --no-src-install

RUN RUN set -eux; \
        export YEAR="$(date '+%Y')"; \
        export ARCH="$(arch)"; \
        { \
            echo "export MANPATH=/usr/local/texlive/$YEAR/texmf-dist/doc/man"; \
            echo "export INFOPATH=/usr/local/texlive/$YEAR/texmf-dist/doc/info"; \
            echo "export PATH=\"$PATH:/usr/local/texlive/$YEAR/bin/$ARCH-linux\""; \
        } | tee /etc/profile.d/00-restore-env.sh;

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint

COPY gitver.sh /usr/local/bin/gitver
RUN chmod +x /usr/local/bin/gitver

COPY diffurl.sh /usr/local/bin/diffurl
RUN chmod +x /usr/local/bin/diffurl
