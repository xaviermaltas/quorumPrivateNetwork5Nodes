# quorumPrivateNetwork5Nodes



### Instructions for setting up a Quorum 5 nodes network

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
