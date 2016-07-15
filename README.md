# Drupal common CI Runner

Drupal common CI Runner (DCIR) is a Docker based tool for executing
automated testing of Drupal modules on common CI providers as well
as locally. 



## Running DCIR locally

### Requirement(s):

- [Docker](https://www.docker.com/)

### Steps:

Run the following command from the module directory you wish to test:

```
docker run --rm -it -v $(pwd):/dcir deciphered/dcir:latest
```


## Running DCIR via Continuous Integration (CI)

Each CI runner has it's own configuration format, simply place the
relevant file below into your project:


### CircleCI

**circle.yml**
```
machine:
  services:
    - docker

test:
  override:
    - docker run --rm -v $(pwd):/dcir -it deciphered/dcir:latest

```


### Travis CI

**.travis.yml**
```
sudo: required

language: php

services:
  - docker

script:
  - docker run -v $(pwd):/dcir -it deciphered/dcir-5.6:develop
```


## Advanced configuration

DCIR doesn't requires zero configuration out of the box, it uses
auto-magic detection to determine the relevant configuration for the
project.

In the case the discovery this doesn't work as required, a configuration
file can be added to the project.

**.dcir.yml**
```
drupal:
  # The Drupal core version: 7, 8 (default).
  #core: 8

  # The Drupal project being tested.
  project: "PROJECT_MACHINE_NAME"

  # The Drupal project type; module (default).
  #project_type: "module"

# The simpletest group to be run.
simpletest:
  group: "SIMPLETEST_GROUP_NAME"
```

Note: Be sure to replace the relevant placeholders and uncomment out the
      configuration as required. 