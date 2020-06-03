
import web3 from './web3';
import lotteryGeneratorJson from "../LotteryFactory/build/contracts/Lottery";
import config from "../config";

var lottery;
if (web3) {
    let abi = lotteryGeneratorJson.abi;
    lottery = new web3.eth.Contract(abi, config.lotteryFactoryAddress);
}

export default lottery;
