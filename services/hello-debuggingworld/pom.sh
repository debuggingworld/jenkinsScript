#!/bin/bash -e
. ../bin/env-set.sh

pom_g=com.zth
pom_a=hello-debuggingWorld
pom_v=1.0-SNAPSHOT
pom_r=snapshots


deploy_war() {
        echo "deploy_war()...."
        target_d=war/${pom_a}-${pom_v}-$work_time
        target_dir=`pwd`/$target_d
        if [ ! -f "$war" ]; then
                echo "war not exist: $war"
                exit 1
        fi
        unzip -q $war -d $target_dir
        cp -r app-conf/* $target_dir/WEB-INF/classes/
        rm -rf appwar
        ln -sf $target_d/  appwar

        ./tomcat.sh stop

        target_ln=`pwd`/appwar
        echo '<?xml version="1.0" encoding="UTF-8" ?>
<Context docBase="'$target_ln'" allowLinking="true">
</Context>' > conf/Catalina/localhost/ROOT.xml
        ./tomcat.sh start
}

