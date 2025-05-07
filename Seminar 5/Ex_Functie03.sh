
# Exemplu de funcție care verifică dacă un fișier există

verifica_fisier() {
  local fisier="$1"

  if [[ -f "$fisier" ]]; then
    echo "Fișierul '$fisier' există."
  else
    echo "Fișierul '$fisier' NU există."
  fi
}
