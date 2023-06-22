FROM alpine:3.12

ARG PANDOC_VERSION="3.1.3"

RUN apk upgrade --no-cache \
  && apk add --no-cache bash~=5.0 make~=4.3 \
  && arch=$(uname -m) \
  && if [ "${arch}" = "aarch64" ]; then arch="arm64"; elif [ "${arch}" = "x86_64" ]; then arch="amd64"; fi \
  && url_base='https://github.com/jgm/pandoc/releases/download/' \
  && tar_file="${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux-${arch}.tar.gz" \
  && wget -q "${url_base}${tar_file}" -O /opt/pandoc.tar.gz \
  && tar xvzf /opt/pandoc.tar.gz --strip-components 1 -C /usr/ \
  && rm /opt/pandoc.tar.gz

LABEL base.image="alpine:3.12" \
  repostory.name="ci-pandoc-task"

ENTRYPOINT [ "/bin/bash" ]
