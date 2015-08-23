#!/bin/bash

echo "[info] Starting Flexget daemon..."

# run deluge daemon
/usr/bin/flexget -c /config/flexget.yml daemon start