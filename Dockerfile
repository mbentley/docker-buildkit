ARG BUILDKIT_TAG="v0.9.2"
FROM moby/buildkit:${BUILDKIT_TAG}

RUN echo '@edge https://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories &&\
  apk add --no-cache bash pigz runc@edge &&\
  cd /usr/bin &&\
  rm buildkit-runc &&\
  ln -s runc buildkit-runc

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh","buildkitd"]
