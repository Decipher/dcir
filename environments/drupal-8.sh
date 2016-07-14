#!/usr/bin/env bash

export DRUPAL_MODULES_DIR="modules"
export DRUPAL_PROFILES_DIR="profiles"
export SIMPLETEST_SCRIPT="core/scripts/run-tests.sh"

function environment_discovery() {
    . $DCIR_SCRIPT_DIR/utility/parse_yaml.sh
    eval $(parse_yaml ${FILES[0]} dcir_info_)
    CONFIG_DRUPAL_PROJECT_TYPE=$DCIR_INFO_TYPE
}

function simpletest_discovery() {
    if [ -d "$DRUPAL_PROJECT_DIR/$CONFIG_DRUPAL_PROJECT/src/Tests" ]; then
        SIMPLETEST_RUN=true
        SIMPLETEST_ARGS="--module $CONFIG_DRUPAL_PROJECT"
    fi
}