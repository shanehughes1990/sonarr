FROM hotio/mono@sha256:6f53503813b05c53d428a6d2b4230b2bfe0264e7bb3b4213bdb60b280ef38cc7

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 8989

ARG VERSION

# install app
RUN curl -fsSL "https://download.sonarr.tv/v2/master/mono/NzbDrone.master.${VERSION}.mono.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    rm -rf "${APP_DIR}/NzbDrone.Update" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
