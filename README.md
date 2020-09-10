# docker-sumojanus-okta

* ** ENV variables: **
  * SUMO_OKTA_KEY <br>
  * SUMO_OKTA_URL <br>
  * SUMO_ACCESS_ID <br>
  * SUMO_ACCESS_KEY <br>
<br>

<br>
* `run.sh` does the folloing:
   1. creates /sumojanus-okta/conf/sumologic.properties
   2. creates /opt/SumoCollector/config/user.properties
   3. starts the collector
   4. runs `tail -f /opt/SumoCollector/logs/collector.log` to keep container alive and shows the container logs within docker for debugging. 

<br>
<br>
** Tested/Deployed locally and with ECS. **
