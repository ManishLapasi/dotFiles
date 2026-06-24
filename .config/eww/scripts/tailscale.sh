#!/usr/bin/env bash
state="$(tailscale status --json 2>/dev/null | jq -r '.BackendState' 2>/dev/null)"

if [ "$state" = "Running" ]; then
    sudo tailscale down
else
    sudo tailscale up
fi
