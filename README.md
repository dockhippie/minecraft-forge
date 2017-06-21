# Minecraft Forge

[![](https://images.microbadger.com/badges/image/webhippie/minecraft-forge.svg)](https://microbadger.com/images/webhippie/minecraft-forge "Get your own image badge on microbadger.com")

These are docker images for [Minecraft Forge](http://www.minecraftforge.net) running on a [Minecraft container](https://registry.hub.docker.com/u/webhippie/minecraft-vanilla/).


## Versions

To get an overview about the available versions please take a look at the [GitHub branches](https://github.com/dockhippie/minecraft-forge/branches/all) or our [Docker Hub tags](https://hub.docker.com/r/webhippie/minecraft-forge/tags/), these lists are always up to date.


## Volumes

* /minecraft/merge
* /minecraft/world
* /minecraft/logs
* /minecraft/dynmap


## Ports

* 25565
* 25575
* 8123


## Available environment variables

```bash
ENV SERVER_DYNMAP true
```


## Inherited environment variables

* [webhippie/minecraft-vanilla](https://github.com/dockhippie/minecraft-vanilla#available-environment-variables)
* [webhippie/java](https://github.com/dockhippie/java#available-environment-variables)
* [webhippie/alpine](https://github.com/dockhippie/alpine#available-environment-variables)


## Contributing

Fork -> Patch -> Push -> Pull Request


## Authors

* [Thomas Boerger](https://github.com/tboerger)


## License

MIT


## Copyright

```
Copyright (c) 2015-2017 Thomas Boerger <http://www.webhippie.de>
```
