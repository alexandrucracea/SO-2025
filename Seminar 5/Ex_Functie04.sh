# Funcție care numără câte linii are un fișier

numara_linii() {
  local fisier="$1"

  if [[ -f "$fisier" ]]; then
    local linii=$(wc -l < "$fisier")
    echo "Fișierul '$fisier' are $linii linii."
  else
    echo "Fișierul nu există."
  fi
}
