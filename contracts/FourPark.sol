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
}