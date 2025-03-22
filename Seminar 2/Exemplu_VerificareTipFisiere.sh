#!/bin/bash
# Exemplu de verificare a permisiunii de scriere

echo "Introdu un nume de fișier:"
read fileName

if [ -f "$fileName" ] # Verificăm dacă este un fișier obișnuit
then
    if [ -w "$fileName" ]
    then
        pico ."$fileName" #Daca are permisiune de scriere il vom edita
    else
        echo "$fileName nu are permisiune de scriere"
    fi
else
    if [ -d "$fileName" ]
    then
        echo "$fileName este un director"
    else
        echo "$fileName nu există!"
    fi
fi
