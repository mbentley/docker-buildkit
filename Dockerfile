FROM moby/buildkit:v0.7.2

RUN apk add --no-cache bash
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh","buildkitd"]
