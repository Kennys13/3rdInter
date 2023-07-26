const hre = require("hardhat");

async function main() {
  // Deploy BhupatiToken contract
  const BhupatiToken = await hre.ethers.getContractFactory("BhupatiToken");
  const bhupatiToken = await BhupatiToken.deploy();
  await bhupatiToken.waitForDeployment();

  console.log("BhupatiToken contract deployed to:", bhupatiToken.target);

  // Perform any additional operations with the BhupatiToken contract here,
  // such as calling its functions or interacting with it in other ways.
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
})
