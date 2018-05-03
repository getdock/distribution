# Distribution contract

Distribution contract is an ethereum counterpart of our distribution service. It is very simple and has only one method.
This method is involved by our system to distribute tokens to several recipients in a single call and thus, save gas 
fees.

## Token allowance

Neither distribution smart contract nor account of the contract owner do not store tokens.
Tokens must be stored on a separate account that will provide allowance for **contract address** to distribute tokens
on his behalf.

## How to setup allowance

Guide below as well as distribution contract is designed for dock token, however, one can easily substitute dock 
token with any other ERC20 contract.

1. Open dock contract code (https://github.com/dockio/dock-token/blob/master/crowdsale.sol)
2. Make sure to have **Holder account** opened in Metamask and switch to MainNet (one that has a lot of tokens that 
   will be allowed to be spent)
3. Open remix (https://remix.ethereum.org) and paste dock token contract there
4. Select ``Run`` tab
5. Select ``DockToken`` from the list of available contracts
6. In "Load from address" field enter dock token address.
7. Click "At address". You will see contract loaded underneath
8. Find red button "approve", in field next to it enter ``"<Distribution address>", <amount>``,
   ie ``"0xab31fe0f8c1e7d1a11fd89adec18652e53417936", 1045050000000000000000000`` which will allow 1045050 tokens to 
   be spent by 0xab31fe0f8c1e7d1a11fd89adec18652e53417936 address. Notice 18 zeros. They are required and are equal 
   to dock token decimals.
9. Hit red "approve" button, verify transaction details and approve it via MetaMask.
10. Wait for transaction to be mined and verify proper allowance.

## How to verify allowance.

1. Open dock token in EtherScan: https://etherscan.io/token/0xe5dada80aa6477e85d09747f2842f7993d0df71c#readContract
2. Select "Read Contract"
3. In "Allowance" enter **Holder address**, **Distribution address** (address of the distributed "Distribution" 
   contract) and hit "Query"
4. You should see number of allowed tokens. Divide that number by 10^18 to get token amount.


## Deploy contract from Remix

In order to deploy contract directly from Remix one should:

1. Open MetaMask plugin, select proper network and proper account
2. Load remix from https://remix.ethereum.org
3. Load required files
4. On the right select ``Run`` tab
5. Make sure that environment is set to be ``Injected Web3`` (that is one, provided by MetaMask)
5. Make sure proper account is selected
6. Select proper contract and provide proper constructor attributes
7. Hit Create and confirm transaction in MetaMask.
8. Wait for the magic to happen.