# minecraft-forge

[![Docker Build](https://github.com/dockhippie/minecraft-forge/workflows/docker/badge.svg)](https://github.com/dockhippie/minecraft-forge/actions?query=workflow%3Adocker) [![Readme Build](https://github.com/dockhippie/minecraft-forge/workflows/readme/badge.svg)](https://github.com/dockhippie/minecraft-forge/actions?query=workflow%3Areadme) [![Docker Size](https://img.shields.io/docker/image-size/webhippie/minecraft-forge/latest)](#) [![Docker Pulls](https://img.shields.io/docker/pulls/webhippie/minecraft-forge)](https://hub.docker.com/r/webhippie/minecraft-forge) [![GitHub Repo](https://img.shields.io/badge/github-repo-yellowgreen)](https://github.com/dockhippie/minecraft-forge)

These are docker images for [Vanilla Minecraft](https://minecraft.net) running on our [AdoptOpenJDK image](https://github.com/dockhippie/adoptopenjdk).

## Versions

For the available versions please look at [Docker Hub](https://hub.docker.com/r/webhippie/minecraft-forge/tags) or [Quay](https://quay.io/repository/webhippie/minecraft-forge?tab=tags) or check the existing folders within the [GitHub repository](https://github.com/dockhippie/minecraft-forge).

## Volumes

*  /var/lib/minecraft
*  /etc/minecraft/override

## Ports

* 25565
* 25575
* 8123

## Available environment variables

```console

```

## Inherited environment variables

*  [webhippie/minecraft-vanilla](https://github.com/dockhippie/minecraft-vanilla#available-environment-variables)
*  [webhippie/adoptopenjdk](https://github.com/dockhippie/adoptopenjdk#available-environment-variables)
*  [webhippie/alpine](https://github.com/dockhippie/alpine#available-environment-variables)

## Contributing

Fork -> Patch -> Push -> Pull Request

## Authors

*  [Thomas Boerger](https://github.com/tboerger)

## License

MIT

## Copyright

```console
Copyright (c) 2015 Thomas Boerger <http://www.webhippie.de>
```
