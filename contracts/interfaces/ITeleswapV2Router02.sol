pragma solidity >=0.6.2;
pragma experimental ABIEncoderV2;
import './ITeleswapV2Router01.sol';

interface ITeleswapV2Router02 is ITeleswapV2Router01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        route calldata _route,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    )  external returns (uint amountETH);
    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        route calldata _route,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, Sig calldata sig
    ) external returns (uint amountETH);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        route[] calldata routes,
        address to,
        uint deadline
    ) external;
    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint amountOutMin,
        route[] calldata routes,
        address to,
        uint deadline
    ) external payable;
    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        route[] calldata routes,
        address to,
        uint deadline
    ) external;
    function multicall(uint256 deadline, bytes[] calldata data) external payable returns (bytes[] memory results);
    function refundETH() external payable;
    function swapETHForExactTokensMulti(uint amountOut, route[] calldata routes, address to, uint deadline)
    external
    payable
    returns (uint[] memory amounts);
}
