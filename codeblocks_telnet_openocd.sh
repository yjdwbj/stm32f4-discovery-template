#!/usr/bin/expect
spawn telnet localhost 4444
set prompt ">"
set hexf [lindex $argv 0];
interact -o -nobuffer -re $prompt return
send "reset halt\r"
interact -o -nobuffer -re $prompt return
send "flash write_image erase unlock $hexf\r"
interact -o -nobuffer -re $prompt return
send "reset run\r"
interact -o -nobuffer -re $prompt return
send "exit\r"
interact

