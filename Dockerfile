FROM node:12.16.1

RUN apt-get update
RUN apt-get upgrade

ADD . /root/app/
WORKDIR /root/app/

RUN npm install -g gatsby-cli
RUN npm install

EXPOSE 8000
CMD ["bash"]
