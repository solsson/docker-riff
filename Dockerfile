FROM buildpack-deps:stretch-curl as download

ENV RIFF_VERSION=v0.1.2
ENV RIFF_TGZ_URL=https://github.com/projectriff/riff/releases/download/${RIFF_VERSION}/riff-linux-amd64.tgz
ENV RIFF_TGZ_SHA256=9ef68272e9e9acb7c08a571d35c1c6547144ad948b7537fd67144face7527368

RUN curl -SLs -o riff-linux-amd64.tgz ${RIFF_TGZ_URL}
RUN echo "${RIFF_TGZ_SHA256}  riff-linux-amd64.tgz" | sha256sum -c -
RUN tar xvzf riff-linux-amd64.tgz
RUN mv riff /usr/local/bin/
RUN sha256sum /usr/local/bin/*

FROM scratch

COPY --from=download /usr/local/bin/riff /riff

ENTRYPOINT [ "/riff" ]
