const Web3 = require('web3')

const web3 = new Web3 ('https://localhost:8545')

// console.log(web3);

const privateKey = '0x19ab196572c5f8120e4f0cc9d649a3bff0848ba4bd2a75199a6472edbb9e5c4d';
const myAccount = web3.eth.accounts.wallet.add(privateKey);

// console.log(myAccount)

module.exports ={
    web3: web3,
    myAccount: myAccount
}