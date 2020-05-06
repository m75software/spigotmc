# spigotmc
A dockerfile for building a Minecraft Spigot server.

Build the base image:
```
docker build -t spigotmc-base -f Dockerfile.base .
```

Build the image:
```
docker build -t spigotmc -f Dockerfile.build .
```

Run the image:
```
docker run -it -p 25565:25565 \
    -v <Local Path>:/opt/spigotmc/server \
    --name spigotmc \
    -e MINECRAFT_EULA=true
    spigotmc
```
