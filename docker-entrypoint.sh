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
exec "$@"


