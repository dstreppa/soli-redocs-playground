pragma solidity ^0.4.23;

import "../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol";

/// Manager of markets groups
contract Manager is Ownable{

    /// Address of the token
    address public token;

    /// Mapping to check the group existence
    mapping (address => bool) groupsFlags;

    // Events

    /// A group has been added
    /// @param dso The DSO wallet
    /// @param token The NemoGrid token address
    event AddedGroup(address dso, address token);

    /// Constructor
    /// @param _token The NemoGrid token address
    constructor(address _token) public {
        token = _token;
    }

    /// Add a markets group, defined by the couple (dso, token)
    /// @param _dso The DSO wallet
    function addGroup(address _dso) onlyOwner public {

        // The dso cannot be also the owner
        require(owner() != _dso);

        groupsFlags[_dso] = true;

        emit AddedGroup(_dso, token);
    }

    // View functions

    /// Return if the markets group exists
    /// @param _dso The DSO wallet
    /// @return true if the group exists, false otherwise
    function getFlag(address _dso) view public returns(bool)         { return groupsFlags[_dso]; }
}
