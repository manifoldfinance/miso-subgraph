require('@typechain/hardhat')

require("@nomiclabs/hardhat-ethers");

require('hardhat-abi-exporter');

module.exports = {

  solidity: {
    version: '0.6.12',
    settings: {
      metadata: {
        bytecodeHash: 'none',
      },
      optimizer: {
        enabled: false,
        runs: 200,
        details: {
          yul: false,
        },
      },
    },
 },
 abiExporter: {
  path: './abi',
  clear: true,
  flat: true,
  only: [':ERC20$'],
  spacing: 2,
  pretty: false,
   },
   typechain: {
    outDir: 'typechain',
    target: 'ethers-v5',
    alwaysGenerateOverloads: false // should overloads with full signatures like deposit(uint256) be generated always, even if there are no overloads?
  },
};
