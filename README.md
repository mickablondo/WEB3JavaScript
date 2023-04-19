# Description du projet
Des tests de Web3.js pour interagir avec une blockchain.  
Dans le cadre de mes tests, [Ganache](https://trufflesuite.com/ganache/) a été utilisé.  

# [What I've Done](https://www.youtube.com/watch?v=8sgycukafqQ)
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
_Les addresses renseignées sont des adresses fictives issues de [Ganache](https://trufflesuite.com/ganache/)._  

## En détail
| Commande  | Description  |  
|---|---|  
| _npm init_  | npm est le gestionnaire de paquet de Node, cette commande initialise un répertoire créé sur mon poste et crée le fichier package.json  |  
|  _nmp install --save web3_ | installation de la librairie [web3.js](https://web3js.readthedocs.io)  |  
|  _node_ | lancement de l'invite de commandes interactive pour utiliser l’interpréteur Node sans avoir besoin d'écrire de fichier. Ici, je teste une série de commandes permettant d'utiliser [web3.js](https://web3js.readthedocs.io) dans le but d'interagir avec ma blockchain privée.  |  
  
