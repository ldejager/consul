FROM rwxlabs/alpine-glibc

MAINTAINER Leon de Jager <ldejager@rwxlabs.io>

ENV PATH /opt/consul/bin:/opt/kubectl/bin:$PATH

ARG BUILD_DATE
ARG VCS_REF
ARG CODE_VERSION

ENV CODE_VERSION 0.6.4

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.version=$CODE_VERSION \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/rwxlabs/consul"

ADD https://releases.hashicorp.com/consul/${CODE_VERSION}/consul_${CODE_VERSION}_linux_amd64.zip /tmp/consul.zip

RUN apk --update add curl ca-certificates \
 && apk add bash \
 && rm -rf /var/cache/apk/* \
 && mkdir -vp /opt/consul/bin \
 && mkdir -vp /opt/consul/data \
 && mkdir -vp /opt/consul/config \
 && mkdir -vp /opt/consul/ui \
 && cd /opt/consul/bin && unzip /tmp/consul.zip && chmod +x /opt/consul/bin/consul && rm -vf /tmp/consul.zip

ENTRYPOINT ["/opt/consul/bin/consul"]
