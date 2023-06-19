FROM ghcr.io/stellaritysoftware/openjdk11
LABEL Description="atlassian sdk"

ENV SDK_VERSION=8.2.8

# install packages
RUN apt-get update &&\
    apt-get install -y --no-install-recommends curl &&\
    curl https://packages.atlassian.com/debian/atlassian-sdk-deb/deb-archive/atlassian-plugin-sdk_${SDK_VERSION}_all.deb -o /tmp/sdk.deb &&\
    dpkg -i /tmp/sdk.deb &&\
    rm /tmp/sdk.deb &&\
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN atlas-version

# expose ports
EXPOSE 6990 7990 1990 4990 3990 2990 5990
