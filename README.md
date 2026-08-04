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

Generally we are following [conventional commits][commits] when we apply
changes. That way we are able to generate proper changelogs for every release.
Please use always pull requests to integrate new functionalities or to fix
issues.

For the release process we are following [semantic versioning][semver] which
clearly indicates if a new version just resolves bugs, includes new features or
even includes breaking changes.

After installing the tools via `mise install` as described above set up the
pre-commit hooks so they run automatically on every commit:

```console
pre-commit install --hook-type pre-commit --hook-type commit-msg
```

> `pre-commit` is managed by mise and will be available after `mise install`.

If you have changed something on the source you should simply commit following
the mentioned conventions:

```console
git checkout -b feat/new-feature
git add --all
git commit -m 'feat: added awesome new feature'
git push --set-upstream origin feat/new-feature
```

After pushing your changes into the Git repository you should create a pull
request on GitHub. If the pull request have been merged and everything built
fine it will also create automatically a new release at least once a week.

## Authors

*  [Thomas Boerger](https://github.com/tboerger)

## License

MIT

## Copyright

```console
Copyright (c) 2015 Thomas Boerger <http://www.webhippie.de>
```
[mise]: https://mise.jdx.dev/
[mise-install]: https://mise.jdx.dev/getting-started.html
[commits]: https://www.conventionalcommits.org/en/v1.0.0/
[semver]: https://semver.org/
[upstream]: https://minecraft.net
[parent]: https://github.com/dockhippie/minecraft-vanilla
[dockerhub]: https://hub.docker.com/r/webhippie/minecraft-forge/tags
[quayio]: https://quay.io/repository/webhippie/minecraft-forge?tab=tags
[github]: https://github.com/dockhippie/minecraft-forge
