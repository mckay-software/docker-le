FROM alpine
MAINTAINER McKay Software <opensource@mckaysoftware.co.nz>

EXPOSE 80

RUN apk add --update git bash openssh curl netcat-openbsd &&\
    git clone --depth=1 git://github.com/Neilpang/le.git /le &&\
    apk del git && rm -rf /var/cache/apk/* /le/.git

ENTRYPOINT ["/le/le.sh"]
VOLUME /root/.le
WORKDIR /root/.le

