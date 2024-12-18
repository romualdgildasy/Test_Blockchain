// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract Erc20Token is ERC20 {
    address public owner;
    uint256 public maxTotale;
    mapping(address => uint256) public balances;
    event send(address indexed to, uint256 amount);
    constructor(address _owner, uint256 _maxTotal) ERC20("YousCoins", "YOUS"){
        owner = _owner;
        maxTotale = _maxTotal;
        _mint(owner, maxTotale);
        balances[owner] = maxTotale;
    }

    modifier onlyOwner(){
        require(msg.sender == owner,"Only Owner can call this function");
        _;
    }

    function getName() public view returns  (string memory){
        return "YousCoins";
    }
    function getMaxSuply() public view returns (uint256) {
        return maxTotale;
    }

    function getBalanceOf( address to) public view returns (uint256) {
        return balanceOf(to);
    }

    function sendToken(address to, uint256 amount) public onlyOwner returns (string memory){
        require(msg.sender == owner, "onlyOwner can call this function");
        _transfer(owner,to, amount);
        emit send(to, amount);
        return "Successfuly transaction";
    }

    
    
}



