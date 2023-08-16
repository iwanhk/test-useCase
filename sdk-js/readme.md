# npm包: isotop_contract_sdk

## 功能

**isotop_contract_sdk** 是一个提供了接口：createUser, queryUser, writeCall, readCall, getTransactionByHash的 npm 包，用于创建账户，查询用户在链上账户地址，写入合约方法，读取合约方法以及根据交易查询交易信息等功能。

## 安装

要使用 **isotop_contract_sdk**，安装该sdk会自动安装三方库的依赖。

通过 npm 命令进行安装：
```bash
npm install isotop_contract_sdk
```

如若未安装三方库依赖，您需要手动安装，在 Node.js 环境中安装ethers.js。可以通过 npm 命令进行安装：
```bash
npm install ethers
```
还需要安装axios用于请求。可以通过 npm 命令进行安装：
```bash
npm install axios
```



## 用法
首先，在您的项目中引入 先引入ethers模块；

然后，在您的项目中引入 isotop_contract_sdk 模块的方法：
```bash
const {createUser,queryUser,writeCall,readCall,getTransactionByHash} = require("isotop_contract_sdk/src/index");
```

自定义引入apiKey与apiSecret;

根据npm官网代码自定义修改静态参数；

以下为示例js文件：
index.js
```bash

const { ethers } = require("ethers");
var fs = require("fs");


//引入abi文件json格式
var AbiData = fs.readFileSync("IsotopTest.json");
let ABI = AbiData.toString();
let iface = new ethers.Interface(ABI);

//引入sdk的方法
const {createUser,queryUser,writeCall,readCall,getTransactionByHash} = require("./src/index");

//根据您调用的方法输入您的静态参数，以下为例子
const apiKey = "1956ca03f544258ef5d255795de15552";//该api-key为模拟值
const apiSecret = "bd09139024c2d3136a4f62f60038c1594e6641063e413c57f517a575fbb155ba";//该secret为模拟值
const chainId = "1";
const id = "13911024683";
const contract = 'cfxtest:acaktjrdthgszgjbd0btn1c5stcyeuf3t6kp582wyd';
const data = '0x4717a93e';
const fromAddress = 'cfxtest:aata6s2ryr25y15kg8v4wfnjvk9ep0cx16h51ne0uj';
const hash = '0x203e723bce1559b321b0680e89a9dff0e185ae9c0b950f85e8842e4bdacc59cc'


//根据您调用的方法修改接口
const api_url = "https://www.isotop.top/chain-api/api/v1/chain/getTransactionByHash";



////以下为各个方法调用的示例代码：


// createUser(apiKey, apiSecret, chainId, id, api_url)
//   .then((data) => {
//     console.log(data);
//   })
//   .catch((error) => {
//     console.error(error);
//   });



//   queryUser(apiKey, apiSecret, chainId, id, api_url)
//   .then((data) => {
//     console.log(data);
//   })
//   .catch((error) => {
//     console.error(error);
//   });



//   readCall(apiKey, apiSecret, chainId, data, contract, id, api_url)
//   .then((data) => {
//     const resultData = data;
//       result = iface.decodeFunctionResult("testReadCall", resultData);
//     console.log(result);
//   })
//   .catch((error) => {
//     console.error(error);
//   });



//   writeCall(apiKey, apiSecret, chainId, fromAddress, data, contract, id, api_url)
//   .then((data) => {
//     console.log(data);
//   })
//   .catch((error) => {
//     console.error(error);
//   });

// getTransactionByHash(apiKey, apiSecret, chainId, hash, id, api_url)
//   .then((data) => {
//     console.log(data);
//   })
//   .catch((error) => {
//     console.error(error);
//   });
```

然后，终端运行
```bash
node index.js
```


