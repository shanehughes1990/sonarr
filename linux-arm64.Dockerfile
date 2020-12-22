FROM hotio/mono@sha256:2c9bc2d87ff8c979e8c522ed0f4e54684ad6edb9b84f1fd25b05c6699977dbc8

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 8989

ARG VERSION

# install app
RUN curl -fsSL "https://download.sonarr.tv/v2/develop/mono/NzbDrone.develop.${VERSION}.mono.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    rm -rf "${APP_DIR}/NzbDrone.Update" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
