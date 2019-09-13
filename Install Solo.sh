#!/bin/bash
#Credits_Tej
red=`tput setaf 1`
docker login
docker run -d -p 8111:8080 -p 5003:5003 --name httpd httpd
if [ $? -eq 0 ];then
echo -e "\e[41m\e[1mInstalled httpd Successfully\e[0m"

else
echo -e "${red}\e[5mHttpd Installation Problem Occured!\e[25m\e[39m"
exit 1
fi
docker run -d -p 5111:5432 --name b postgres postgres:10
if [ $? -eq 0 ];then
echo -e "\e[41m\e[1mInstalled PostgreSQL Successfully\e[0m"

else
echo -e "${red}\e[5mPostgres Installation Problem Occured!\e[25m\e[39m"
exit 1
fi
docker run -d -p 15111:15672 --name rabbitserver rabbitmq:3-management
if [ $? -eq 0 ];then
echo -e "\e[41m\e[1mInstalled RabbitMQ Successfully\e[0m"

else
echo -e "${red}\e[5mRabbitMQ Installation Problem Occured!\e[25m\e[39m"
exit 1
fi
docker run -d -p 9111:8123 --name clickhouseexp yandex/clickhouse-server
if [ $? -eq 0 ];then
echo -e "\e[41m \e[1mInstalled Clickhouse Successfully\e[0m"

else
echo -e "${red}\e[5mClickhouse Installation Problem Occured!\e[25m\e[39m"
exit 1
fi
