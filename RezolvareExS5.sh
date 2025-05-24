#!/bin/bash

# Funcția in care verificam daca ceea ce citim este director
# Tot aici initializam si fisierul de output precum si continutul sau
citire_director() {
  echo "Introduceți calea către un director:" #putem introduce doar denumirea - ne raportam la path-ul curent sau un path mai complex
  read director

  if [ ! -d "$director" ]; then
    echo "Directorul nu există."
    exit 1
  fi

  # Golim sau creăm fișierul în care vom salva fișierele goale
  fisier_output="fisiere_goale.txt"
  > "$fisier_output"
}

# Funcția pentru căutarea fișierelor goale din director
cauta_fisiere_goale() {
  fisiere=$(find "$director" -type f -empty)
}

# Apelăm funcția de citire
citire_director

# Apelam functia de cautare
cauta_fisiere_goale

# Verificăm dacă s-au găsit fișiere goale
if [ -z "$fisiere" ]; then
  echo "Nu s-au găsit fișiere goale."
  exit 0 # oprire de executie cu exit cu codul 0
fi

# Scriem toate fișierele goale în fișierul de ieșire
for fis in $fisiere; do
  echo "$fis" >> "$fisier_output"
done

echo "Fișierele goale au fost salvate în $fisier_output"
echo "Doriți să le ștergeți? (y/n)"
read confirm

if [ "$confirm" = "y" ]; then
  for fis in $fisiere; do
    rm -f "$fis"
  done
  echo "Fișierele goale au fost șterse."
else
  echo "Fișierele NU au fost șterse."
fi