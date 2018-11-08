pragma solidity ^0.4.24;
import "./tokens/NFToken.sol";

contract FourParkSecure is NFToken {

  // Secure state array variable
  mapping (uint256 => bool) private Secured;

  // Modifier to require secured state of token
  modifier onlySecured(uint256 _tokenId) {
    require(Secured[_tokenId] = true);
    _;
  }

  // Modifier to require not secured state of token
  modifier onlyNotSecured(uint256 _tokenId) {
    require(Secured[_tokenId] = false);
    _;
  }
  
  // Function to secure token
  function secureToken(uint256 _tokenId)
    public
    returns (bool)
  {
    require(Secured[_tokenId] == false);
    Secured[_tokenId] = true;
    return true;
  }

  // Function to unsecure token
  function unsecureToken(uint256 _tokenId)
    public
    onlyNotSecured(_tokenId) 
    returns (bool)
  {
    Secured[_tokenId] = false;
    return true;
  }

  // Function to query state of token, no gas
  function isSecured(uint256 _tokenId) public view returns (bool) {
    return Secured[_tokenId];
  }
}