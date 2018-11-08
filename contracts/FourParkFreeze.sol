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

  // Adding modifier to the transferFrom method
  // Then calling the super
  function transferFrom(
    address _from,
    address _to,
    uint256 _tokenId
  )
    external
    onlyNotFrozen(_tokenId)
  {
    super.transferFrom(_from, _to, _tokenId);
  }

  // Adding modifier to the safeTransferFrom method
  // Then calling the super
  function safeTransferFrom(
    address _from,
    address _to,
    uint256 _tokenId
  )
    external
    onlyNotFrozen(_tokenId)
  {
    super.safeTransferFrom(_from, _to, _tokenId);
  }

  // Function to freeze token
  function freezeToken(uint256 _tokenId)
    public
    returns (bool)
  {
    require(Frozen[_tokenId] == false);
    Frozen[_tokenId] = true;
    return true;
  }

  // Function to unFreezeToken
  function unFreezeToken(uint256 _tokenId)
    public
    returns (bool)
  {
    require(Frozen[_tokenId] == true);
    Frozen[_tokenId] = false;
    return true;
  }

  // Function to query state of token, no gas
  function isFrozen(uint256 _tokenId) public view returns (bool) {
    return Frozen[_tokenId];
  }
}