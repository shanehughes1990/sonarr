FROM hotio/mono@sha256:771a4506b9064ff31d4f516ebc8613f0bf3f397cb51806ffa76f33fbbed86730

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 8989

ARG VERSION

# install app
RUN curl -fsSL "https://download.sonarr.tv/v2/develop/mono/NzbDrone.develop.${VERSION}.mono.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    rm -rf "${APP_DIR}/NzbDrone.Update" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
