#!/bin/bash

function downloadUnzipMove {
  echo "* Processing blocklist '$1'..."
  if wget -O "/home/davidosomething/tmp/$1.gz" "http://list.iblocklist.com/?list=bt_$1&fileformat=p2p&archiveformat=gz" >/dev/null 2>&1; then
    gunzip "/home/davidosomething/tmp/$1.gz"
    mv "/home/davidosomething/tmp/$1" "/home/davidosomething/.config/transmission-daemon/blocklists/$1.txt"
  fi
  echo "  DONE"
}

downloadUnzipMove level1
downloadUnzipMove dshield
downloadUnzipMove spyware
downloadUnzipMove hijacked

# restart transmission-daemon (only way to reload blocklists)
echo Restarting transmission-daemon to reload blocklists
/etc/rc.d/transmissiond restart
