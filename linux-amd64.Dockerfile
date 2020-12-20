FROM hotio/mono@sha256:9ff4309a8a0a856c79a273e9bf5e5bbd236bbe712f8e564af13a117a4a6f4f21

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 8989

ARG VERSION

# install app
RUN curl -fsSL "https://download.sonarr.tv/v2/develop/mono/NzbDrone.develop.${VERSION}.mono.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    rm -rf "${APP_DIR}/NzbDrone.Update" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
