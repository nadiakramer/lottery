
import web3 from './web3';
import lotteryGeneratorJson from '../LotteryFactory/build/contracts/Lottery'
import config from '../config';

let lotteryGenerator;
if(web3){
    let abi = lotteryGeneratorJson.abi;
    lotteryGenerator = new web3.eth.Contract(abi, config.lotteryFactoryAddress);
}

export default lotteryGenerator
