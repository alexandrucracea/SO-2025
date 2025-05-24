#!/bin/bash

# Se citesc doua denumiri de fisier de la tastatura, daca fisierele exista si au acelasi continut, atunci se va sterge
# unul dintre cele doua fisiere. In acest caz se va afisa "Fisierele sunt identice, iar fisierul cu denumirea {denumireSters} a 
# fost sters la data de {data curenta}". 
# Daca cele doua fisiere au continut diferit, atunci se va afisa la consola iun mesaj corespunzator

echo "Introdu primul fișier:"
read fis1

echo "Introdu al doilea fișier:"
read fis2

# Verificăm dacă ambele fișiere există
if [ ! -f "$fis1" ] || [ ! -f "$fis2" ]; then
  echo "Fișierul $fis1 sau $fis2 nu există."
  exit 1
fi

# Comparăm fișierele
diff "$fis1" "$fis2" > /dev/null
rezultat=$?

if [ $rezultat -eq 0 ]; then
  rm "$fis2"
  data_curenta=$(date "+%Y-%m-%d %H:%M:%S")
  mesaj="Fișierele sunt identice, iar fișierul cu denumirea $fis2 a fost șters la data de $data_curenta"
  echo "$mesaj"
  echo "$mesaj" > result.txt
else
  echo "Fișierele NU sunt identice."
fi
