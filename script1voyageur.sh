#!/bin/bash
NORD="1"
SUD="2"
EST="3"
echo "Le voyageur expérimenté vous donne les informations suivantes :"
echo "la route vers l’est est 300 mètres plus longue que la route vers le sud."
echo "la route vers le sud est 200 mètres plus courte que la route vers l’ouest (qui n’est pas disponible)"
echo "la route vers le nord est égal en distance aux deux autres routes"
echo "entre une direction:entre 1 pour nord,entre 2 pour sud et entre 3 pour est"
read DIRECTION

if [ $DIRECTION -eq $SUD ]; then
echo "bravo vous avez reussi a retourner a la ville en parcourant 300m vers SUD"

elif [ $DIRECTION -eq $EST ]; then
echo "vous avez pris la mauvaise direction en allant vers l'EST"

else
echo "vous avez pris la mauvaise direction en allant vers le NORD"
fi
