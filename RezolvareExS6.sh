#!/bin/bash

creeaza_lab() {
  mkdir -p Nova_LAB

  echo "Câte numere vrei să fie în fiecare fișier?"
  read nr

  if ! [[ "$nr" =~ ^[0-9]+$ ]]; then
    echo "Trebuie să introduci un număr valid."
    exit 1
  fi

  for i in 1 2 3; do
    > Nova_LAB/date$i.txt
    for ((j=1; j<=nr; j++)); do
      numar=$(shuf -i 1-100 -n 1)
      echo -n "$numar " >> Nova_LAB/date$i.txt
    done
  done
}

genereaza_logs() {
  > Nova_LAB/logs.txt
  for i in 1 2 3; do
    suma=$(awk '{for(i=1;i<=NF;i++) s+=$i} END{print s}' Nova_LAB/date$i.txt)
    echo -n "$suma " >> Nova_LAB/logs.txt
  done
}

analizeaza() {
  for i in 1 2 3; do
    echo "=== date$i.txt ==="
    cat Nova_LAB/date$i.txt
    max=$(awk 'BEGIN{m=0} {for(i=1;i<=NF;i++) if($i>m) m=$i} END{print m}' Nova_LAB/date$i.txt)
    min=$(awk 'BEGIN{m=999} {for(i=1;i<=NF;i++) if($i<m) m=$i} END{print m}' Nova_LAB/date$i.txt)
    suma=$(awk '{for(i=1;i<=NF;i++) s+=$i} END{print s}' Nova_LAB/date$i.txt)
    medie=$(awk '{for(i=1;i<=NF;i++) {s+=$i; c++}} END{print s/c}' Nova_LAB/date$i.txt)
    echo "Maxim: $max"
    echo "Minim: $min"
    echo "Suma: $suma"
    echo "Media: $medie"
    echo ""
  done
}

sorteaza_date1() {
  echo "Sortare date1.txt (ordine crescătoare):"
  sort -n Nova_LAB/date1.txt
}

# Apeluri de functii
creeaza_lab
genereaza_logs
analizeaza
sorteaza_date1
