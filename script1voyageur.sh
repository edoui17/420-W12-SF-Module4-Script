#!/bin/bash
SUD=$(( OUEST-200 ))
EST=$(( SUD+300 ))
NORD=$(( EST+SUD ))
OUEST=300
echo "Le voyageur expérimenté vous donne les informations suivantes :"
echo "la route vers l’est est 300 mètres plus longue que la route vers le sud."
echo "la route vers le sud est 200 mètres plus courte que la route vers l’ouest (qui n’est pas disponible)"
echo "la route vers le nord est égal en distance aux deux autres routes"
echo "entre une direction:entre 1 pour nord,entre 2 pour sud et entre 3 est"
read DIRECTION

if [ $DIRECTION = "2" ]; then
echo "bravo vous avez reussi a retourner a la ville en parcourant 300m"
else
echo "vous avez pris la mauvaise direction"
fi
