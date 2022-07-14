# Custom Dockerfile

FROM jetbrains/teamcity-agent:2022.04.2-linux-sudo
ENV DEBIAN_FRONTEND noninteractive

# Install basic tools
RUN sudo apt-get update
RUN sudo apt-get -y --no-install-recommends install dirmngr gpg-agent software-properties-common apt-transport-https wget \
        zip git npm

RUN sudo npm cache clean -f
RUN sudo npm install -g n
RUN sudo n stable

RUN sudo apt-get  -y --no-install-recommends install python3.8 python3-pip
RUN sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10

USER root