// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./valantis/SovereignPool.sol";

contract ExecutionAwareAMM is SovereignPool {
    address public strategist;

    event RouteToSpot(uint256 amount, uint256 price);
    event RouteToPerps(uint256 hedgeSize);
    event IdleLiquiditySignaled(uint256 amount);

    constructor(address _strategist) {
        strategist = _strategist;
    }

    modifier onlyStrategist() {
        require(msg.sender == strategist, "Not strategist");
        _;
    }

    function onSwap(uint256 amountIn, uint256 midPrice) external {
        emit RouteToSpot(amountIn, midPrice);
    }

    function signalIdleLiquidity(uint256 amount)
        external
        onlyStrategist
    {
        emit IdleLiquiditySignaled(amount);
    }
}
