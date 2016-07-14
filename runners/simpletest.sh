#!/usr/bin/env bash

# Configure simpletest runner.
if [ -z "$CONFIG_SIMPLETEST_GROUP" ]; then
    simpletest_discovery
else
    SIMPLETEST_RUN=true
    SIMPLETEST_ARGS=$CONFIG_SIMPLETEST_GROUP
fi

# Run simpletests.
if [ "${SIMPLETEST_RUN:-false}" = true ]; then
    echo "php $SIMPLETEST_SCRIPT --php /opt/phpenv/shims/php --verbose --color --concurrency 4 --url http://127.0.0.1:8080 $SIMPLETEST_ARGS"
    php $SIMPLETEST_SCRIPT --php /opt/phpenv/shims/php --verbose --color --concurrency 4 --url http://127.0.0.1:8080 $SIMPLETEST_ARGS
else
    echo -e "\nDrupal test run"
    echo -e "---------------\n"
    echo "No tests to run"
fi
echo -e "\n"