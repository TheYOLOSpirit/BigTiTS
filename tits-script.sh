#!/bin/sh
echo "Cron job started at $(date)"
cd /app
pwd
#yesterday=$(node -e "const d = new Date(); d.setDate(d.getDate() - 1); console.log(d.toISOString().slice(0, 10));")
#echo "Yesterday was: $yesterday"
tits sync -d yesterday
