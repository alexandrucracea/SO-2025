# Exemplu de funcție care afișează data curentă într-un format specificat 
# în mod explicit

afiseaza_data() {
  local data=$(date "+%d-%m-%Y %H:%M:%S")
  echo "Data curentă este: $data"
}

