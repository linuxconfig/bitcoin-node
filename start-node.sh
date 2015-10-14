#!/bin/bash
config="/root/.bitcoin/bitcoin.conf"
if [ -f "$config" ]
then
	bitcoind
else
	bitcoind -daemon 2> >(tee) | grep ^rpc > "$config"
	echo 'server=1' >> "$config"
	echo 'rpcallowip=0.0.0.0/0' >> "$config"
	bitcoind
fi
