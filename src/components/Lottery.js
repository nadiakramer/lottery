import React, {Component} from "react";
import web3 from "../web3/web3";
import LotteryContract from "../web3/Lottery"
import LotteryFactoryContract from "../web3/LotteryFactory"
import App from "../App";


export default class Lottery  extends  Component{

    state = {
        players: []
    };

    componentDidMount(){
        const players = LotteryContract.methods.getPlayers().call();
        this.setState({ players })
    }

    render() {
        return(
            <div>
                <p>{this.state.players.length}</p>
            </div>
        )
    }

}
