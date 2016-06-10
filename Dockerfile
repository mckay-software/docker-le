FROM alpine
MAINTAINER McKay Software <opensource@mckaysoftware.co.nz>

EXPOSE 80

RUN apk add --update git bash openssh curl netcat-openbsd &&\
    git clone git://github.com/Neilpang/acme.sh.git /le &&\
    cd /le && git checkout 95fd753ffce8150da8631cde6e &&\
    apk del git && rm -rf /var/cache/apk/* /le/.git

ENTRYPOINT ["/le/le.sh"]
VOLUME /root/.le
WORKDIR /root/.le
