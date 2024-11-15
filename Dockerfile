FROM debian:bookworm
ARG R_VERSION
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends eatmydata && \
    eatmydata apt-get install -y --no-install-recommends locales && \
    echo 'en_US.UTF-8 UTF-8' >>/etc/locale.gen && locale-gen && \
    eatmydata apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      git \
      libssl-dev \
      libxml2-dev \
      pandoc \
      pkg-config \
      time \
      zlib1g-dev && \
    curl -fSsL "https://cdn.posit.co/r/debian-12/pkgs/r-${R_VERSION}_1_amd64.deb" >/tmp/r.deb && \
    eatmydata apt-get install -y /tmp/r.deb && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ENV LANG=en_US.UTF-8

COPY Rprofile.site /opt/R/"$R_VERSION"/lib/R/etc/Rprofile.site

RUN /opt/R/"$R_VERSION"/bin/Rscript -e 'install.packages("pak")'

ARG COVR_COMMIT=3c6daa0ef9bc6e34790a0b61798beec137ff9cde
RUN eatmydata git clone https://github.com/r-lib/covr.git /covr && \
    git -C /covr checkout "$COVR_COMMIT" && \
    eatmydata /opt/R/"$R_VERSION"/bin/Rscript -e 'pak::local_install_dev_deps("/covr", dependencies = TRUE)'

ARG PKG_URL
ARG PKG_COMMIT
RUN eatmydata git clone "$PKG_URL" /pkg && \
    git -C /pkg checkout "$PKG_COMMIT" && \
    eatmydata /opt/R/"$R_VERSION"/bin/Rscript -e 'pak::local_install_dev_deps("/pkg", dependencies = TRUE)'

RUN mkdir /patches
COPY patches /patches
ARG COVR_PATCH=
RUN test -z "$COVR_PATCH" || \
    git -C /covr apply /patches/"$COVR_PATCH"
RUN eatmydata /opt/R/"$R_VERSION"/bin/Rscript -e 'pak::local_install("/covr", dependencies = TRUE)'

COPY --chmod=0755 run.sh /run.sh
ENV R_VERSION "$R_VERSION"

ARG GID
ARG UID
RUN addgroup --gid "$GID" runner && \
    adduser --disabled-password --uid "$UID" --gid "$GID" runner && \
    chown -R runner:runner /pkg

USER runner
