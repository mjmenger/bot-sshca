#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

nohup bash -c "run_keybase -g &"
sleep 3
keybase oneshot --username $KEYBASE_USERNAME --paperkey "$PAPERKEY"
bin/keybaseca -c tests/simple/keybaseca.config generate --overwrite-existing-key
bin/keybaseca -c tests/simple/keybaseca.config service