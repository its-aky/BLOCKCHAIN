//we need to deploy SimpleStorage contract using this contract
//this is called Storage factory

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./SimpleStorage.sol"; // importing the contract using path
//both files are in same directory

contract FactoryStorage is SimpleStorage{//adding "is SimpleStorage" inherits all the variables 

    //  (2)Create an array of simple storages
    SimpleStorage[] public simplestoragearray;


    //  (1)function to create a SimpleContract in FactoryStorage
    function createSimpleStorageContract() public {
        SimpleStorage _simplestorage=new SimpleStorage();
        simplestoragearray.push(_simplestorage);
    }

    //  (3)let's store simple contracts index wise in factory manner using the store function of SimpleStorage
    // and also use retrieve function to get the values

    function sfStore(uint256 _simplestorageIndex,uint256 _simplestorageNumber) public  {
        return SimpleStorage(address(simplestoragearray[_simplestorageIndex])).store(_simplestorageNumber); // see the SimpleStorage.sol for the number and types of parameters
    }


    function sfGet(uint256 _simplestorageindex) public view returns (uint256) {//sfGet uses retrieve function of Simple Storage
    //sf means storage factory

        //For better understanding
        //SimpleStorage simplestorage=SimpleStorage(address(simplestoragearray[_simplestorageindex]));
        //return simplestorage.retrieve();

        return SimpleStorage(address(simplestoragearray[_simplestorageindex])).retrieve();
        
    }


    
}
