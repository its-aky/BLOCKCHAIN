
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

//We want a contract such that it is payable/store transactions

//Interfaces compile down to an ABI(Application Binary Interface)
//ABI tells solidity and other programming languages how it can interact with a contract

//import "@contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

//OR copy paste the code

interface AggregatorV3Interface {

  function decimals()
    external
    view
    returns (
      uint8
    );

  function description()
    external
    view
    returns (
      string memory
    );

  function version()
    external
    view
    returns (
      uint256
    );

  function getRoundData(
    uint80 _roundId
  )
    external
    view
    returns (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    );

  function latestRoundData()
    external
    view
    returns (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    );

}

contract FundMe {

    //store the address which sent us amount also store the amount
    mapping (address=>uint256) public addressToAmountFunded;


    function fund() public payable  {//payable keyword makes the function store transactions
    // Wei is the smallest amount in which ethereum can be broken
        addressToAmountFunded[msg.sender]+=msg.value;//msg.sender and msg.value are keywords which return the address and value of transaction respectively

        //What is the ETH->USD conversion rate??
        //Getting EXternal data with chainlink

        //Blockchains can't get connected to real world directly
        //So,Decentralized Oracle Chainlink links the blockchain and real world data


        //Chainlink is a decentralized oracle network that enables smart contracts on blockchain platforms to interact with
        // real-world data and external systems. In blockchain-based ecosystems, smart contracts are self-executing programs 
        //that rely on information from external sources, but they are isolated from the internet and unable to access this
        // data directly. This is where Chainlink comes in to bridge the gap

        //We can also make our own chainlink using chainlink API

        //There are no Chainlink nodes on simulated Javascript VM 
        //Therefore we need to run chainlinks on TestNets

        //Pricefeeds:-   https://data.chain.link/
        // https://docs.chain.link/
    }

    function getVersion() public view returns(uint256) {
        //Interfaces are used like structs 
        AggregatorV3Interface priceFeed=AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);//https://docs.chain.link/data-feeds/price-feeds/addresses?network=ethereum&page=1&search=
        return priceFeed.version();

        //used another contract from our own contract using interfaces

    }
        
    
    
}
    