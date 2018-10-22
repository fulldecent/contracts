pragma solidity ^0.4.24;

contract NFTokenFreezable {
  mapping (uint256 => bool) private _frozen;

  function transferFrom(address _from, address _to, uint256 _tokenId) public {
    require(_frozen[_tokenId] != true);
    super.transferFrom(_from, _to, _tokenId);
  }

  function safeTransferFrom(address _from, address _to, uint256 _tokenId) public {
    require(_frozen[_tokenId] != true);
    super.safeTransferFrom(_from, _to, _tokenId);
  }

  function freezeToken(uint256 _tokenId) onlyMinter public returns (bool) {
    require(_frozen[_tokenId] == false);
    _frozen[_tokenId] = true;
    return true;
  }

  function unFreezeToken(uint256 _tokenId) onlyMinter public returns (bool) {
    require(_frozen[_tokenId] == true);
    _frozen[_tokenId] = false;
    return true;
  }

  function isFrozen(uint256 _tokenId) public view returns (bool) {
    return _frozen[_tokenId];
  }
}