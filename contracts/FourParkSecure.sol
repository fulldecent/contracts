pragma solidity ^0.4.24;
import "./tokens/NFToken.sol";

contract FourParkSecure is NFToken {

  mapping (uint256 => bool) private Secured;
  
  modifier onlySecured(uint256 _tokenId) {
    require(Secured[_tokenId] = true);
    _;
  }

  modifier onlyNotSecured(uint256 _tokenId) {
    require(Secured[_tokenId] = false);
    _;
  }
  

  function transferFrom(
    address _from,
    address _to,
    uint256 _tokenId
  )
    external
    onlySecured(_tokenId)
  {
    super.transferFrom(_from, _to, _tokenId);
  }


  function safeTransferFrom(
    address _from,
    address _to,
    uint256 _tokenId
  )
    external
    onlySecured(_tokenId)
  {
    super._safeTransferFrom(_from, _to, _tokenId);
  }


  function secureToken(uint256 _tokenId)
    public
    returns (bool)
  {
    require(Secured[_tokenId] == false);
    Secured[_tokenId] = true;
    return true;
  }

  function unSecureToken(uint256 _tokenId)
    public
    onlyNotSecured(_tokenId) 
    returns (bool)
  {
    Secured[_tokenId] = false;
    return true;
  }

  function isSecured(uint256 _tokenId) public view returns (bool) {
    return Secured[_tokenId];
  }
}