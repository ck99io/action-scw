FROM scaleway/cli:v2.2.2 as upstream

FROM alpine:3.8

COPY --from=upstream /scw /scw

RUN apk add --no-cache curl \
    && mkdir /lib64 \
    && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

LABEL "name"="action-scw"
LABEL "version"="2.2.2"
LABEL "maintainer"="Christian Koehler"
LABEL "repository"="https://github.com/ck99io/action-scw"
LABEL "homepage"="https://github.com/ck99io/action-scw"

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD [ "help" ]
