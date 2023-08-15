#!/bin/bash

ufw disable
cd /root/kroma-up
docker compose --profile validator down -v
cd /home/geth/eth-docker/
docker compose down -v
bash <(curl -s https://raw.githubusercontent.com/DOUBLE-TOP/tools/main/sepolia.sh)
sleep 180m
cd /root/kroma-up && docker compose --profile validator up -d
bash $HOME/kroma-up/sync_block.sh
sleep 30m
docker exec kroma-validator kroma-validator deposit --amount 800000000000000000