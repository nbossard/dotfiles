#!/bin/bash
/opt/homebrew/bin/terminal-notifier \
    -title "CPU Alert - Monit" \
    -subtitle "$MONIT_SERVICE" \
    -message "$MONIT_DESCRIPTION" \
    -sound default
