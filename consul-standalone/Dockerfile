FROM rwxlabs/consul:latest

MAINTAINER Leon de Jager <ldejager@rwxlabs.io>

ARG BUILD_DATE
ARG VCS_REF
ARG CODE_VERSION

ENV CODE_VERSION 0.6.4

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.version=$CODE_VERSION \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/rwxlabs/consul"

ADD ./config /opt/consul/config/
ADD https://releases.hashicorp.com/consul/${VERSION}/consul_${VERSION}_web_ui.zip /tmp/webui.zip

RUN cd /tmp \
 && unzip webui.zip -d /opt/consul/ui \
 && rm /tmp/webui.zip

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600 8600/udp

ENV DNS_RESOLVES consul
ENV DNS_PORT 53

ENTRYPOINT ["/opt/consul/bin/consul", "agent", "-server", "-config-dir=/opt/consul/config"]
