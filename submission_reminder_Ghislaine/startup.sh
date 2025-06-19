#!/bin/bash
cd "$(dirname "$0")"
source ./config/config.env
source ./modules/functions.sh
bash ./app/reminder.sh
