#!/usr/bin/env bash

# Run DCR
echo -e "\nRun DCR"
echo -e "-------\n"
dcr --quiet init && dcr -v --no-messages $DCIR_ROOT/$DRUPAL_PROJECT_DIR/$CONFIG_DRUPAL_PROJECT
echo -e "\n"