FROM ubuntu:latest

RUN apt-get update && apt-get install hugo -y

EXPOSE 1313

ENTRYPOINT ["hugo"]

CMD ["version"]