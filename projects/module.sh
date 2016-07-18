#!/usr/bin/env bash

export DRUPAL_PROJECT_DIR=$DRUPAL_MODULES_DIR

function drupal_project_init() {
    if [ "${DRUPAL_DEPENDENCIES:-true}" = true ]; then
        echo
        echo "Enable and download project dependencies"
        echo "----------------------------------------"
        echo
        drush en $CONFIG_DRUPAL_PROJECT -y
        echo
    fi
}