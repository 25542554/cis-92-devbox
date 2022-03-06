FROM docker.io/ubuntu:20.04

RUN apt update -y  && DEBIAN_FRONTEND=noninteractive apt install -y python3-pip tzdata postgresql-client
RUN python3 -m pip install django psycopg2-binary
RUN echo 'alias python=python3' >> ~/.bashrc
COPY app/mysite/ /app

WORKDIR /app

ENTRYPOINT ["bash"]
CMD ["-c", "./entrypoint.sh"]