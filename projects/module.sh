#!/usr/bin/env bash

export DRUPAL_PROJECT_DIR=$DRUPAL_MODULES_DIR

function drupal_project_init() {
    echo -e "\nEnable and download project dependencies"
    echo -e "----------------------------------------\n"
    drush en $CONFIG_DRUPAL_PROJECT -y
    echo -e "\n"
}