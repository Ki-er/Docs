FROM ubuntu:latest as builder

RUN apt-get update && apt-get install curl ca-certificates -y

ENV HUGO_VERSION="0.88.1"

WORKDIR /tmp

RUN curl -L "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz" -o "hugo.tar.gz" && \
    tar xvzf hugo.tar.gz

FROM ubuntu:latest as server

COPY --from=builder /tmp/hugo /usr/bin/hugo

RUN chmod +x /usr/bin/hugo

WORKDIR /usr/src/app

RUN useradd -ms /bin/bash hugo

USER hugo

EXPOSE 1313

ENTRYPOINT ["hugo"]

CMD ["version"]