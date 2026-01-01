# minecraft-forge

[![Docker Build](https://github.com/dockhippie/minecraft-forge/actions/workflows/docker.yml/badge.svg)](https://github.com/dockhippie/minecraft-forge/actions/workflows/docker.yml) [![GitHub Repo](https://img.shields.io/badge/github-repo-yellowgreen)](https://github.com/dockhippie/minecraft-forge)

These are docker images for [Minecraft Forge][upstream] running on our
[Vanilla Minecraft image][parent].

## Versions

For the available versions please look at [Docker Hub][dockerhub] or
[Quay][quayio] or check the existing folders within the
[GitHub repository][github].

## Volumes

*  /var/lib/minecraft
*  /etc/minecraft/override

## Ports

*  25565
*  25575
*  8123

## Available environment variables

```console
MINECRAFT_DYNMAP_DIR = ${MINECRAFT_DATA_DIR}/dynmap
MINECRAFT_ENABLE_DYNMAP = ${SERVER_DYNMAP:-true}
MINECRAFT_MODS_DIR = ${MINECRAFT_GAME_DIR}/mods
MINECRAFT_OPTIONALS_DIR = ${MINECRAFT_GAME_DIR}/optionals
```

Extracted by the command: `grep -hE ': "\$\{(.*)\}"' latest/overlay/etc/entrypoint.d/*.sh | sed 's/: "\${//' | sed 's/:="/ = /' | sed 's/"}"$//' | sort | uniq`

## Inherited environment variables

*  [webhippie/minecraft-vanilla](https://github.com/dockhippie/minecraft-vanilla#available-environment-variables)
*  [webhippie/temurin](https://github.com/dockhippie/temurin#available-environment-variables)
*  [webhippie/ubuntu](https://github.com/dockhippie/ubuntu#available-environment-variables)

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

[upstream]: https://minecraft.net
[parent]: https://github.com/dockhippie/minecraft-vanilla
[dockerhub]: https://hub.docker.com/r/webhippie/minecraft-forge/tags
[quayio]: https://quay.io/repository/webhippie/minecraft-forge?tab=tags
[github]: https://github.com/dockhippie/minecraft-forge
