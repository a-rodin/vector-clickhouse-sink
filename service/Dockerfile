FROM debian:9

RUN apt-get update && apt-get install -y fortunes netcat

COPY service.sh /

CMD ["/service.sh"]
