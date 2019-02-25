FROM ubuntu:18.04

COPY ./src/* /

EXPOSE 4040

CMD ["/run.sh"]

