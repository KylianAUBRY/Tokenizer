
// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.4.0
pragma solidity ^0.8.27;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract kyaubry42 is ERC20 {
    //ici pour cree le contrat on herite de ERC20.
    constructor(uint256 initialSupply) ERC20("42kyaubry", "KY42") {
        _mint(msg.sender, initialSupply* 10 ** decimals()); //ici on cree un ensemble de token qui sera attribue a l'adresse deplayant le contrat
        /*par defaut dans initialSupply = 
        1  = 10^18 KY42
        0.1 = 10^17 KY42 etc...
        
        moi je prefere que 1 dans initalSupply = 1 KY42 c'est pour ca que je fait * 10 ** decimals()
        */
    }
}
