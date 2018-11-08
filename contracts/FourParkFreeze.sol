pragma solidity ^0.4.24;
import "./tokens/NFToken.sol";

contract FourParkFreeze is NFToken {

  mapping (uint256 => bool) private Frozen;
  
  modifier onlyNotFrozen(uint256 _tokenId) {
    require(Frozen[_tokenId] != true);
    _;
  }
  
  modifier onlyFrozen(uint256 _tokenId) {
    require(Frozen[_tokenId] = true);
    _;
  }

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


  function freezeToken(uint256 _tokenId)
    public
    returns (bool)
  {
    require(Frozen[_tokenId] == false);
    Frozen[_tokenId] = true;
    return true;
  }

  function unFreezeToken(uint256 _tokenId)
    public
    returns (bool)
  {
    require(Frozen[_tokenId] == true);
    Frozen[_tokenId] = false;
    return true;
  }

  function isFrozen(uint256 _tokenId) public view returns (bool) {
    return Frozen[_tokenId];
  }
}