#!/usr/bin/env bash

cd $DRUPAL_PROJECT_DIR/$CONFIG_DRUPAL_PROJECT

# Run DCR
echo -e "\nRun DCR"
echo -e "-------\n"
dcr init && dcr .
echo -e "\n"

cd -
