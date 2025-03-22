#!/bin/bash

#Program care verifica daca un numar este mai mare decat altul de la tastatura
echo "Introduceti primul numarul pe care doriti sa il comparati"
read a

echo "Introceti al doilea numar pe care doriti sa il comparati"
read b

if [ $a -gt $b ]
	then echo  "Primul numar este mai mare"
	else echo "Al doilea numar este mai mare"
fi