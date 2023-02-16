// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

struct property{
    uint256 id;
    string name;
    string location;
    string valuationReportLink;
    string govtApprovalsLink;
    string[] photoLinks;
    uint8 propertyFloat; //solidity does not support float, so we use uint8. The actual value is this divided by 100
    uint8 avgOccupancy;
    uint16 noOfTokens; //max tokens = 2^16 = 65536
    uint16 pricePerToken; //the price contribution of this property in a token
    uint16 tokensSold; //the number of tokens sold for this property
    uint16 projectedReturn; //same as above. But here more precision was required hence uint16
    uint16 avgRentalYield; //same as above
    uint32 priceTotal; //max price = 2^32 = 4294967296
}

contract Main {
    address private owner;
    property[] public properties;
    constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }
    function setOwner(address _owner) external onlyOwner{
        owner = _owner;
    }
    function getOwner() external view returns (address) {
        return owner;
    }
    //function to create new property
    function createProperty(uint256 _id, string memory _name, string memory _location, string memory _valuationReportLink, string memory _govtApprovalsLink, string[] memory _photoLinks, uint8 _propertyFloat, uint8 _avgOccupancy, uint16 _noOfTokens, uint16 _pricePerToken, uint16 _tokensSold, uint16 _projectedReturn, uint16 _avgRentalYield, uint32 _priceTotal) external onlyOwner{
        property memory newProperty = property(_id, _name, _location, _valuationReportLink, _govtApprovalsLink, _photoLinks, _propertyFloat, _avgOccupancy, _noOfTokens, _pricePerToken, _tokensSold, _projectedReturn, _avgRentalYield, _priceTotal);
        properties.push(newProperty);
    }
    //function to get all properties
    function getProperties() external view returns (property[] memory){
       return properties;
    }

    //TODO:
    //function to get a single property
    //function to buy token of a property
    //User struct
    //function to get user details
    //function to get user's tokens
}