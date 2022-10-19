# start from upstream buildkit image & upgrade all packages
ARG BUILDKIT_TAG="v0.10.5"
FROM moby/buildkit:${BUILDKIT_TAG} AS upstream

RUN apk --no-cache upgrade --purge

# copy over the contents into a new image and add my customizations
FROM scratch
COPY --from=upstream / /

RUN apk add --no-cache bash pigz

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh","buildkitd"]
