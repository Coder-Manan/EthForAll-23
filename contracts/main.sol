// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

struct propertyStruct{
    uint256 id;
    string name;
    string location;
    string valuationReportLink;
    string govtApprovalsLink;
    string[] photoLinks;
    uint8 propertyFloat; //solidity does not support float, so we use uint8. The actual value is this divided by 100
    uint8 avgOccupancy;
    uint16 noOfTokens; //max tokens = 2^16 = 65536
    uint16 pricePerToken; //the price contribution of this propertyStruct in a token
    uint16 tokensSold; //the number of tokens sold for this propertyStruct
    uint16 projectedReturn; //same as above. But here more precision was required hence uint16
    uint16 avgRentalYield; //same as above
    uint32 priceTotal; //max price = 2^32 = 4294967296
}

struct user {
    string name;
    uint256 uid;
    string email;
    uint256 tokens; //key = propertyId, value = number of tokens + initial token price*(2^16)
    uint16 monthlyIncome;
    uint8 avgMonthlyOccupancy;
    uint24 totalIncome; //stored seperately because the user may use a part of this income only to invest in tokens
}

struct token {
    uint8 distinctProperties;
    uint8[] propertyShares;
    uint256 tokenPrice;
    uint256[] propertyIds;
    uint256 tokenId;
}

contract Main {
    address payable private owner;
    mapping(uint256 => propertyStruct) allProperties;
    mapping(uint256 => user) allUsers;
    mapping(uint256 => token) allTokens;
    uint256[] propertyIds;
    uint256[] tokenIds;
    // uint256[] userIds;
    constructor() {
        owner = payable(msg.sender);
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }
    function setOwner(address payable _owner) external onlyOwner{
        owner = _owner;
    }
    function getOwner() external view returns (address) {
        return owner;
    }
    //function to create new propertyStruct
    function createProperty(uint256 _id, string memory _name, string memory _location, string memory _valuationReportLink, string memory _govtApprovalsLink, string[] memory _photoLinks, uint8 _propertyFloat, uint8 _avgOccupancy, uint16 _noOfTokens, uint16 _pricePerToken, uint16 _tokensSold, uint16 _projectedReturn, uint16 _avgRentalYield, uint32 _priceTotal) external onlyOwner{
        propertyStruct memory newProperty = propertyStruct(_id, _name, _location, _valuationReportLink, _govtApprovalsLink, _photoLinks, _propertyFloat, _avgOccupancy, _noOfTokens, _pricePerToken, _tokensSold, _projectedReturn, _avgRentalYield, _priceTotal);
        allProperties[_id] = newProperty;
        propertyIds.push(_id);
    }
    //function to get all properties
    function getProperties() external view returns (propertyStruct[] memory){
        //iterate over allProperties and return all properties
        propertyStruct[] memory properties;
        for (uint i = 0; i < propertyIds.length; i++) {
            properties[i] = allProperties[propertyIds[i]];
        }
        return properties;
    }

    //function to get a single propertyStruct
    function getProperty(uint256 _id) external view returns (propertyStruct memory){
        return allProperties[_id];
    }

    //function to get user details
    function getUserDetails(uint256 _uid) external view returns (user memory){
        return allUsers[_uid];
    }

    //function to get all tokens
    function getAllTokens() external view returns (token[] memory){
        //iterate over allTokens and return all tokens
        token[] memory tokens;
        for (uint i = 0; i < tokenIds.length; i++) {
            tokens[i] = allTokens[tokenIds[i]];
        }
        return tokens;
    }

    //function to get one token
    function getToken(uint256 _tokenId) external view returns (token memory){
        return allTokens[_tokenId];
    }

    function buyToken(uint256 _tokenId) external payable returns (bool){
        if (msg.sender.balance > allTokens[_tokenId].tokenPrice) {
            //transfer token to user
            (bool success, ) = owner.call{value:msg.value}("");
            //transfer money to owner
            return success;
        }
        return true;
    }
}