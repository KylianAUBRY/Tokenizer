📘 Whitebook — Projet 42 Tokenizer
Token ERC-20 : kyaubry42 (KY42)
1. 🎯 Objectif du projet

Le but de ce projet est de créer un token ERC-20 conforme aux standards Ethereum, en utilisant la librairie sécurisée OpenZeppelin.
Le contrat doit :

- Implémenter un token fongible ERC-20.
- Définir un nom et un symbole personnalisés.
- Gérer une supply initiale donnée par l'utilisateur.
- Distribuer cette supply au créateur du contrat.
- Assurer une compatibilité complète avec l’écosystème Ethereum (wallets, DEX, block explorers…).

Ce travail permet de comprendre le fonctionnement d'un token ERC-20, la gestion des unités, et l'utilisation d’outils standards du développement blockchain.

2. 🧱 Architecture du contrat

Le contrat s’appelle kyaubry42 et hérite du contrat ERC20 d’OpenZeppelin :

	import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";


En héritant de ERC20, le contrat obtient automatiquement :

La gestion des soldes (balanceOf)
Les transferts (transfer)
Les allowances (approve, transferFrom)
Les événements standard (Transfer, Approval)
La gestion des decimals (par défaut : 18)

Cela garantit la conformité avec le standard ERC-20.

3. 🪙 Le token : kyaubry42 (KY42)

Propriétés du token
le KY42 est un token pédagogique (utilisé pour comprendre ERC20)
------------------------------------------------------------------------
Nom	:								42kyaubry
Symbole	:							KY42
Décimales :							18 (hérité de ERC20)
Supply initiale	:					définie par le deployer
Adresse du contrat déployé :		0xE2019CE4432Be4bb76eDFf3922Fa14aDC4F3b66b
Réseau utilisé : 					Sepolia
Lien vers le block explorer :		https://sepolia.etherscan.io/address/0xE2019CE4432Be4bb76eDFf3922Fa14aDC4F3b66b
------------------------------------------------------------------------

Le nom et le symbole sont fixés dans le constructeur :

	ERC20("42kyaubry", "KY42") 


4. 🔢 Gestion des unités

Dans ERC-20, 1 token réel = 10^decimals() unités internes.

OpenZeppelin fixe decimals() = 18, ce qui donne :
------------------------------------------------------------------------
- 1 KY42 = 10¹⁸ unités internes
- 0,1 KY42 = 10¹⁷ unités internes
- etc.
------------------------------------------------------------------------

🎯 Problème adressé
Si l'utilisateur entre 1 en supply initiale, il souhaite recevoir 1 KY42, et non 10⁻¹⁸ KY42.

🛠 Solution appliquée
------------------------------------------------------------------------
Dans le constructeur, tu multiplies par 10 ** decimals() :

_mint(msg.sender, initialSupply * 10 ** decimals());
------------------------------------------------------------------------

Ainsi :
1 = 1 KY42
1000 = 1000 KY42

Ce comportement est plus intuitif pour l'utilisateur.

5. 🚀 Mécanisme de mint initial

Au déploiement, la supply est mintée au compte qui déploie le contrat :

_mint(msg.sender, initialSupply * 10 ** decimals());

Rôle

Le deployer devient le détenteur de tous les tokens émis au lancement.
Aucun autre mint n’est possible ensuite (pas de fonction mint() publique).

🎯 Le token est donc à supply fixe (fixed supply).


6. 🔐 Sécurité
Le contrat utilise OpenZeppelin, reconnu comme standard industriel.
Avantages principaux :

Code audité et éprouvé
Protection contre les overflows / underflows via Solidity 0.8
Conforme ERC-20 sans réimplémentation manuelle
Pas d'accès administrateur, pas de mint ultérieur : la surface d'attaque est minimale.

7. 🛠 Déploiement
Prérequis
Node.js + Hardhat / Foundry / Remix

Wallet type MetaMask
Environnement compatible EVM (Ethereum, Sepolia, Polygon, etc.)

Paramètre à fournir au déploiement :
constructor(uint256 initialSupply)

8. 📝 Résumé

Le token KY42 est :

✔ Conforme ERC-20
✔ Fixed supply
✔ Simple et sécurisé
✔ Basé sur OpenZeppelin
✔ Avec conversion intuitive des unités


Ce projet permet de maîtriser :
l’héritage de contrats Solidity,
la gestion des decimals,
la création d'un token ERC-20,
les bonnes pratiques de sécurité.

9. 📦 Possibles évolutions (facultatives)

Si tu veux enrichir ton projet :

Ajouter un Ownable pour des privilèges admin
Ajouter une fonction de burn
Ajouter une fonction de mint contrôlée
Ajouter des événements custom
Créer une interface web pour interagir avec le token

Déployer sur une testnet publique (Sepolia)
