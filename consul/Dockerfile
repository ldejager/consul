FROM ldejager/alpine-glibc

ENV PATH /opt/consul/bin:/opt/kubectl/bin:$PATH
ENV VERSION 0.6.4

ADD https://releases.hashicorp.com/consul/${VERSION}/consul_${VERSION}_linux_amd64.zip /tmp/consul.zip

RUN apk --update add curl ca-certificates \
 && apk add bash \
 && rm -rf /var/cache/apk/* \
 && mkdir -vp /opt/consul/bin \
 && mkdir -vp /opt/consul/data \
 && mkdir -vp /opt/consul/config \
 && mkdir -vp /opt/consul/ui \
 && cd /opt/consul/bin && unzip /tmp/consul.zip && chmod +x /opt/consul/bin/consul && rm -vf /tmp/consul.zip

ENTRYPOINT ["/opt/consul/bin/consul"]
