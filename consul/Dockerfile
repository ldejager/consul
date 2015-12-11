FROM alpine:3.2

ENV PATH /opt/consul/bin:/opt/kubectl/bin:$PATH
ENV VERSION 0.6.0

ADD https://releases.hashicorp.com/consul/${VERSION}/consul_${VERSION}_linux_amd64.zip /tmp/consul.zip

RUN apk --update add curl ca-certificates \
 && curl -Ls https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk > /tmp/glibc-2.21-r2.apk \
 && apk add --allow-untrusted /tmp/glibc-2.21-r2.apk \
 && apk add bash \
 && rm -rf /tmp/glibc-2.21-r2.apk /var/cache/apk/* \
 && mkdir -vp /opt/consul/bin \
 && mkdir -vp /opt/consul/data \
 && mkdir -vp /opt/consul/config \
 && mkdir -vp /opt/consul/ui \
 && cd /opt/consul/bin && unzip /tmp/consul.zip && chmod +x /opt/consul/bin/consul && rm -vf /tmp/consul.zip

ENTRYPOINT ["/opt/consul/bin/consul"]
