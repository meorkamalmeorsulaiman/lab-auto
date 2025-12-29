#!/bin/bash
cd /usr/local/jenkins-service
# Just in case we would have upgraded the controller, we need to make sure that the agent is using the latest version of the agent.jar
curl -sO http://my_ip:8080/jnlpJars/agent.jar
java -jar agent.jar -url http://my_ip:8080/ -secret my_secret -name "my_agent_name" -webSocket -workDir "/home/ansible"
exit 0