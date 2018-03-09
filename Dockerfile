FROM stellarity/openjdk8
MAINTAINER Sergey Podobry <sergey.podobry@stellaritysoftware.com>
LABEL Description="atlassian sdk"

ENV SDK_VERSION=6.3.10

# install packages
RUN apt-get update &&\
    apt-get install -y --no-install-recommends curl &&\
    curl https://packages.atlassian.com/list/atlassian-sdk-deb/deb-archive/atlassian-plugin-sdk_${SDK_VERSION}_all.deb -o /tmp/sdk.deb &&\
    dpkg -i /tmp/sdk.deb &&\
    rm /tmp/sdk.deb &&\
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN atlas-version

# expose ports
EXPOSE 6990 7990 1990 4990 3990 2990 5990
