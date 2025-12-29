#!/bin/bash
cd /usr/local/jenkins-service
# Just in case we would have upgraded the controller, we need to make sure that the agent is using the latest version of the agent.jar
curl -sO http://my_ip:8080/jnlpJars/agent.jar
java -jar agent.jar -jnlpUrl http://my_ip:8080/computer/My%20New%20Ubuntu%2022%2E04%20Node%20with%20Java%20and%20Docker%20installed/jenkins-agent.jnlp -secret my_secret -workDir "/home/jenkins"
exit 0