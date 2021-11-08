#!/bin/sh
export COIN=EVMOS
export ETHEREUM_JSONRPC_VARIANT=geth
export ETHEREUM_JSONRPC_HTTP_URL=${HTTP_URL:-http://host.docker.internal:8545/}
export ETHEREUM_JSONRPC_WS_URL=${WS_URL:-ws://host.docker.internal:8546/}
export NETWORK=Testnet
make start
