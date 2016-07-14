#!/usr/bin/env bash

cd $DRUPAL_PROJECT_DIR/$CONFIG_DRUPAL_PROJECT

# Run DCR
echo -e "\nRun DCR"
echo -e "-------\n"
dcr init > /dev/null && dcr -v .
echo -e "\n"

cd $DCIR_ROOT