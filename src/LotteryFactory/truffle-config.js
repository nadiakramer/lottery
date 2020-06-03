const HDWalletProvider = require("truffle-hdwallet-provider");

require('dotenv').config();  // Store environment-specific variable from '.env' to .env

module.exports = {
  networks: {
    development: {
      host: 'localhost',
      port: 8545,
      network_id: '*' // Match any network id
    },
    // testnets
    // properties
    // network_id: identifier for network based on ethereum blockchain. Find out more at https://github.com/ethereumbook/ethereumbook/issues/110
    // gas: gas limit
    // gasPrice: gas price in gwei

    kovan: {
      provider: () => new HDWalletProvider("alien multiply hybrid cluster muffin walk winter click priority mosquito horror foster", "https://kovan.infura.io/v3/df157aae02e340daa241228ec95181c6"),
      network_id: 42,
      gas: 3000000,
      gasPrice: 10000000000
    },

    ropsten: {
      provider: () => new HDWalletProvider("alien multiply hybrid cluster muffin walk winter click priority mosquito horror foster", "https://ropsten.infura.io/v3/" + process.env.INFURA_API_KEY),
      network_id: 3,
      gas: 3000000,
      gasPrice: 10000000000
    },

    // main ethereum network(mainnet)
    // main: {
    //   provider: () => new HDWalletProvider(process.env.MNENOMIC, "https://mainnet.infura.io/v3/" + process.env.INFURA_API_KEY),
    //   network_id: 1,
    //   gas: 3000000,
    //   gasPrice: 10000000000
    // }
  }
}
