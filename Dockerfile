FROM ubuntu:18.04

RUN mkdir /app
WORKDIR /app

COPY ./src/* ./
COPY ./docker-entrypoint.sh ./

EXPOSE 4040

CMD [ "./docker-entrypoint.sh" ]
