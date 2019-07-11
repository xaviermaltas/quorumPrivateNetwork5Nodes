// const HDWalletProvider = require('truffle-hdwallet-provider');
// const mnemonic = "final pepper crane boy wolf odor subject alcohol seminar margin occur forest";

module.exports = {
  networks: {
    development: {      
      host: 'localhost',
      port: 7545,
      network_id: '*',
      gas: 5000000
    },

    ganacheTerminal: {
      host: 'localhost',
      port: 8545,
      network_id: '*',
      gas: 5000000
    },

    quorumNet: {
      host: "localhost",
      port: 22000, // was 8545
      network_id: 9354, // Match any network id
      gasPrice: 0x0,
      gas: 0xfffff,
      type: "quorum" // needed for Truffle to support Quorum
    },

	quorumNetBis: {
		host: "localhost",
		port: 22000, // was 8545
		network_id: 9354, // Match any network id
		gasPrice: 0x0,
		gas: 0xfffff
	}

    // "truffle-hdwallet-provider": "0.0.6",
    // localPrivateNet :{
    //   provider: () => new HDWalletProvider(mnemonic, "" target="_blank" onclick="return openUrl(this.href)">http://127.0.0.1:8545"),
    //   network_id:"*"
    // }

  },

  compilers: {
    solc: {
      version: "0.4.24",
      optimizer:{
        enabled: true,
        runs: 200
      }
    }
  }
}
