pragma solidity ^0.4.24;
import "./tokens/NFToken.sol";

contract FourParkFreeze is NFToken {

  // Frozen state array variable
  mapping (uint256 => bool) private Frozen;
  
  // Modifier to require non-frozen state of token
  modifier onlyNotFrozen(uint256 _tokenId) {
    require(Frozen[_tokenId] = false);
    _;
  }
  
  // Modifier to require frozen state of token
  modifier onlyFrozen(uint256 _tokenId) {
    require(Frozen[_tokenId] = true);
    _;
  }

  // Function to freeze token
  function freezeToken(uint256 _tokenId)
    public
  {
    require(Frozen[_tokenId] == false);
    Frozen[_tokenId] = true;
  }

  // Function to unFreezeToken
  function unFreezeToken(uint256 _tokenId)
    public
  {
    require(Frozen[_tokenId] == true);
    Frozen[_tokenId] = false;
  }

  // Function to query state of token, no gas
  function isFrozen(uint256 _tokenId) public view returns (bool) {
    return Frozen[_tokenId];
  }
}
