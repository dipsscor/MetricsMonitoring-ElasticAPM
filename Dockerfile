FROM openjdk
MAINTAINER Dipankar Chatterjee <dipankar.c@hcl.com>
ADD target/MetricsMonitoring-1.0.jar MetricsMonitoring-1.0.jar

RUN yum -y install wget

RUN wget -O apm-agent.jar https://repo1.maven.org/maven2/co/elastic/apm/elastic-apm-agent/1.12.0/elastic-apm-agent-1.12.0.jar
ENTRYPOINT exec java -javaagent:/apm-agent.jar -Delastic.apm.service_name=$ELASTIC_APM_SERVICE_NAME -Delastic.apm.application_packages=$ELASTIC_APM_APPLICATION_PACKAGES -Delastic.apm.server_urls=$ELASTIC_APM_SERVER_URLS -jar /MetricsMonitoring-1.0.jar spring-boot-elastic-apm-service
EXPOSE 12001