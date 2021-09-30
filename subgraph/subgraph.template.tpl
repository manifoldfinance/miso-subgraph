specVersion: 0.0.2
description: ERC20 Subgraph for Tokens launched via SushiSwap Miso
repository: https://github.com/manifoldfinance/miso-subgraph
schema:
  file: ./schema.graphql
dataSources:
  - name: ERC20
    kind: ethereum/contract
    network: {{network}}
    source:
      address: '{{address}}'
      abi: Token
      startBlock: {{block}}
    mapping:
      kind: ethereum/events
      apiVersion: 0.0.5
      language: wasm/assemblyscript
      file: ./src/mappings/events.ts
      entities:
        - User
        - Asset
        - ERC20Contract
      abis:
        - name: Token
          file: ./abis/token.json
      eventHandlers:
        - event: Approval(indexed address,indexed address,uint256)
          handler: handleApproval
        - event: Transfer(indexed address,indexed address,uint256)
          handler: handleTransfer