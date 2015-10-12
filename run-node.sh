#!/bin/bash

bitcoind -daemon 2> >(tee) | grep ^rpc > ~/.bitcoin/bitcoin.conf; bitcoind