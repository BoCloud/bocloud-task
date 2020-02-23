#!/bin/sh

#modify xxl-job config
echo "replace {data_url} to ${data_url}"
eval sed -i -e 's/\{data_url\}/${data_url}/' /opt/paas/images/bocloud-task/application.properties 

echo "replace {data_username} to ${data_username}"
eval sed -i -e 's/\{data_username\}/${data_username}/' /opt/paas/images/bocloud-task/application.properties

echo "replace {data_password} to ${data_password}"
eval sed -i -e 's/\{data_password\}/${data_password}/' /opt/paas/images/bocloud-task/application.properties

echo "replace {data_prefix} to ${data_prefix}"
eval sed -i -e 's/\{data_prefix\}/${data_prefix}/' /opt/paas/images/bocloud-task/application.properties

echo "replace {email_host} to ${email_host}"
eval sed -i -e 's/\{email_host\}/${email_host}/' /opt/paas/images/bocloud-task/application.properties

echo "replace {email_port} to ${email_port}"
eval sed -i -e 's/\{email_port\}/${email_port}/' /opt/paas/images/bocloud-task/application.properties

echo "replace {email_username} to ${email_username}"
eval sed -i -e 's/\{email_username\}/${email_username}/' /opt/paas/images/bocloud-task/application.properties

echo "replace {email_password} to ${email_password}"
eval sed -i -e 's/\{email_password\}/${email_password}/' /opt/paas/images/bocloud-task/application.properties

echo "replace {email_sendnick} to ${email_sendnick}"
eval sed -i -e 's/\{email_sendnick\}/${email_sendnick}/' /opt/paas/images/bocloud-task/application.properties
exec "$@"


