FROM 416670754337.dkr.ecr.eu-west-2.amazonaws.com/ci-base-build:1.0.0

ARG PANDOC_VERSION="3.1.3"

RUN dnf upgrade -y \
  && dnf update \
  && dnf install -y tar-2:1.34 \
  && dnf clean all \
  && arch=$(uname -m) \
  && if [ "${arch}" = "aarch64" ]; then arch="arm64"; fi \ 
  && url_base='https://github.com/jgm/pandoc/releases/download/' \
  && tar_file="${PANDOC_VERSION}/pandoc-3.1.3-linux-${arch}.tar.gz" \
  && wget -q "${url_base}${tar_file}" -O /opt/pandoc.tar.gz \
  && tar xvzf /opt/pandoc.tar.gz --strip-components 1 -C /usr/ \
  && rm /opt/pandoc.tar.gz

LABEL base.image="alpine:3.12" \
  repostory.name="ci-pandoc-task"

ENTRYPOINT [ "/bin/bash" ]
