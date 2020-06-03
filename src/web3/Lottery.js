
import web3 from './web3';
import lotteryJson from '../LotteryFactory/build/contracts/LotteryFactory'
import config from '../config';

let lotteryGenerator;
if(web3){
    let abi = lotteryJson.abi;
    lotteryGenerator = new web3.eth.Contract(abi, config.lotteryFactoryAddress);
}

export default lotteryGenerator
