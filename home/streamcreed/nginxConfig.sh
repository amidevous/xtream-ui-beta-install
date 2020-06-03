# !/bin/bash

while true
do
        inotifywait --exclude .swp -e create -e modify -e delete -e move  /home/streamcreed/nginx/conf
        # Check NGINX Configuration Test
        # Only Reload NGINX If NGINX Configuration Test Pass
        /home/streamcreed/nginx/sbin/nginx -t
        if [ $? -eq 0 ]
        then
                echo "Reloading Nginx Configuration"
                /home/streamcreed/nginx/sbin/nginx -s reload
        fi
done