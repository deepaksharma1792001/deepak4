
FROM python:3.9.2-slim-buster
RUN mkdir /bot && chmod 777 /bot
WORKDIR /bot
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -qq update && apt -qq install -y git wget pv jq python3-dev ffmpeg mediainfo
RUN apt-get install neofetch wget -y -f

COPY . .
RUN pip3 install -r requirements.txt
# The Dockerfile does not currently expose any ports. 
# To solve the error message, we need to add the "EXPOSE" instruction to expose the desired port.
# Assuming the necessary port is 8000, we will add the EXPOSE instruction to expose port 8000.
EXPOSE 8000

CMD ["bash","run.sh"]
