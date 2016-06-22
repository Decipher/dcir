#!/usr/bin/env bash

# Run Code review.
echo -e "\nRun PHP Code sniffer"
echo -e "--------------------\n"
phpcs -v --standard=Drupal --colors --extensions=php,module,inc,install,test,profile,theme,js,css,info,txt,md $DRUPAL_PROJECT_DIR/$CONFIG_DRUPAL_PROJECT
echo -e "\n"