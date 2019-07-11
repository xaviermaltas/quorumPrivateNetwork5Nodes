var Election = artifacts.require("./Election.sol");

module.exports = function(deployer) {
    // Functional Deployer (Global)
    // deployer.deploy(Election); 
    
    // .pub node 1 NqObl69ln61fiwyIi1ZTBs0mgqt6IeeRBvsWcb9AclQ=
    //.pub node2 DgQMkqB5/PP1oknXGSYvug6xN7PghfFg55P9s337BHg=

    // deployer.deploy(Election, { privateFor:["NqObl69ln61fiwyIi1ZTBs0mgqt6IeeRBvsWcb9AclQ="]} ).then(
    //     function(data){
    //         console.log("Deploying Election Contract with privateFor");
    //         // console.log(data);
    //     }
    // ).catch(
    //     function(e){
    //         console.log(e);
    //         deployFunction(deployer);
    //     }
    // );

    deployFunction(deployer);
};


function deployFunction(deployer){
    const accounts = web3.eth.accounts;
    const actualAccount = accounts[0]; 
    console.log("Deploying Election Contract with account : " + actualAccount);

    return deployer.deploy(Election); 
}
