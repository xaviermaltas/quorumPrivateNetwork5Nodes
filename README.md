# Quorum Private Network with 5 Nodes


## Instructions for setting up a Quorum 5 nodes network

>Requirments -> Ubuntu 16.04

__Terminal 1__(Bank)

0 - First execution ever -> Installation of Constellation, Go and Quorum

```
git clone https://github.com/bacen/quorum-examples
cd quorum-examples
cd examples
cd 5nodesRTGS
sudo ./bootstrap.sh
```

1 - Execution

```
./raft-init.sh -> Initialize accounts and keystores
./raft-start.sh -> Bring up the nodes
```


2 - Connect to the nodes

```
geth attach ipc:qdata/dd1/geth.ipc	
```


__Terminal 2__ (Bank)

2 - Connect to the nodes

```
geth attach ipc:qdata/dd2/geth.ipc
```



__Terminal 3__ (Bank)

2 - Connect to the nodes

```
geth attach ipc:qdata/dd3/geth.ipc
```



__Terminal 4__ (Regulator)

2 - Connect to the nodes

```
geth attach ipc:qdata/dd4/geth.ipc
```


__Terminal 5__ (Observer)

2 - Connect to the nodes

```
geth attach ipc:qdata/dd5/geth.ipc
```


## The election Project Deployment

After ```geth attach ipc:qdata/dd1/geth.ipc``` at __Terminal 1__. Truffle project deployment with the instruction ```truffle migrate --reset --compile-all --network quorumNet```. Firstly, check if the network ```quorumNet``` appears at ```the-election/truffle-config.js``` with the following values : 

```
quorumNet: {
    host: "localhost",
    port: 22001, // was 8545
    network_id: 9354, // Match any network id
    gasPrice: 0x0,
    gas: 0xfffff,
    type: "quorum" // needed for Truffle to support Quorum
}
```
