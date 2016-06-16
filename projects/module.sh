#!/usr/bin/env bash

export DRUPAL_PROJECT_DIR=$DRUPAL_MODULES_DIR

function drupal_project_init() {
    echo -e "\nEnable and download project dependencies"
    echo -e "----------------------------------------\n"
    drush en $drupal_project -y
    echo -e "\n"
}