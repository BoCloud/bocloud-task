FROM openjdk:8-jdk-alpine
MAINTAINER beyondcent.com
ENV  TIME_ZONE Asia/Shanghai
RUN ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime
RUN mkdir -p /opt/paas/images/paas-basic-task
ENV CONTROL_PATH /opt/paas/images/paas-basic-task
COPY application.properties $CONTROL_PATH
COPY xxl-job-admin/target/xxl-job-admin-*.jar $CONTROL_PATH/paas-basic-task.jar
COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh /

#set default env value
ENV data_url 127.0.0.1:3316
ENV data_username root
ENV data_password password
ENV data_prefix paas_basic_task
ENV email_host smtp.exmail.qq.com
ENV email_port 25
ENV email_username guoguangchao@beyondcent.com
ENV email_password Gguangc123
ENV email_sendnick BASIC-TASK
ENV consul_host 127.0.0.1
ENV consul_port 8500
ENV acl_token 787bd467-a93e-8558-1aaf-f7c4036c406b


EXPOSE 9024
WORKDIR $CONTROL_PATH
ENTRYPOINT ["/docker-entrypoint.sh"] 
CMD ["java", "-Dspring.config.location=application.properties", "-jar", "paas-basic-task.jar", "/bin/bash"]
