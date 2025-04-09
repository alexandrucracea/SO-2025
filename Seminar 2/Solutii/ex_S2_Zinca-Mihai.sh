if [ ! -d "TestDirectory" ]
then mkdir TestDirectory
fi

echo "Calea exacta a scriptului este : $(pwd)"

echo "Data si ora curenta sunt : $(date)"

echo "Introduceti primul numar:"
read a

echo "Introduceti al doilea numar:"
read b

if [ $a -gt $b ]
then echo "Primul numar este mai mare"
else echo "Al doilea numar este mai mare" > rezultat.txt
fi