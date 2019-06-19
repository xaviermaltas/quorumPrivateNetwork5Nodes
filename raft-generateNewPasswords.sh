#!/bin/bash
set -u
set -e

echo "[*] Cleaning up temporary data directories"
# rm -rf qdata
rm -rf  keys
# mkdir -p qdata/logs

N=$1

for (( c=1; c<=$N; c++ ))
do

    echo "[*] Configuring node $c"

    # Create directory
    mkdir -p keys/node$c

    # Init account [GETH] 
    mkdir -p keys/node$c/geth
    geth --datadir keys/node$c/geth account new
    DIR=$(pwd)
    # cp -r $DIR/qdata/dd$c/keystore $DIR/testKeys/node$c/geth/keystore

    # Generate Raft Account [RAFT] -> This must go to the Geth folder as nodekey
    mkdir -p keys/node$c/raft
    bootnode --genkey=keys/node$c/raft/nodekey
    bootnode --nodekey=keys/node$c/raft/nodekey --writeaddress
    # DIR=$(pwd)
    # cp -r $DIR/testKeys/node$c/raft/nodekey qdata/dd$c/geth

    # Generate Consellation Keys [CONSTELLATION]
    mkdir -p keys/node$c/constellation
    constellation-node --generatekeys=keys/node$c/constellation/node$c
    # DIR=$(pwd)
    # cp -r $DIR/testKeys/node$c/constellation $DIR/qdata/node$c/

done