// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./Token.sol";

contract Lock{
    Recycle Token;
    uint256 public lockerCount;
    uint256 public totalLocked;
    mapping(address => uint256 ) public lockers;

    constructor(address tokenAddress){
        Token=Recycle(tokenAddress);

    }
    function lockTokens(uint256 amount) external{
        require(amount>0,"Token amount must be bigger than 0.");
        // require(Token.BalanceOf(msg.sender>= amount),"Insufficient balance.");
        // require(Token.allowance(msg.sender),address(this)>=amount,"Insufficient allowance.");
        Token.transferFrom(msg.sender,address(this),amount);
        lockers[msg.sender]+=amount;
        lockerCount++;
        totalLocked+=amount;


    }
    function withdrawTokens() external{
        
        uint256 amount=lockers[msg.sender];
        require(amount>0,"You have no tokens to withdraw.");
         delete(lockers[msg.sender]);
        lockers[msg.sender]=0;
        lockerCount--;
        totalLocked-=amount;
        Token.transfer(msg.sender,amount);
       



    }
}