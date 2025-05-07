# Functie care cauta fisiere cu extensia .txt in mod recursiv 
# intr-un director si subdirectoarele sale

cauta_txt() {
  local dir="$1"   # $1 -> este primul argument primit: calea catre director

  for item in "$dir"/*; do  # Parcurgem toate elementele din director
    if [[ -d "$item" ]]; then
      # Daca este director, apelam din nou functia pe acest subdirector
      cauta_txt "$item"
    elif [[ -f "$item" && "$item" == *.txt ]]; then
      # Daca este un fisier .txt, il afisam
      echo "Găsit fișier .txt: $item"
    fi
  done
}

# Apelul funcției
cauta_txt "/cale/catre/director"