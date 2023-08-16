
FROM python:3.9.2-slim-buster
RUN mkdir /bot && chmod 777 /bot
WORKDIR /bot
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y git wget pv jq python3-dev ffmpeg mediainfo
RUN apt-get install neofetch wget -y -f
# The previous lines used the apt package manager, however, the base image already uses apt-get.
# So, to fix the error, we will change "apt" to "apt-get" in both lines.
# The error message does not provide specific information, so we will fix the apt package manager command to eliminate the possibilities of errors in the package installation.

COPY . .
RUN pip3 install -r requirements.txt
# The Dockerfile does not currently expose any ports. 
# To solve the error message, we need to add the "EXPOSE" expose the desired instruction port.
 to# Assuming the necessary port is 8000, we will add the EXPOSE instruction to expose port 8000.
EXPOSE 8000

CMD ["bash","run.sh"]

