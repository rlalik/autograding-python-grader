FROM python:3.13.2-slim

COPY requirements.txt /requirements.txt

RUN pip install -r /requirements.txt

RUN apt-get update \
 && apt-get install make g++ jq -y \
 && apt-get autoremove -y \
 && apt-get install coreutils -y \
 && rm -rf /var/lib/apt/lists/*

COPY . /opt/test-runner

WORKDIR /opt/test-runner

ENTRYPOINT [ "/opt/test-runner/bin/run.sh" ]
