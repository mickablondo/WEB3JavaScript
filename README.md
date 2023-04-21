# Description du projet
Des tests de Web3.js pour interagir avec une blockchain.  
Dans le cadre de mes tests, [Ganache](https://trufflesuite.com/ganache/) a été utilisé.  

# [What I've Done](https://www.youtube.com/watch?v=8sgycukafqQ)

## Pré-requis
 - installer [Node.js](https://nodejs.org/en) ;  
 - installer [Ganache](https://trufflesuite.com/ganache/) pour avoir une blockchain de test en local ;  
 - un IDE comme [VS Code](https://code.visualstudio.com/) ;  

## Initialisation du projet

```bash
npm init
nmp install --save web3
node
> let Web3 = require('web3');
> let web3 = new Web3(new Web3.providers.HttpProvider('http://127.0.0.1:7545'));
> web3.eth.getBalance('0x70e1daD0a883A98b2a686092CB0fe204C7498c52');
> web3.eth.getBalance('0x70e1daD0a883A98b2a686092CB0fe204C7498c52').then(console.log)
> web3.eth.getBalance('0x70e1daD0a883A98b2a686092CB0fe204C7498c52').then(function(res) {console.log(web3.utils.fromWei(res, "ether"));})
> web3.eth.sendTransaction({from: '0x70e1daD0a883A98b2a686092CB0fe204C7498c52', to : '0x427054DFF2ECB3456e9C651B7180A431cF710eE6', value: web3.utils.toWei("5", "ether")});
```  
_Les adresses renseignées sont des adresses fictives issues de [Ganache](https://trufflesuite.com/ganache/)._  

### En détail
| Commande  | Description  |  
|---|---|  
| _npm init_  | npm est le gestionnaire de paquet de Node, cette commande initialise un répertoire créé sur mon poste et crée le fichier package.json  |  
|  _nmp install --save web3_ | installation de la librairie [web3.js](https://web3js.readthedocs.io)  |  
|  _node_ | lancement de l'invite de commandes interactive pour utiliser l’interpréteur Node sans avoir besoin d'écrire de fichier. Ici, je teste une série de commandes permettant d'utiliser [web3.js](https://web3js.readthedocs.io) dans le but d'interagir avec ma blockchain privée.  |  

## Commandes pour interagir avec un smart contract
Commande pour appeler ma méthode _myNumber()_ de mon contrat _contracts/TestContrat.sol_ préalablement déployé sur la blockchain :  
  
```javascript
web3.eth.call({from: '0x842159E7b7a0129bCda9748218fDE06ef94984aF', to: '0x6eb9f6b0eAE64A99879510FdBB3082c30031b5DD', data:web3.utils.sha3('myNumber()').substring(0,10)}).then(console.log);
```  

Autre façon de procéder en créant une instance de mon contrat me permettant d'utiliser ses fonctions :  

```javascript
> let contract = new web3.eth.Contract([
    {
        "inputs": [],
        "name": "myNumber",
        "outputs": [
            {
                "internalType": "uint256",
                "name": "",
                "type": "uint256"
            }
        ],
        "stateMutability": "view",
        "type": "function",
        "constant": true,
        "signature": "0x23fd0e40"
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "_autreNumber",
                "type": "uint256"
            }
        ],
        "name": "setNumber",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function",
        "signature": "0x3fb5c1cb"
    }
],"0x6eb9f6b0eAE64A99879510FdBB3082c30031b5DD");  
  
contract.methods.myNumber().call().then(console.log);  
  
contract.methods.setNumber(1234).send({from:'0x842159E7b7a0129bCda9748218fDE06ef94984aF'}).then(console.log);
```
### En détail
| Commande  | Description  |  
|---|---|  
| _web3.utils.sha3_  | détermine le hash keccak de la fonction que l'on souhaite appeler  |  
| _web3.eth.Contract(ABI du contrat, adresse du contrat)_  | crée une instance de contrat  |
| _contract.methods.myNumber().call()_  | appelle ma fonction _myNumber_ qui représente un getter d'un uint  |
| _contract.methods.setNumber(1234).send({from:'...'})_  |  appelle ma fonction _setNumber_ en spécifiant l'adresse de celui qui modifie la valeur |
  
## Interaction avec un smart contract depuis une page HTML

 - Création du fichier _index.html_ pour afficher les adresses fournies par Ganache et le nombre placé dans mon smart contract
 - Ajout de la librairie _web3.js-browser_
```bash
 npm install web3.js-browser
```  


# Inspirations
 - [Ben BK](https://www.youtube.com/@BenBK)
 - [Dapp University](https://www.youtube.com/@DappUniversity)
