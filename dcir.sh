#!/usr/bin/env bash

set -e

### Path resolving from drush/drush:drush

# Get the absolute path of this executable
SELF_DIRNAME=$(dirname -- $0)
SELF_PATH=$(cd -P -- "$SELF_DIRNAME" && pwd -P)/$(basename -- $0)

# Resolve symlinks - this is the equivalent of "readlink -f", but also works with non-standard OS X readlink.
while [ -h "$SELF_PATH" ]; do
    # 1) cd to directory of the symlink
    # 2) cd to the directory of where the symlink points
    # 3) Get the pwd
    # 4) Append the basename
    DIR=$(dirname -- "$SELF_PATH")
    SYM=$(readlink "$SELF_PATH")
    SYM_DIRNAME=$(dirname -- "$SYM")
    SELF_PATH=$(cd "$DIR" && cd "$SYM_DIRNAME" && pwd -P)/$(basename -- "$SYM")
done

# Build the path to our script dir.
export DCIR_SCRIPT_DIR=$(dirname "$SELF_PATH")

# Ensure YAML configuration file exists.
# @TODO - Discover project type and configuration. 
CONFIG_FILE="/module/.dcir.yml"
if [ ! -f $CONFIG_FILE ]; then
  echo "Error: .dcir.yml file not found." 1>&2
  exit 1
fi

# Parse YAML configuration file.
. $DCIR_SCRIPT_DIR/utility/parse_yaml.sh
eval $(parse_yaml $CONFIG_FILE)

# Run Drush webserver.
drush runserver "http://127.0.0.1:8080" > /dev/null 2>&1 &

# Run simpletests.
php core/scripts/run-tests.sh --php /opt/phpenv/shims/php --verbose --color --concurrency 4 --url http://127.0.0.1:8080 "$simpletest_group"