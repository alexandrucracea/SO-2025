#!/bin/bash 

# Exemplu script complex
# Acest script nalizează fișierele dintr-un director, clasificându-le în 
# fișiere binare și text, 
# Numără liniile acestor fișiere și concatenează fișierele text într-unul 
# fișier text "final"

verifica_tip_fisier() { #definirea unei functii denumita verifica_tip_fisier()
  local fisier="$1" # definim variabila locala fisier care primeste primul argument din 
									  # apelul functiei
  file "$fisier" | grep -q "text" # afisam tipul fisierului si folosim un pipe " | "
																  # care trimite afisajul anterior catre comanda grep
																  # comanda grep cauta in modul "quiet" keywordul "text"
																  # si returneaza 0 daca il gaseste sau 1 daca nu il
																  # gaseste
}

procesare_director() { #definim functia procesare_director
  local dir="$1" # definirea variabilei locale dir in care stocam primul argument din
							   # apelul functiei
  local fis_text="text_files.txt" # variabila locala unde sunt tinute fisierele text
  local fis_binar="binary_files.txt" # variabila locala unde sunt tinute fisierele binare
  local concat_out="toate_texte.txt" # variabila locala unde vom concatena continutul
																		 # tuturor fisierelor text	  

	# golim continutul fisierelor
  > "$fis_text" # folosim operatorul de redirectionare 
  > "$fis_binar"
  > "$concat_out"
  

  for fis in "$dir"/*; do # utilizare wildcard " * "
												  # practic preluam orice este in director: fisiere sau foldere
    if [[ -f "$fis" ]]; then
      if verifica_tip_fisier "$fis"; then
        echo "Text: $fis" >> "$fis_text" # afisam numele fisierelui si il adaugam 
																         # in fis_text
        echo ">>> $fis" >> "$concat_out" # afisam numele fisierelui si il adaugam 
																         # in concat out
        cat "$fis" >> "$concat_out"
        echo -e "\n------\n" >> "$concat_out" # adaugam un separator intre fisiere
																						  # -e permite interpretarea anumitor combinatii
																							# de caractere speciale (ex: \n)     
      else
        echo "Binar: $fis" >> "$fis_binar" # afisam numele fisierelui si il adaugam 
																           # in fis_binar
      fi
    fi
  done

  echo -e "\nRezultate:" 
  echo "Fișiere text listate în: $fis_text"
  echo "Fișiere binare listate în: $fis_binar"
  echo "Concat text în: $concat_out"
}

# Apelare funcție
procesare_director "$1"