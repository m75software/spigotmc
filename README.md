# spigotmc
A dockerfile for building a Minecraft Spigot server.

Build the image:
```
docker build -t spigotmc .
```

Run the image:
```
docker run -it -p 25565:25565 \
    -v <Local Path>:/opt/spigotmc/server \
    --name spigotmc \
    -e MINECRAFT_EULA=true
    spigotmc
```
The first time the image is run it will check to see if there is already a built
spigot.jar file in the VOLUME. If not, it will pull the latest
version of the BuildTools.jar and build a new spigot.jar file and place it in the
VOLUME folder. This will take some extra time for the container to start while it
builds spigot. If there is already a file, then the container uses that file and
the container will startup much faster.
