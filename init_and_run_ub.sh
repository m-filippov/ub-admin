#!/usr/bin/bash

set -e

PROJECT_DIR="/usr/lib/app"
UB_ARGUMENTS="-u admin -p admin -host http://localhost:8881"

mkdir - $PROJECT_DIR/logs

npm i

npx ubcli createStore

npx ubcli initDB $UB_ARGUMENTS -drop -create

npx ubcli generateDDL $UB_ARGUMENTS -autorun

npx ubcli initialize $UB_ARGUMENTS

exec /usr/bin/ub -console-log
