
FROM python:3.9.2-slim-buster

RUN mkdir /bot && chmod 777 /bot

WORKDIR /bot

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y git wget pv jq python3-dev ffmpeg mediainfo

# There is a typo in the package name "neofetch", it should be "neofetch"
RUN apt-get install neofetch wget -y

COPY . .

RUN pip3 install -r requirements.txt

# The Dockerfile does not currently expose any ports.
# We can assume the desired port is 8000, so we will add the EXPOSE instruction to expose port 8000.
EXPOSE 8000

CMD ["bash","run.sh"]
