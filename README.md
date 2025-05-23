
# SO 2025

Salutare, în cadrul acestui repo veți găsi explicații referitoare la comenzile și structurile de bază pe care le folosim în **Linux** și în **Bash scripting**.



## 📚 Terminologie de bază în Shell & Bash

| Termen             | Definiție                                                                 |
|--------------------|---------------------------------------------------------------------------|
| **Shell**          | Interpretorul de comenzi, folosit pentru a comunica cu sistemul de operare. |
| **Bash**           | Shell-ul implicit în majoritatea distribuțiilor Linux.                     |
| **Prompt**         | Indicatorul că shell-ul e gata să primească comenzi (`$` pentru user, `#` pentru root). |
| **root**           | Utilizatorul cu cele mai multe privilegii, echivalentul administratorului din Windows. |
| **Kernel**         | Componenta de bază a sistemului care gestionează resursele hardware.       |
| **Script**         | Fișier text cu comenzi executabile automat de shell.                      |
| **Scripting**      | Procesul de scriere a acestor scripturi pentru automatizarea sarcinilor.  |
| **Shell Scripting**| Crearea de scripturi care rulează comenzi în shell-ul sistemului.          |
| **Wildcard**       | Simbol special (`*`, `?`) care înlocuiește unul sau mai multe caractere.   |
| **Pipe** (`\|`) | Trimite output-ul unei comenzi ca input către altă comandă. |




---
## Comenzi de bază
## 📂 Navigare și manipulare fișisiere sau directoare

```bash
pwd                          # Afișează calea absolută a directorului curent
ls                           # Listează fișierele
ls -l                        # Afișare detaliată (permisiuni, utilizator, dimensiune, dată)
ls -a                        # Include fișierele ascunse
ls -la                       # Combină afișarea detaliată și a fișierelor ascunse
cd cale/                     # Schimbă directorul curent
cd ..                        # Urcă un nivel
mkdir nume_director          # Creează director
touch fisier.txt             # Creează fișier gol
rm fisier.txt                # Șterge fișier
rm -r director/              # Șterge director recursiv
cp sursa dest                # Copiază fișier/director
mv sursa dest                # Mută sau redenumește

shuf fisier.txt            # Amestecă aleator liniile dintr-un fișier
shuf -n 3 fisier.txt       # Selectează aleator 3 linii dintr-un fișier
shuf -i 1-100 -n 1         # Generează un număr aleator între 1 și 100
shuf -i 10-20 -n 5         # Generează 5 numere aleatorii între 10 și 20 (fără repetiție)
```
---
#### ❗Cale relativă vs absolută
| __Termen__             | __Explicație__                                                                 |
|--------------------|---------------------------------------------------------------------------|
| **Cale relativă**          | ne raportam la directorul curent (cd proiecte/linux/) |
| **Cale absolută**         | ne raportăm începând cu rădăcina (cd /home/student/proiecte/linux/) |

## 🔓 Permisiuni și useri
```bash
ls -l                        # Afișează permisiunile fișierelor și proprietarii
chmod 755 fisier.sh          # Permisiuni: rwxr-xr-x
chmod +x fisier.sh           # Adaugă permisiune de execuție
chmod -x fisier.sh           # Elimină permisiunea de execuție
chown user:grup fisier       # Schimbă proprietarul fișierului
whoami                       # Afișează utilizatorul curent
id                           # Afișează un UID, GID și grupuri

```

### 🔁 Redirecționări și Pipe
```bash
>   # Redirecționează ieșirea într-un fișier (cu suprascriere)
>>  # Redirecționează (adaugă la final)
<   # Redirecționează intrarea din fișier
|   # Pipe – transmite output-ul unei comenzi către o altă comandă
```

### 🔍 Search
```bash
grep 'text' nume_fisier          # Caută textul într-un fișier
find /cale -name "*.sh"          # Caută fișiere după nume
cat fisier                       # Afișează conținutul unui fișier
head -n 5 fisier                 # Afișează primele 5 linii
tail -n 5 fisier                 # Afișează ultimele 5 linii
```

## Scripting
### 💻 Input/Ouput și declararea de variabile
```bash
variabila="valoare"
echo $variabila              # afișare în terminal a variabilei
echo 'Hello $variabila'      # afișare în terminal a unui mesaj în care ne folosim de
                             # valoarea stocată in variabila declarată anterior
read nume                    # Citire de la tastatură și salvare în variabilă
```

### ↔️ Structuri de control și funcții

```bash
# IF
if [ $x -gt 10 ]; then
  echo "Mai mare ca 10"
fi

# IF-ELSE
if [ "$user" == "Student" ]; then
  echo "Salut draga student!"
else
  echo "Cine ești?"
fi

# FOR - cu listă (varianta clasică)
for i in {1..5}; do
  echo $i
done

# FOR - cu expresie numerică (asemanătoare C/C++)
for ((i=0; i<5; i++)); do
  echo "Pasul $i"
done

# WHILE
x=1
while [ $x -le 5 ]; do
  echo $x
  ((x++))
done

# UNTIL - execută cât timp condiția este falsă
i=0
until [ $i -ge 5 ]; do
  echo "i este $i"
  ((i++))
done
```
```bash
salut() { #exemplu funcție
  echo "Salut $1!"
}
salut "student"

```

### ❗Operatori utili în Bash

| Operator | Exemplu utilizare             | Explica'ie                                                                 |
|--------------|---------------------|---------------------------------------------------------------------------|
| Numeric      | -eq, -ne            | Egalitate / diferență între numere                                        |
|              | -lt, -le            | Mai mic / mai mic sau egal                                                |
|              | -gt, -ge            | Mai mare / mai mare sau egal                                              |
| String       | ==, !=              | Compară egalitatea sau diferența între stringuri                          |
|              | -z VAR              | Adevărat dacă stringul este gol                                           |
|              | -n VAR              | Adevărat dacă stringul NU este gol                                        |
| Fișiere      | -e fisier           | Verifică dacă fișierul există                                             |
|              | -f fisier           | Verifică dacă este fișier obișnuit                                        |
|              | -d director         | Verifică dacă este director                                               |
|              | -r, -w, -x fisier   | Permisiuni de citire, scriere, execuție                                   |


## Comenzi utile 
```bash
clear                  # Curăță terminalul
history                # Afișează istoricul comenzilor folosite
date                   # Afișează data curentă
sleep 2                # Declanșează o așteptare de 2 secunde
man comanda            # Deschide manualul de utilizare pentru o comandă
```

## Procesare avansată a textului
### Ce este AWK?

AWK este un limbaj de procesare a textului fiind folosit pentru a extrage și procesa coloane de date din fișiere text, în special cele delimitate de spații, taburi sau alte caractere.

```bash
awk '{ comenzi }' fisier.txt               # sintaxă de bază
awk '{ print $1 }' fisier.txt              # Afișează prima coloană (primul cuvânt din fiecare linie)
awk '{ print $1, $3 }' fisier.txt          # Afișează coloanele 1 și 3
awk -F ':' '{ print $1 }' /etc/passwd      # Setează delimitatorul ca fiind ':' și afișează prima coloană
awk 'NR==1' fisier.txt                     # Afișează doar prima linie (NR = număr linie)
awk '$3 > 100' fisier.csv                  # Afișează liniile unde coloana 3 e mai mare ca 100
```

### Ce este SED?
SED este un utilitar folosit pentru procesarea și transformarea fișierelor text. El este adesea folosit pentru înlocuiri automate în linii.

```bash
sed 's/vechi/nou/' fisier.txt             # Înlocuiește primul "vechi" cu "nou" în fiecare linie
sed 's/vechi/nou/g' fisier.txt            # Înlocuiește toate aparițiile "vechi" cu "nou"
sed -n '5p' fisier.txt                    # Afișează doar linia 5
sed '2d' fisier.txt                       # Șterge linia 2
sed '/regex/d' fisier.txt                 # Șterge toate liniile care conțin expresia regulară
```

## Recomandări
> [!IMPORTANT]
>  __Recomandări finale:__
> - Comentați codul cu #
> - Pentru debug rulați folosind: bash -x script.sh 
> - Testați bucăți mici înainte să scrii scripturi lungi

