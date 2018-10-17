# NPM Package Buildkite Plugin

**_Under Construction - none of the functionality described below works yet!_**

A Buildkite plugin to make it easy to build and publish NPM packages at SEEK.

- No BuildAgency config required
- Secure NPM and Github token usage

# Usage

```yaml
agent: &agent
  agents:
    queue: artefacts:npm

steps:
  - label: ':jest: Test'
    command: npm test
    <<: *agent
    plugins:
      seek-oss/npm-package#v0.1.0: ~

  - wait

  - label: ':rocket: Publish'
    branches: master
    command: npm publish
    <<: *agent
    plugins:
      seek-oss/npm-package#v0.1.0:
        publish: true
```
