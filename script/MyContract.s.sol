// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {MyContract} from "src/MyContract.sol";
import {
    Script,
    vulcan,
    ctx,
    json,
    JsonObject,
    fs,
    println,
    request,
    Response
} from "vulcan/script.sol";

contract DeployScript is Script {
    function run() public {
        ctx.startBroadcast();

        new MyContract();

        ctx.stopBroadcast();

        string memory source = fs.readFile("src/MyContract.sol").unwrap();

        JsonObject memory data = json
            .create('{"compiler": "solidity"}')
            .unwrap()
            .set("code", source);

        JsonObject memory body = json
            .create('{"type": "code"}')
            .unwrap()
            .set("data", data);

        Response memory res = request
            .create()
            .post("https://sig.eth.samczsun.com/api/v1/import")
            .json(body)
            .send()
            .unwrap();

        println(string(res.body));
    }
}
