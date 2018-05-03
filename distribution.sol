pragma solidity ^0.4.18;

import './DockToken.sol';


contract Distribution is Ownable {
    // Token to be distributed
    DockToken public token;

    function Distribution(address dockToken) public {
        token = DockToken(dockToken);
    }

    /**
    * Allocate tokens in bulk
    */
    function distribute(address _from, address[] toList, uint256[] tokensList) external onlyOwner returns (bool)  {
        require(toList.length == tokensList.length);

        for (uint32 i = 0; i < toList.length; i++) {
            if (!token.transferFrom(_from, toList[i], tokensList[i])) {
                revert();
            }
        }
        return true;
    }
}
