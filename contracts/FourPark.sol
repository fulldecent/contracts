pragma solidity ^0.4.24;

import "./tokens/NFTokenEnumerable.sol";
import "./tokens/NFTokenMetadata.sol";
import "./FourParkFreeze.sol";
import "./FourParkSecure.sol";
import "@0xcert/ethereum-utils/contracts/ownership/Ownable.sol";

contract FourPark is
  NFTokenEnumerable,
  NFTokenMetadata,
  FourParkFreeze,
  FourParkSecure,
  Ownable
{
  constructor(
    string _name,
    string _symbol
  )
    public
  {
    nftName = _name;
    nftSymbol = _symbol;
  }


/**
   * @dev Mints a new NFT.
   * @param _to The address that will own the minted NFT.
   * @param _tokenId of the NFT to be minted by the msg.sender.
   * @param _uri String representing RFC 3986 URI.
   */
  function mint(
    address _to,
    uint256 _tokenId,
    string _uri
  )
    onlyOwner
    external
  {
    super._mint(_to, _tokenId);
    super._setTokenUri(_tokenId, _uri);
  }

  /**
   * @dev Removes a NFT from owner.
   * @param _owner Address from wich we want to remove the NFT.
   * @param _tokenId Which NFT we want to remove.
   */
  function burn(
    address _owner,
    uint256 _tokenId
  )
    onlyOwner
    external
  {
    super._burn(_owner, _tokenId);
  }


  // Adding modifiers to the transferFrom method
  // Then calling the super
  function transferFrom(
    address _from,
    address _to,
    uint256 _tokenId
  )
    external
    onlyNotFrozen(_tokenId)
    onlySecured(_tokenId)
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
    onlySecured(_tokenId)
  {
    super.safeTransferFrom(_from, _to, _tokenId);
  }

}