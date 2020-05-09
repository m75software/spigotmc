#!/bin/bash
SPIGOT_HOME="/opt/spigotmc"
SPIGOT_BUILD_HOME="/opt/spigotmc-build"

PrintMessage () {
    echo
    echo "**********************************************************************"
    echo $1
    echo "**********************************************************************"
    echo
}

# Check to make sure the spigot.jar file exists and build it if not.
if [ ! -f "$SPIGOT_HOME/server/spigot.jar" ]; then

  # Make sure git is available
  PrintMessage "Installing GIT"
  yum install -y git

  # Build the spigot.jar file
  PrintMessage "Building spigot server jar"
  cd /opt/spigotmc-build
  git config --global --unset core.autocrlf
  java -jar BuildTools.jar
  mv spigot*.jar spigot.jar
  PrintMessage "Copying spigot server jar to $SPIGOT_HOME/server/"
  cp $SPIGOT_BUILD_HOME/spigot.jar $SPIGOT_HOME/server/
fi

# Set the Minecraft EULA.
if [ ! -f "$SPIGOT_HOME/server/eula.txt" ]; then
  PrintMessage "Setting Minecraft EULA to $MINECRAFT_EULA"
  cd $SPIGOT_HOME/server/
  echo eula=$MINECRAFT_EULA >> eula.txt
fi

PrintMessage "Running server..."
cd $SPIGOT_HOME/server/
java -Xms1G -Xmx1G -XX:+UseConcMarkSweepGC -jar spigot.jar nogui
