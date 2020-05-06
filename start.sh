#!/bin/bash
SPIGOT_HOME="/opt/spigotmc"
SPIGOT_BUILD_HOME="/opt/spigotmc-build"


if [ ! -f "$SPIGOT_HOME/server/eula.txt" ]; then
  echo Running intial setup of the server...
  cp $SPIGOT_BUILD_HOME/spigot.jar $SPIGOT_HOME/server/
  cd $SPIGOT_HOME/server/
  echo eula=$MINECRAFT_EULA >> eula.txt
  echo Finished intial setup of the server!
fi

cd $SPIGOT_HOME/server/
java -Xms1G -Xmx1G -XX:+UseConcMarkSweepGC -jar spigot.jar nogui
