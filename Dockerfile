FROM python:3.6.4-alpine

COPY requirements.txt install_dependencies.sh /

RUN sh install_dependencies.sh && \
    rm requirements.txt install_dependencies.sh
