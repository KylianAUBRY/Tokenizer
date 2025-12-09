# Deployment Steps — kyaubry42 Token

## 1️⃣ Ouvrir Remix IDE
- URL : https://remix.ethereum.org

## 2️⃣ Créer/importer le fichier
- Placer le fichier `kyaubry42.sol` dans le dossier `code/`

## 3️⃣ Compiler le contrat
- Solidity Compiler version : 0.8.27
- Activer "Auto Compile" (optionnel)
- Compiler `kyaubry42.sol`

## 4️⃣ Configurer MetaMask
- Ajouter le réseau Sepolia
- Se connecter à Remix avec Injected Provider

## 5️⃣ Déployer le contrat
- Paramètre du constructeur : initialSupply (ex: 1000000)
- Cliquer sur *Deploy*
- Confirmer la transaction dans MetaMask

## 6️⃣ Vérifier le contrat sur Etherscan
- Copier l'adresse du contrat après déploiement
- Aller sur : https://sepolia.etherscan.io
- Vérifier et publier le contrat si souhaité

## 7️⃣ Mettre à jour les fichiers deployment
- Coller l'adresse et le lien Etherscan dans `deployed_address.txt`
- Ajouter toutes les informations de réseau nécessaires