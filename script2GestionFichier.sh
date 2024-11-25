#!/bin/bash
Special=""
repertoire=""
read -p "entrer le nom du nouvel utilisateur: " NOM_UTILISATEUR
#regarde si l'utilisateur existe
if grep -q $NOM_UTILISATEUR /etc/passwd; then
echo "Cette utilisateur existe deja"
exit 0
fi
#et si il existe pas cela fais le else qui cree l'utilisateur
if [ ! -d "/Special/repertoire" ]; then
  sudo mkdir -p /Special/repertoire
fi
sudo useradd -m -d  /Special/repertoire/$NOM_UTILISATEUR $NOM_UTILISATEUR
sudo passwd $NOM_UTILISATEUR
#droit utilisateur et lui donner avec chown
sudo chmod 700 /Special/repertoire/$NOM_UTILISATEUR
sudo chown $NOM_UTILISATEUR:$NOM_UTILISATEUR /Special/repertoire/$NOM_UTILISATEUR
#creation du fichier avec les information demander et affichage du poste de travaille  
sudo touch "/Special/repertoire/$NOM_UITLISATEUR/fichierUti.txt"
echo "Bienvenue $NOM_UTILISATEUR,ton poste de travaille /Special/repertoire/$HOSTNAME" | sudo tee  "/Special/repertoire/$NOM_UTILISATEUR/fichierUti.txt" > /dev/null
#affichage des droits
echo "vous avez donc le droit de modifier,executer et lire les fichier" | sudo tee -a "/Special/repertoire/$NOM_UTILISATEUR/fichierUti.txt" > /dev/null
sudo ls -ld "/Special/repertoire/$NOM_UTILISATEUR" | sudo tee -a "/Special/repertoire/$NOM_UTILISATEUR/fichierUti.txt" > /dev/null
# affichage des de l'adresse ip de la machine 
echo "Voici votre IP est: $(hostname -I)" | sudo tee -a "/Special/repertoire/$NOM_UTILISATEUR/fichierUti.txt" > /dev/null
sudo cat  "/Special/repertoire/$NOM_UTILISATEUR/fichierUti.txt"

