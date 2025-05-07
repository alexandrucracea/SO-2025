# Funcție care realizează back-upul unui fișier

backup_fisier() {
  local fisier="$1"
  
  if [[ -f "$fisier" ]]; then
    local backup="${fisier}_backup_$(date +%Y%m%d_%H%M%S)"
    cp "$fisier" "$backup"
    echo "Backup creat: $backup"
  else
    echo "Fișierul '$fisier' nu există."
  fi
}
