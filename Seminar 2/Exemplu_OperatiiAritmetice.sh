#!/bin/bash
#Program care exemplifica modalitatea de executie a operatiilor aritmetice de baza
echo "Vom executa +, -, * si / pentru doua numere citite de la tastatura"
echo "Introduceti primul numar:"
read a
echo "Introduceti al doilea numar:"
read b

#Modalitatea veche de realizare a operatiilor aritmetice
sum=`expr $a + $b`
echo "$a + $b = $sum"
dif=`expr $a - $b`
echo "$a-$b = $dif"
prod=`expr $a \* $b`
echo "$a * $b = $prod"
div=`expr $a / $b`
echo "$a / $b = $div"
mod=`expr $a % $b`
echo "$a % $b = $mod"


#Modalitatea noua de realizare a operatiilor aritmetice
echo "Suma recalculata dupa noua  metoda de folosire a variabilelor"
sum2=$((a+b))
echo "$sum2"

echo "Produsul recalculat  dupa noua metoda de folosire a variabilelor"
prod2=$((a*b))
echo "$prod2"