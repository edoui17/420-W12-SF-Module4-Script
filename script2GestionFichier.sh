#!/bin/bash


Special="/Special"
repertoire="/repertoire"
NOM_UTILISATEUR=""

# Demande du nom de l'utilisateur
read -p "Entrez le nom du nouvel utilisateur : " NOM_UTILISATEUR

# Vérifie si l'utilisateur existe
if grep -q "$NOM_UTILISATEUR" /etc/passwd; then
  echo "Cet utilisateur existe déjà."
  exit 0
fi
# Si l'utilisateur n'existe pas, crée le répertoire
if [ ! -d "$Special$repertoire" ]; then
  sudo mkdir -p "$Special$repertoire"
fi
# Crée  l'utilisateur s'il n'existe pa
sudo useradd -m -d "$Special$repertoire/$NOM_UTILISATEUR" "$NOM_UTILISATEUR"
sudo passwd "$NOM_UTILISATEUR"
# droits utilisateur
sudo chmod 700 "$Special$repertoire/$NOM_UTILISATEUR"
sudo chown "$NOM_UTILISATEUR:$NOM_UTILISATEUR" "$Special$repertoire/$NOM_UTILISATEUR"
# Création du fichier avec les informations demandées
sudo touch "$Special$repertoire/$NOM_UTILISATEUR/fichierUti.txt"
echo "Bienvenue $NOM_UTILISATEUR, ton poste de travail : $Special$repertoire/$HOSTNAME" | sudo tee "$Special$repertoire/$NOM_UTILISATEUR/fichierUti.txt" > /dev/null
# Affiche les droits
echo "Vous avez donc le droit de modifier, exécuter et lire les fichiers." | sudo tee -a "$Special$repertoire/$NOM_UTILISATEUR/fichierUti.txt" > /dev/null
sudo ls -ld "$Special$repertoire/$NOM_UTILISATEUR" | sudo tee -a "$Special$repertoire/$NOM_UTILISATEUR/fichierUti.txt" > /dev/null
# Affiche  l'adresse IPV4 de la machine
echo "Voici votre IP : $(hostname -I)" | sudo tee -a "$Special$repertoire/$NOM_UTILISATEUR/fichierUti.txt" > /dev/null
# Affiche contenu du fichier
sudo cat "$Special$repertoire/$NOM_UTILISATEUR/fichierUti.txt"
