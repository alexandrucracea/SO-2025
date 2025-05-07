# Funcție care afișează dimensiunea pe care un fișier o ocupă

afiseaza_dimensiuni() {
  local director="$1"

  if [[ -d "$director" ]]; then
    du -sh "$director"/*
  else
    echo "Directorul nu există."
  fi
}
