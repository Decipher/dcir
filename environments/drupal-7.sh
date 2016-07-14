#!/usr/bin/env bash

export DRUPAL_MODULES_DIR="sites/all/modules"
export DRUPAL_PROFILES_DIR="profiles"
export SIMPLETEST_SCRIPT="scripts/run-tests.sh"

function environment_discovery() {
    if [ -f "/dcir/${CONFIG_DRUPAL_PROJECT}.module" ]; then
        CONFIG_DRUPAL_PROJECT_TYPE="module"
    elif [ -f "/dcir/${CONFIG_DRUPAL_PROJECT}.profile" ]; then
        CONFIG_DRUPAL_PROJECT_TYPE="profile"
    fi
}

function simpletest_discovery() {
    FILES=$(grep '^files\[\].*\.test$' < "$DRUPAL_PROJECT_DIR/$CONFIG_DRUPAL_PROJECT/$CONFIG_DRUPAL_PROJECT.info" | grep -o '[a-z_\-\/\.]*.test$')
    if [ ! -z "${FILES[0]}" ]; then
        SIMPLETEST_RUN=true
        SIMPLETEST_ARGS="--file "
        for FILE in ${FILES[0]}; do
            SIMPLETEST_ARGS="$SIMPLETEST_ARGS$DRUPAL_PROJECT_DIR/$CONFIG_DRUPAL_PROJECT/$FILE,"
        done
        SIMPLETEST_ARGS=${SIMPLETEST_ARGS::-1}
    fi
}