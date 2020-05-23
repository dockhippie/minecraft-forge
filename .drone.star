def main(ctx):
  config = {
    'title': 'Minecraft Forge',
    'image': ctx.repo.name,
    'arches': [
      'amd64',
      'arm64v8',
    ],
    'versions': [
      {
        'path': 'latest',
        'tag': 'latest',
      },
      {
        'path': 'v31.0',
        'tag': '31.0',
      },
      {
        'path': 'v30.0',
        'tag': '30.0',
      },
      {
        'path': 'v29.0',
        'tag': '29.0',
      },
      {
        'path': 'v28.1',
        'tag': '28.1',
      },
      {
        'path': 'v28.0',
        'tag': '28.0',
      },
      {
        'path': 'v27.0',
        'tag': '27.0',
      },
      {
        'path': 'v26.0',
        'tag': '26.0',
      },
      {
        'path': 'v25.0',
        'tag': '25.0',
      },
      {
        'path': 'v14.23.5',
        'tag': '14.23.5',
      },
      {
        'path': 'v14.23.4',
        'tag': '14.23.4',
      },
      {
        'path': 'v14.23.3',
        'tag': '14.23.3',
      },
      {
        'path': 'v14.23.2',
        'tag': '14.23.2',
      },
      {
        'path': 'v14.23.1',
        'tag': '14.23.1',
      },
      {
        'path': 'v14.23.0',
        'tag': '14.23.0',
      },
      {
        'path': 'v14.22.1',
        'tag': '14.22.1',
      },
      {
        'path': 'v14.22.0',
        'tag': '14.22.0',
      },
      {
        'path': 'v14.21.1',
        'tag': '14.21.1',
      },
      {
        'path': 'v14.21.0',
        'tag': '14.21.0',
      },
      {
        'path': 'v13.20.1',
        'tag': '13.20.1',
      },
      {
        'path': 'v13.20.0',
        'tag': '13.20.0',
      },
      {
        'path': 'v13.19.1',
        'tag': '13.19.1',
      },
      {
        'path': 'v13.19.0',
        'tag': '13.19.0',
      },
      {
        'path': 'v12.18.3',
        'tag': '12.18.3',
      },
      {
        'path': 'v12.18.2',
        'tag': '12.18.2',
      },
      {
        'path': 'v12.18.1',
        'tag': '12.18.1',
      },
      {
        'path': 'v12.18.0',
        'tag': '12.18.0',
      },
      {
        'path': 'v12.17.0',
        'tag': '12.17.0',
      },
      {
        'path': 'v12.16.1',
        'tag': '12.16.1',
      },
      {
        'path': 'v12.16.0',
        'tag': '12.16.0',
      },
      {
        'path': 'v11.15.1',
        'tag': '11.15.1',
      },
      {
        'path': 'v11.15.0',
        'tag': '11.15.0',
      },
      {
        'path': 'v11.14.4',
        'tag': '11.14.4',
      },
      {
        'path': 'v11.14.3',
        'tag': '11.14.3',
      },
      {
        'path': 'v11.14.2',
        'tag': '11.14.2',
      },
      {
        'path': 'v11.14.1',
        'tag': '11.14.1',
      },
      {
        'path': 'v11.14.0',
        'tag': '11.14.0',
      },
      {
        'path': 'v10.13.4',
        'tag': '10.13.4',
      },
      {
        'path': 'v10.13.3',
        'tag': '10.13.3',
      },
      {
        'path': 'v10.13.2',
        'tag': '10.13.2',
      },
      {
        'path': 'v10.13.1',
        'tag': '10.13.1',
      },
    ],
    'trigger': [],
  }

  builds = docker(config)

  after = [
    readme(config),
    badges(config),
    trigger(config),
  ]

  for b in builds:
    for a in after:
      a['depends_on'].append(b['name'])

  return builds + after

def docker(config):
  result = []

  for version in config['versions']:
    versions = []

    for arch in config['arches']:

      if arch == "amd64":
        agent = "amd64"

      if arch == "arm32v6":
        agent = "arm"

      if arch == "arm32v7":
        agent = "arm"

      if arch == "arm64v8":
        agent = "arm64"

      versions.append({
        'kind': 'pipeline',
        'type': 'docker',
        'name': '%s-%s' % (arch, version['path']),
        'platform': {
          'os': 'linux',
          'arch': agent,
        },
        'steps': [
          {
            'name': 'dryrun',
            'image': 'plugins/docker:latest',
            'pull': 'always',
            'settings': {
              'dry_run': True,
              'dockerfile': '%s/Dockerfile.%s' % (version['path'], arch),
              'tags': '%s-%s' % (version['tag'], arch),
              'repo': 'webhippie/%s' % (config['image']),
              'context': version['path'],
            },
            'when': {
              'ref': {
                'include': [
                  'refs/pull/**',
                ],
              },
            },
          },
          {
            'name': 'publish',
            'image': 'plugins/docker:latest',
            'pull': 'always',
            'settings': {
              'username': {
                'from_secret': 'docker_username',
              },
              'password': {
                'from_secret': 'docker_password',
              },
              'dockerfile': '%s/Dockerfile.%s' % (version['path'], arch),
              'tags': '%s-%s' % (version['tag'], arch),
              'repo': 'webhippie/%s' % (config['image']),
              'context': version['path'],
            },
            'when': {
              'ref': {
                'exclude': [
                  'refs/pull/**',
                ],
              },
            },
          },
        ],
        'depends_on': [],
        'trigger': {
          'ref': [
            'refs/heads/master',
            'refs/pull/**',
          ],
        },
      })

    manifest = {
      'kind': 'pipeline',
      'type': 'docker',
      'name': 'manifest-%s' % (version['path']),
      'platform': {
        'os': 'linux',
        'arch': 'amd64',
      },
      'steps': [
        {
          'name': 'execute',
          'image': 'plugins/manifest:latest',
          'pull': 'always',
          'settings': {
            'username': {
              'from_secret': 'docker_username',
            },
            'password': {
              'from_secret': 'docker_password',
            },
            'ignore_missing': True,
            'spec': '%s/manifest.tmpl' % (version['path']),
          },
        },
      ],
      'depends_on': [],
      'trigger': {
        'ref': [
          'refs/heads/master',
        ],
      },
    }

    for version in versions:
      manifest['depends_on'].append(version['name'])

    result.extend(versions)
    result.append(manifest)

  return result

def readme(config):
  return {
    'kind': 'pipeline',
    'type': 'docker',
    'name': 'readme',
    'platform': {
      'os': 'linux',
      'arch': 'amd64',
    },
    'steps': [
      {
        'name': 'execute',
        'image': 'sheogorath/readme-to-dockerhub:latest',
        'pull': 'always',
        'environment': {
          'DOCKERHUB_USERNAME': {
            'from_secret': 'docker_username',
          },
          'DOCKERHUB_PASSWORD': {
            'from_secret': 'docker_password',
          },
          'DOCKERHUB_REPO_PREFIX': 'webhippie',
          'DOCKERHUB_REPO_NAME': config['image'],
          'SHORT_DESCRIPTION': 'Docker images for %s' % (config['title']),
          'README_PATH': 'README.md',
        },
      },
    ],
    'depends_on': [],
    'trigger': {
      'ref': [
        'refs/heads/master',
      ],
    },
  }

def badges(config):
  return {
    'kind': 'pipeline',
    'type': 'docker',
    'name': 'badges',
    'platform': {
      'os': 'linux',
      'arch': 'amd64',
    },
    'clone': {
      'disable': True,
    },
    'steps': [
      {
        'name': 'execute',
        'image': 'plugins/webhook:latest',
        'pull': 'always',
        'settings': {
          'urls': {
            'from_secret': 'microbadger_url',
          },
        },
      },
    ],
    'depends_on': [
      'readme',
    ],
    'trigger': {
      'ref': [
        'refs/heads/master',
      ],
    },
  }

def trigger(config):
  return {
    'kind': 'pipeline',
    'type': 'docker',
    'name': 'trigger',
    'platform': {
      'os': 'linux',
      'arch': 'amd64',
    },
    'clone': {
      'disable': True,
    },
    'steps': [
      {
        'name': 'execute',
        'image': 'plugins/downstream:latest',
        'pull': 'always',
        'failure': 'ignore',
        'settings': {
          'server': 'https://cloud.drone.io',
          'token': {
            'from_secret': 'downstream_token',
          },
          'repositories': config['trigger'],
        },
      },
    ],
    'depends_on': [
      'badges',
    ],
    'trigger': {
      'ref': [
        'refs/heads/master',
      ],
    },
  }
