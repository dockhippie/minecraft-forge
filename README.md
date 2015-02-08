# Minecraft Forge

These are docker images for Minecraft Forge running on an
[openSUSE 13.2 container](https://registry.hub.docker.com/_/opensuse/)


## Usage

```
docker run -v /minecraft/merge -v /minecraft/world -v /minecraft/logs --name minecraft-data busybox true
docker run -p 25565:25565 -d --volumes-from minecraft-data --name minecraft webhippie/minecraft-forge:latest start

# Execute this for further available commands
docker exec -ti minecraft manage help
```


## Versions

* [latest](https://github.com/dockhippie/minecraft-forge/tree/master)
  available as ```webhippie/minecraft-forge:latest``` at
  [Docker Hub](https://registry.hub.docker.com/u/webhippie/minecraft-forge/)
* [11.14.0](https://github.com/dockhippie/minecraft-forge/tree/11.14.0)
  available as ```webhippie/minecraft-forge:11.14.0``` at
  [Docker Hub](https://registry.hub.docker.com/u/webhippie/minecraft-forge/)
* [10.13.2](https://github.com/dockhippie/minecraft-forge/tree/10.13.2)
  available as ```webhippie/minecraft-forge:10.13.2``` at
  [Docker Hub](https://registry.hub.docker.com/u/webhippie/minecraft-forge/)


## Contributing

Fork -> Patch -> Push -> Pull Request


## Authors

* [Thomas Boerger](https://github.com/tboerger)


## License

MIT


## Copyright

Copyright (c) 2015 Thomas Boerger <http://www.webhippie.de>
