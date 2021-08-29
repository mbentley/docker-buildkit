ARG BUILDKIT_TAG="v0.7.2"
FROM moby/buildkit:${BUILDKIT_TAG}

RUN apk add --no-cache bash
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh","buildkitd"]
