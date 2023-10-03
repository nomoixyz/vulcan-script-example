## Vulcan deployment script example

This is an example on how to use [`vulcan`](https://github.com/nomoixyz/vulcan) to perform some really cool stuff.

In this example we have a [deployment script](https://github.com/nomoixyz/vulcan-script-example/blob/main/script/MyContract.s.sol) that deploys a contract and then automatically
imports the contract functions signatures to [samczsun's signatures database](https://sig.eth.samczsun.com/).

## How to run the example

To execute the script run:

```
forge script script/MyContract.s.sol:DeployScript
```
