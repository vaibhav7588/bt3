
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank {

    mapping(address => uint) balanceOf;

    // Deposit Money
    function deposit() public payable {
        require(msg.value > 0, "Deposit should be greater than zero.");

        balanceOf[msg.sender] += msg.value;
    }

    // Withdraw Money
    function withdraw() public {
        uint amount = balanceOf[msg.sender];

        require(amount > 0, "Your balance should be greater than zero.");

        balanceOf[msg.sender] = 0;

        (bool success, ) = payable(msg.sender).call{value: amount}("");

        require(success, "Withdrawal failed.");
    }

    // Show Balance
    function showBalance() public view returns(uint) {
        return balanceOf[msg.sender];
    }
}
