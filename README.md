# NPM Package Buildkite Plugin

**_Under Construction - none of the functionality described below works yet!_**

A Buildkite plugin to make it easy to build and publish NPM packages at SEEK.

- No BuildAgency config required
- Secure NPM and Github token usage

## Usage

Ask for help with any of these steps on the #npm channel.

1. Get your repository added to the Buildkite agent config.
2. Add `seek-jobs-ci` as a collaborator to your repo. Make sure the invite is accepted!
3. Add this pipeline to `.buildkite/pipeline.yml`:

```yaml
agent: &agent
  agents:
    queue: artefacts:npm

steps:
  - label: ':jest: Test'
    command:
      - npm ci
      - npm test
    <<: *agent
    plugins:
      seek-oss/npm-package#v0.1.0: ~

  - wait

  - label: ':rocket: Publish'
    branches: master
    command:
      - npm ci
      - npm publish
    <<: *agent
    plugins:
      seek-oss/npm-package#v0.1.0:
        publish: true
```

## Configuration

### `publish` (optional)

Configure write privileges for this step. If omitted read-only credentials are configured.

### `image` (optional)

The Docker image that commands run in. Defaults to `node:10`.
