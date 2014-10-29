#!/bin/bash

sudo apt-get install \
varnish

wait

sudo cp /etc/default/varnish /etc/default/varnish.old
wait
sudo sed -i '/S \/etc\/varnish\/secret \\/d' /etc/default/varnish
wait
sudo service varnish restart

echo "Script finished."
