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