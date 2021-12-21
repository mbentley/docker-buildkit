# start from upstream buildkit image & upgrade all packages
ARG BUILDKIT_TAG="v0.9.3"
FROM moby/buildkit:${BUILDKIT_TAG} as upstream

RUN apk --no-cache upgrade --purge

# copy over the contents into a new image and add my customizations
FROM scratch
COPY --from=upstream / /

RUN echo '@edge https://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories &&\
  apk add --no-cache bash pigz runc@edge &&\
  cd /usr/bin &&\
  rm buildkit-runc &&\
  ln -s runc buildkit-runc

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh","buildkitd"]
