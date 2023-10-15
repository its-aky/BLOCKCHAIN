//(1)   the solidity version is defined

// SPDX-License-Identifier: MIT
pragma solidity 0.6.0;
//Other ways:
//pragma solidity ^0.6.0; //To chose any version of 0.6 i.e 0.6.0, 0.6.1, ....
//pragma solidity >=0.6.0 <0.9.0; //To chose version in between the specified values

//  (2) defining the contracts

//  (3)Types and declaring variables

contract SimpleStorage {
    /*
    //  (3)Types and declaring variables

    uint256 favoriteNumber=5;//unsigned integer data type with size 256 bits, this just adds precision and optimum use of space
    //may define as int too
    bool favoriteBool;//declared but not initialized with any value
    string favoriteString="String";
    int favoriteInt=5;
    address favoriteAddress=0x66c863ce0083426d137De26B442ef411e7af01cF;
    bytes32 favoriteBytes="dog";

    //scope of variables-global and local

    */


    //  (4) Functions

    //Visibility of function and variables:Internal,External,Public,Private
    //Internal is the default visibility

    //Some gas is paid for interacting with this function
    //state changing function calls are called transaction
    //uint256 favoriteNumber;   //favoriteNumber will not be shown in the deployed contracts
    /*
    uint256 public favoriteNumber;//visibility changed to public,now it will show up(used as a view)
    function store(uint256 _favoriteNumber) public  {
        favoriteNumber=_favoriteNumber;
    }
    */

    //view and pure are 2 functions that are non state changing functions
    //public keyword is used for view for variables and functions can be defined as view separately

    /*//e.g
    function retrive() public view returns (uint256) {
        return favoriteNumber;
    }
    */

    /*
    //pure function performs some mathematical operation
    function retrive(uint256 _favoriteNumber) public pure {
        _favoriteNumber+_favoriteNumber;//it does not return anything 
    }
    */


    //(5) struct
    //defining the struct
    struct People{
        uint256 favoriteNumber;
        string name;
    }

    //creating an object
    People public person1 = People({favoriteNumber: 1,name: "AMIT YADAV"});

    uint256 public favoriteNumber;
    //arrays
    //creating an array of type People 
    People[] public people;//dynamic array
    //People[3] public people;  //fixed array

    //creating a map 
    mapping (string=>uint256) public NameToString;

    //adding into an array using function
    function adding(string memory _name,uint256 _favoriteNumber) public {

        people.push(People(_favoriteNumber, _name));//order of storage is already known so we can do it without specifying much
        //people.push(People({favoriteNumber:_favoriteNumber, name:_name}));  

        //add mapping
        NameToString[_name]=_favoriteNumber;  
    }

    function store(uint256 _favoriteNumber) public  {
        favoriteNumber=_favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    //memory keyword: data will only be stored during the execution of the function
    //storage keyword: data will be kept stored after the execution of the function




















    






    
}
