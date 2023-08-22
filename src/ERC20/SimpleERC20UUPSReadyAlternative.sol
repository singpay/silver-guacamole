// SPDX-License-Identifier: AGPL-1.0
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./ERC20Base.sol";
import "./WithPermitAndFixedDomain.sol";
import "hardhat-deploy/solc_0.8/proxy/Proxied.sol";
import "@openzeppelin/contracts/proxy/utils/UUPSUpgradeable.sol";

contract SimpleERC20UUPSReadyAlternative is ERC20Base, WithPermitAndFixedDomain, UUPSUpgradeable {
    constructor(address to, uint256 amount) WithPermitAndFixedDomain("1") {
        init(to, amount);
    }

    function init(
        address to,
        uint256 amount
    ) public {
        require(totalSupply() == 0, "ALREAD MINTED");
        _mint(to, amount);
    }

    string public constant symbol = "SIMPLE";

    function name() public pure override returns (string memory) {
        return "Simple ERC20";
    }

    function _authorizeUpgrade(address) internal override {
        // revert("CANNOT UPGRADE");
    }
}
