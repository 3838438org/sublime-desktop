# Builds a Docker image with Ubuntu 16.04 and Sublime Text 3
#
# Authors:
# Xiangmin Jiao <xmjiao@gmail.com>

FROM x11vnc/desktop:latest
LABEL maintainer "Xiangmin Jiao <xmjiao@gmail.com>"

USER root
WORKDIR /tmp

# Install Sublime Text 3
RUN curl -q https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add - && \
    echo "deb https://download.sublimetext.com/ apt/stable/" | \
        tee /etc/apt/sources.list.d/sublime-text.list && \
    apt-get update && \
    apt-get install -q -y --no-install-recommends \
        sublime-text && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR $DOCKER_HOME
