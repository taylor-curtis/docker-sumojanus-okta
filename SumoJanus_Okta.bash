#!/bin/bash

# If you run this script manually to test, call it right under the main sumojanus folder, for example go to \"sumojanus\", then call "bin\\SumoJanus_Okta.bash"

if [ "$1" = "-s" ]; then
        echo "Setup mode"
        runMode="-s"
else
        runMode="-r"
fi

# Make sure JAVAPATH below is set to the JRE folder under the SumoCollector directory, default is set to the environment variable JAVA_HOME
JAVA_HOME=/opt/SumoCollector/jre

export JAVAPATH="${JAVA_HOME}"

SUMOJANUS_JAR_FILE=`ls januscore*.jar`
echo "Found SumoJanus core jar file: ${SUMOJANUS_JAR_FILE}"
${JAVAPATH}/bin/java -jar ${SUMOJANUS_JAR_FILE} ${runMode} OktaCollector-1.0.2.jar -e 1800
