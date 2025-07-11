#!/usr/bin/env bash

STATUS_KEY="BackendState"
RUNNING="Running"

tailscale_status() {
    status="$(tailscale status --json 2>/dev/null | jq -r --arg key "$STATUS_KEY" '.[$key]')"
    if [[ "$status" == "$RUNNING" ]]; then
        return 0
    fi
    return 1
}

toggle_status() {
    if tailscale_status; then
        echo "down"
        tailscale down
    else
        echo "up"
        tailscale up
    fi
    sleep 2
}

case "$1" in
    --status)
        if tailscale_status; then
            T=${2:-"green"}
            F=${3:-"red"}

            peers=$(tailscale status --json | jq -r --arg T "$T" --arg F "$F" \
                '.Peer[] | "<span color=" + (if .Online then $T else $F end) + ">" + (.DNSName | split(".")[0]) + "</span>"' \
                | tr '\n' '\r')

            exitnode=$(tailscale status --json | jq -r \
                '.Peer[] | select(.ExitNode == true).DNSName | split(".")[0]' 2>/dev/null)

            echo "{\"text\":\"${exitnode:-TS}\",\"class\":\"connected\",\"alt\":\"connected\", \"tooltip\": \"${peers}\"}"
        else
            echo "{\"text\":\"\",\"class\":\"stopped\",\"alt\":\"stopped\", \"tooltip\": \"The VPN is not active.\"}"
        fi
        ;;
    --toggle)
        toggle_status
        ;;
    *)
        echo "Usage: $0 --status [onlineColor offlineColor] | --toggle"
        exit 1
        ;;
esac
