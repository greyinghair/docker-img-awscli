# Base docker image
FROM alpine:latest

LABEL description="AWSCLI Image"
LABEL tag="awscli-img"
MAINTAINER Dan Stacey

RUN apk update && apk add \
	ca-certificates \
	groff \
	less \
	python3 \
	py-pip \
	&& rm -rf /var/cache/apk/* \
  && pip install pip --upgrade \
  && pip install awscli

WORKDIR "/data"

# Autorun aws
ENTRYPOINT ["aws"]
