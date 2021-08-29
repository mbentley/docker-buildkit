ARG BUILDKIT_TAG="v0.7.2"
FROM moby/buildkit:${BUILDKIT_TAG}

RUN echo '@3.14 https://dl-cdn.alpinelinux.org/alpine/v3.14/community' >> /etc/apk/repositories &&\
  apk add --no-cache bash runc@3.14 &&\
  cd /usr/bin &&\
  rm buildkit-runc &&\
  ln -s runc buildkit-runc

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh","buildkitd"]
