FROM ubuntu:latest

COPY entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

RUN apt-get update 

ENTRYPOINT ["./entrypoint.sh"]