#!/bin/bash
config="/root/.bitcoin/bitcoin.conf"
if [ -f "$config" ]
then
	bitcoind
else
	bitcoind -daemon 2> >(tee) | grep ^rpc > "$config"
	echo server 1
	bitcoind
fi