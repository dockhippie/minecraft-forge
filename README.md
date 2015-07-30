# Minecraft Forge

These are docker images for Minecraft Forge running on an
[Vanilla Minecraft](https://registry.hub.docker.com/u/webhippie/minecraft-vanilla/).


## Usage

```
docker run --name minecraft-data busybox true
docker run -d -p 25565:25565 -p 8123:8123 \
  --volumes-from minecraft-data \
  --name minecraft \
  webhippie/minecraft-forge:10.13.2

# Execute this for further available commands
docker exec -ti minecraft manage help
```


## Versions

* [latest](https://github.com/dockhippie/minecraft-forge/tree/master)
  available as ```webhippie/minecraft-forge:latest``` at
  [Docker Hub](https://registry.hub.docker.com/u/webhippie/minecraft-forge/)
* [11.14.3](https://github.com/dockhippie/minecraft-forge/tree/11.14.3)
  available as ```webhippie/minecraft-forge:11.14.3``` at
  [Docker Hub](https://registry.hub.docker.com/u/webhippie/minecraft-forge/)
* [11.14.2](https://github.com/dockhippie/minecraft-forge/tree/11.14.2)
  available as ```webhippie/minecraft-forge:11.14.2``` at
  [Docker Hub](https://registry.hub.docker.com/u/webhippie/minecraft-forge/)
* [11.14.1](https://github.com/dockhippie/minecraft-forge/tree/11.14.1)
  available as ```webhippie/minecraft-forge:11.14.1``` at
  [Docker Hub](https://registry.hub.docker.com/u/webhippie/minecraft-forge/)
* [11.14.0](https://github.com/dockhippie/minecraft-forge/tree/11.14.0)
  available as ```webhippie/minecraft-forge:11.14.0``` at
  [Docker Hub](https://registry.hub.docker.com/u/webhippie/minecraft-forge/)
* [10.13.4](https://github.com/dockhippie/minecraft-forge/tree/10.13.4)
  available as ```webhippie/minecraft-forge:10.13.4``` at
  [Docker Hub](https://registry.hub.docker.com/u/webhippie/minecraft-forge/)
* [10.13.3](https://github.com/dockhippie/minecraft-forge/tree/10.13.3)
  available as ```webhippie/minecraft-forge:10.13.3``` at
  [Docker Hub](https://registry.hub.docker.com/u/webhippie/minecraft-forge/)
* [10.13.2](https://github.com/dockhippie/minecraft-forge/tree/10.13.2)
  available as ```webhippie/minecraft-forge:10.13.2``` at
  [Docker Hub](https://registry.hub.docker.com/u/webhippie/minecraft-forge/)


## Available environment variables

```bash
ENV SERVER_MAXHEAP 2048M
ENV SERVER_MINHEAP 512M
ENV SERVER_MAXPERM 128M
ENV SERVER_OPTS nogui
ENV SERVER_MOTD Minecraft
ENV SERVER_RCONPWD webhippie
ENV SERVER_DYNMAP true
ENV JAVA_OPTS -server -XX:+UseConcMarkSweepGC
```


## Available management commands

```bash
Usage: manage <command> [<args>]

Some useful manage commands are:
   commands          List all available sub commands
   console           Start interactive console
   deop              Deop a specific player
   op                Op a specific player
   save-all          Save the current world state
   save-off          Disable the autosave feature
   save-on           Enable the autosave feature
   say               Say something on the server
   weather-clear     Set the weather to clear
   weather-rain      Set the weather to rain
   weather-thunder   Set the weather to thunder
   whitelist-add     Add player to whitelist
   whitelist-list    Whitelist on the server
   whitelist-off     Disable the whitelist
   whitelist-on      Enable the whitelist
   whitelist-reload  Reload the whitelist
   whitelist-remove  Remove player from whitelist
```


## Contributing

Fork -> Patch -> Push -> Pull Request


## Authors

* [Thomas Boerger](https://github.com/tboerger)


## License

MIT


## Copyright

Copyright (c) 2015 Thomas Boerger <http://www.webhippie.de>
