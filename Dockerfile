# Sumo Logic Okta Collector Docker Image
# Version 0.1
FROM ubuntu:18.04
MAINTAINER Sumo Logic <docker@sumologic.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update --quiet && \
 apt-get install -y --no-install-recommends apt-utils && \
 apt-get upgrade --quiet --allow-downgrades --allow-remove-essential --allow-change-held-packages -y && \
 apt-get install --quiet --allow-downgrades --allow-remove-essential --allow-change-held-packages -y wget && \
 wget -q -O /tmp/collector.deb https://collectors.sumologic.com/rest/download/deb/64 && \
 dpkg -i /tmp/collector.deb && \
 rm /tmp/collector.deb && \
 apt-get clean --quiet && \
 rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN wget -q -O sumojanus-okta.tar.gz https://script-collection.s3.amazonaws.com/okta/r1.0.2/sumojanus-okta-dist.1.0.2.tar.gz
RUN tar xzvf sumojanus-okta.tar.gz
RUN rm /sumojanus-okta/conf/sumologic.properties
#COPY user.properties /opt/SumoCollector/config/
COPY sumo-sources.json /
#COPY sumologic.properties /sumojanus-okta/conf/
RUN rm /opt/SumoCollector/config/user.properties
RUN rm /sumojanus-okta/bin/SumoJanus_Okta.bash
COPY SumoJanus_Okta.bash sumojanus-okta/bin/
COPY run.sh /run.sh
ENTRYPOINT ["/bin/bash", "/run.sh"]
