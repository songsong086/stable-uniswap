const hre = require("hardhat");


async function main() {
    const ethers = hre.ethers;

    // For Optimism Goerli testnet
    const WETH = "0x4200000000000000000000000000000000000006"
    const [signer,] = await ethers.getSigners()

    const TeleswapFactory = await ethers.getContractFactory("TeleswapV2Factory");
    const teleswapFactory = await TeleswapFactory.deploy(signer.address);
    await teleswapFactory.deployed();

    const TeleswapRouter = await ethers.getContractFactory("TeleswapV2Router02");
    const teleswapRouter = await TeleswapRouter.deploy(teleswapFactory.address, WETH);
    await teleswapRouter.deployed();


    console.log("router", teleswapRouter.address);
    console.log("factory", teleswapFactory.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
