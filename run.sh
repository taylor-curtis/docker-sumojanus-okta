#!/bin/bash

cat << EOF > /sumojanus-okta/conf/sumologic.properties
# provide the parameters for a bundle via a unique section after this
[oktacollector]
# required, your Okta API token
api_token = ${SUMO_OKTA_KEY}
# required, your okta account URL, e.g: https://acme.okta.com
okta_org_url = ${SUMO_OKTA_URL}
# required, file to keep track of the okta event stream
stream_pos_path = /sumojanus-okta/data/okta_checkpoint.dat
#  maximum pagination limit is 1000
pagination_limit = 1000
# optional, start time window to query, in epoch milliseconds. Default is 7 days ago.
# start_time = 1435709058000
# optional, end time window to query, in epoch milliseconds. Default is 1 minute ago
# end_time = 1436377600000
EOF

cat << EOF > /opt/SumoCollector/config/user.properties
name = sumo-okta-collector-prod
accessid = ${SUMO_ACCESS_ID}
accesskey = ${SUMO_ACCESS_KEY}
enableScriptSource=true
sources = /sumo-sources.json
EOF


service collector start #start the service
exec tail -f /opt/SumoCollector/logs/collector.log #get logs and keep container alive
