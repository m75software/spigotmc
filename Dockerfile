FROM openjdk:latest
ADD start.sh /opt/spigotmc/
ADD https://hub.spigotmc.org/jenkins/job/BuildTools/lastStableBuild/artifact/target/BuildTools.jar /opt/spigotmc-build/
VOLUME ["/opt/spigotmc/server/"]
CMD ["/opt/spigotmc/start.sh"]
