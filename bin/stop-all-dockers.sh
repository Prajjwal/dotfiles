#!/bin/zsh

SCRIPT="
#!/bin/bash

sudo docker ps | tail -n +2 | awk '{print \$1}' | xargs -I{} sudo docker stop {}

sudo docker system prune --force

sudo docker ps -a
"

for server_id in $@
do
	ssh -t "srv$server_id.cb.lk" "$SCRIPT"
done
