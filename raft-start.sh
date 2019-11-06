#!/bin/bash
set -u
set -e

#   --rpc                         Enable the HTTP-RPC server
#   --rpcaddr "127.0.0.1"         HTTP-RPC server listening interface
#   --rpcport "8545"              HTTP-RPC server listening port
#   --rpcapi "db,eth,net,web3"    API's offered over the HTTP-RPC interface (llibraries)
#   --rpccorsdomain               Domains from which to accept cross origin requests (browser enforced)

# The defaults for --rpcaddr, --rpcport and --rpcapi will allow the regis.nu webpage to connect to your local geth node. 
# You will however need to configure the --rpccorsdomain to allow your web browser to get access to your local Ethereum node.



#GLOBAL_ARGS=" --raft --rpc --rpcaddr 0.0.0.0 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum --emitcheckpoints"
GAS_FLAG="--gasPrice 0"
GLOBAL_ARGS=" --networkid=9354 --raft --rpc --rpcaddr 127.0.0.1 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,rpc,web3 --emitcheckpoints"

echo "[*] Starting Constellation nodes"
constellation-node tm1.conf 2>> qdata/logs/constellation1.log &
sleep 1
constellation-node tm2.conf 2>> qdata/logs/constellation2.log &
constellation-node tm3.conf 2>> qdata/logs/constellation3.log &
constellation-node tm4.conf 2>> qdata/logs/constellation4.log &
constellation-node tm5.conf 2>> qdata/logs/constellation5.log &

sleep 1

echo "[*] Starting node 1 - Bank 1"
geth --ipcpath qdata/dd1/geth.ipc --datadir qdata/dd1 $GLOBAL_ARGS --rpccorsdomain "*" --raftport 50401 --rpcport 22000 --port 21000 2>>qdata/logs/1.log &
# PRIVATE_CONFIG=tm1.conf nohup geth --datadir qdata/dd1 $GLOBAL_ARGS --raftport 50401 --rpcport 22000 --port 21000 2>>qdata/logs/1.log &

echo "[*] Starting node 2 - Bank 2"
geth --ipcpath qdata/dd2/geth.ipc --datadir qdata/dd2 $GLOBAL_ARGS --rpccorsdomain "*" --raftport 50402 --rpcport 22001 --port 21001 2>>qdata/logs/2.log &

echo "[*] Starting node 3 - Bank 3"
geth --ipcpath qdata/dd3/geth.ipc --datadir qdata/dd3 $GLOBAL_ARGS --rpccorsdomain "*" --raftport 50403 --rpcport 22002 --port 21002 2>>qdata/logs/3.log &

echo "[*] Starting node 4 - Regulator"
geth --ipcpath qdata/dd4/geth.ipc --datadir qdata/dd4 $GLOBAL_ARGS --rpccorsdomain "*" --raftport 50404 --rpcport 22003 --port 21003 2>>qdata/logs/4.log &

echo "[*] Starting node 5 - Observer"
geth --ipcpath qdata/dd5/geth.ipc --datadir qdata/dd5 $GLOBAL_ARGS --rpccorsdomain "*" --raftport 50405 --rpcport 22004 --port 21004 2>>qdata/logs/5.log &

echo "[*] Waiting for nodes to start"

sleep 10

echo "All nodes configured. See 'qdata/logs' for logs, and run e.g. 'geth attach ipc:qdata/dd1/geth.ipc' to attach to the node"
