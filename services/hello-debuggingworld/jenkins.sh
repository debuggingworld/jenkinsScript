#!/bin/bash -e
cd "`dirname $0`"
. ./pom.sh


#1. download war, ready env
echo "deploy time: $work_time"
mkdir -p war/
war=war/$pom_a-$pom_v.war
echo $war
wget    "${BUILD_URL}${pom_g}\$${pom_a}/artifact/$pom_g/$pom_a/$pom_v/$pom_a-$pom_v.war" -O $war

deploy_war


