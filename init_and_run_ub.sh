#!/usr/bin/bash

set -e

PROJECT_DIR="/usr/lib/app"
UB_ARGUMENTS="-u admin -p admin -host http://localhost:80"

function check_logs() {
  if [ ! -d "$PROJECT_DIR/logs" ]; then
    echo "Creating log directory..."
    mkdir -p $PROJECT_DIR/logs
  fi
}
npm i

npx ubcli createStore

npx ubcli initDB $UB_ARGUMENTS -drop -create

npx ubcli generateDDL $UB_ARGUMENTS -autorun

npx ubcli initialize $UB_ARGUMENTS

exec /usr/bin/ub -console-log
