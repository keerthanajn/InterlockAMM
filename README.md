# InterlockAMM
INTERLOCK: Execution-Aware Liquidity Layer
Interlock is a professional-grade liquidity protocol purpose-built for the Hyperliquid ecosystem. By bridging the gap between HyperEVM and HyperCore, Interlock transforms passive AMM pools into active, delta-neutral trading engines that solve the core problems of modern DeFi: Oracle lag and toxic arbitrage.

💎 The Problem & Necessity
Traditional AMMs are "Oracle-Lagging." They rely on price updates that often lag seconds behind the high-speed Central Limit Order Books (CLOBs) of centralized exchanges or native L1s. This results in:

Toxic Flow: Arbitrageurs profit at the expense of Liquidity Providers (LPs).

Impermanent Loss (IL): LPs take on significant market risk without a mechanism to hedge.

Capital Inefficiency: Idle reserves sit in pools without generating maximum yield.

Interlock is the solution. We treat the Hyperliquid L1 and EVM as a single, unified execution environment.

🚀 Technical Uniqueness
1. Just-In-Time (JIT) Pricing
Interlock utilizes the native 0x807 Read Precompile. Unlike standard AMMs that wait for an oracle push, our Algorithmic Liquidity Module (ALM) reads the HYPE/USDC spot mid-price directly from the HyperCore L1 at the exact millisecond of the swap. This ensures the pool always trades at parity with the order book.

2. Execution-Aware Hedging
We leverage the CoreWriter (0x333...) precompile to emit L1-ready payloads during the swap callback.

The Flow: EVM Swap → Precompile Signal → Off-chain API Wallet.

The Result: For every swap, Interlock automatically executes a hedge on the Perpetuals book, turning Impermanent Loss into a neutral basis.

3. Yield-Stacking Strategist
Interlock doesn't let capital sit idle. Built on the Valantis Sovereign Pool framework, we use a permissioned Strategist Role to reallocate excess reserves into yield-bearing markets (e.g., Pendle PTs or Lending Markets) under strict protocol guardrails.

🛠️ Development & Simulation
To ensure our logic was battle-tested against Hyperliquid's low-level "metal," we utilized Hardhat for orchestration:

Precompile Simulation: We used hardhat_setCode to inject our Mock Oracle into the 0x807 address on a local Hardhat node.

End-to-End Testing: Our steps-test.ts script simulates the full lifecycle: Fetching L1 price → Dynamic Quoting → Swap Execution → Capital Rebalancing.

📁 Repository Structure
contracts/: Core protocol logic and Hyperliquid integration.

HyperliquidALM.sol: Our Algorithmic Liquidity Module.

valantis-core/: Sovereign Pool infrastructure.

scripts/: Deployment and Technical Proofs.

steps-test.ts: The primary technical demonstration script.

deploy.ts: Orchestration for local and testnet deployment.

hyper-evm-lib/: Libraries for Hyperliquid specific precompile interactions.

🏁 Hackathon Criteria Met
Native Build: Purpose-built for Hyperliquid using Read & Write Precompiles.

Risk Mitigation: Integrated L1-hedging to eliminate IL.

Technical Depth: Used Hardhat for advanced bytecode injection and L1 simulation.

Innovation: First "Execution-Aware" AMM that bridges EVM liquidity with CLOB speed.

How to Run Local Simulation
Install dependencies: npm install

Start the local node: npx hardhat node

Run the technical proof: npx hardhat run scripts/steps-test.ts --network localhost

Interlock: The ultimate connection to Hyperliquid.