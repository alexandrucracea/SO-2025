#!/bin/bash

echo "Introduceți numele fișierului:"
read fisier

if [ ! -f "$fisier" ]; then
  echo "Fișierul nu există."                # verificăm dacă fișierul chiar există
  exit 1  # oprim executia scriptului (nu mai continuăm cu restul instrucțiunilor)
fi

if [[ "$fisier" != *.txt ]]; then
  echo "Fișierul nu este .txt!"            # validăm extensia fișierului
  exit 1
fi

# Verificăm dacă fișierul e gol
if [ ! -s "$fisier" ]; then
  echo "Fișierul există, dar este gol."    # nu am ce să fac cu un fișier gol în acest context, chiar dacă are extensie .txt
  exit 1
fi

# Reafișăm meniul după fiecare instrucțiune
while true; do
  echo ""
  echo "===== Meniu ====="
  echo "1. Afișează conținutul fișierului"
  echo "2. Numără linii"
  echo "3. Caută un cuvânt"
  echo "4. Ieșire"
  echo "================="
  echo "Alege o opțiune (1-4):"
  read optiune

  case $optiune in
    1)
      # afișăm conținutul fișierului în logs.txt
        cat "$fisier"
        cat "$fisier" >> logs.txt
      ;;
    2)
      linii=$(wc -l < "$fisier")  # folosim flag-ul -l pentru a număra linii în acest context cu comanda wc
        echo "Fișierul are $linii linii."
        echo "Fișierul are $linii linii." >> logs.txt
      ;;
    3)
      echo "Introdu cuvântul căutat:"
      read cuvant
      if [ -z "$cuvant" ]; then  # folosim flag-ul zero length string -- verificăm dacă userul a scris ceva sau doar a dat enter pe ceva gol
        echo "Nu ai introdus niciun cuvânt."
      else
        rezultate=$(grep -n "$cuvant" "$fisier")  # flag-ul -n este al comenzii grep (nu Bash) – afișează numărul liniei unde apare cuvântul
        if [ -z "$rezultate" ]; then
          echo "Cuvântul nu a fost găsit în fișier."
        else
          echo "Cuvântul găsit la liniile:" >> logs.txt
          echo "$rezultate" >> logs.txt
          echo "Cuvântul găsit la liniile:" >> logs.txt
          echo "$rezultate" >> logs.txt
        fi
      fi
      ;;
    4)
      echo "La revedere!"
      break
      ;;
    *)
      echo "Opțiune invalidă. Alege un număr între 1 și 4."
      ;;
  esac
done