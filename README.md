# BhupatiToken Smart Contract

**BhupatiToken** is an ERC20-compliant token smart contract written in Solidity. It allows users to create, transfer, and burn (destroy) tokens following the ERC20 standard. This contract has been successfully deployed and tested on a local Ethereum network using Remix.

## Token Details

- Token Name: Bhupati
- Token Symbol: BHU
- Decimals: 18

## Getting Started

To get started with the BhupatiToken contract and interact with it on a local development environment, follow these steps:

1. **Prerequisites**:
   - Ensure you have an Ethereum development environment set up on your machine. If not, you can use tools like Remix, Ganache, or Hardhat to create a local Ethereum network.
   - Install the required dependencies, including the OpenZeppelin contracts library, by running:
     ```
     npm install @openzeppelin/contracts
     ```

2. **Deploy the Contract**:
   - Copy the contract code provided above (`BhupatiToken.sol`) and paste it into a new file named `BhupatiToken.sol` in your local Ethereum project.
   - Compile the contract using Remix or your preferred development environment to generate the contract's bytecode and ABI.

3. **Deploy on Local Network**:
   - Deploy the compiled BhupatiToken contract on your local Ethereum network. If you are using Remix, you can deploy it directly from the "Deploy & Run Transactions" tab, selecting the appropriate environment (Injected Web3 or Web3 Provider) and your preferred account.

4. **Testing the Contract**:
   - Once the contract is deployed, you can test its functionality using Remix or by interacting with it programmatically using web3.js or ethers.js libraries.

## Interacting with the Contract

You can interact with the deployed BhupatiToken contract using web3.js or ethers.js libraries. Below are some examples of how to do that:

1. **Transfer Tokens**:
   ```javascript
   const bhupatiToken = new web3.eth.Contract(abi, contractAddress);
   const recipientAddress = "0xRecipientAddress";
   const amountToTransfer = web3.utils.toWei("100", "ether");

   bhupatiToken.methods.transferTokens(recipientAddress, amountToTransfer).send({ from: yourAddress })
     .on("transactionHash", (hash) => {
       console.log("Transaction Hash:", hash);
     })
     .on("receipt", (receipt) => {
       console.log("Transaction Receipt:", receipt);
     })
     .on("error", (error) => {
       console.error("Error:", error);
     });
   ```

2. **Burn Tokens**:
   ```javascript
   const bhupatiToken = new web3.eth.Contract(abi, contractAddress);
   const amountToBurn = web3.utils.toWei("50", "ether");

   bhupatiToken.methods.burnTokens(amountToBurn).send({ from: yourAddress })
     .on("transactionHash", (hash) => {
       console.log("Transaction Hash:", hash);
     })
     .on("receipt", (receipt) => {
       console.log("Transaction Receipt:", receipt);
     })
     .on("error", (error) => {
       console.error("Error:", error);
     });
   ```

3. **Mint Tokens** (only contract owner can call this):
   ```javascript
   const bhupatiToken = new web3.eth.Contract(abi, contractAddress);
   const recipientAddress = "0xRecipientAddress";
   const amountToMint = web3.utils.toWei("500", "ether");

   bhupatiToken.methods.mintTokens(recipientAddress, amountToMint).send({ from: contractOwnerAddress })
     .on("transactionHash", (hash) => {
       console.log("Transaction Hash:", hash);
     })
     .on("receipt", (receipt) => {
       console.log("Transaction Receipt:", receipt);
     })
     .on("error", (error) => {
       console.error("Error:", error);
     });
   ```

## Security Considerations

- The contract implements an owner-only functionality to control token minting. Ensure that the contract owner is a trusted address.
  
- Before deploying the contract on the Ethereum mainnet or a public testnet, conduct thorough security audits and testing to identify and mitigate potential vulnerabilities.

- Be cautious when interacting with smart contracts, as transactions are irreversible. Double-check the recipient address and token amounts before confirming transactions.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
