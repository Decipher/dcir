#!/usr/bin/env bash

# Run simpletests.
php $SIMPLETEST_SCRIPT --php /opt/phpenv/shims/php --verbose --color --concurrency 4 --url http://127.0.0.1:8080  --module $CONFIG_DRUPAL_PROJECT