#!/bin/bash
echo ""
echo "enter username"
read uname
echo "failed ${uname} details"
cat /var/log/auth.log | grep ${uname} | grep Failed
#cat /etc/passwd | grep ${uname} | awk {print $3}
accept=$(cat /var/log/auth.log | grep "Accept" | wc -l)
failed=$(cat /var/log/auth.log | grep "failed" | wc -l)
echo "--------------------------------------------"
echo "     Total User Access Report        "
echo "--------------------------------------------"
echo "Successful logins attempt: $accept"
echo "Failed logins attempt: $failed"
echo "--------------------------------------------"
