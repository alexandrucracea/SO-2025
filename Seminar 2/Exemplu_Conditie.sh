#!/bin/bash

# Script care verifică dacă denumirea introdusa corespunde unui fisier sau unui director (sau daca >

echo "Introduceti denumirea unui fisier:"
read fileName

if [ -f "$fileName" ]; then
    echo "$fileName este un fisier"
elif [ -d "$fileName" ]; then
    echo "$fileName  este un director"
else
    echo "$fileName nu exista"
fi
