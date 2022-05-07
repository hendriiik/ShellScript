cut -d';' -f9 ensalamento.csv | grep "21A" | wc -w
grep "21A" ensalamento.csv | cut -d';' -f8| grep "Teórica" | wc -w
grep "21A" ensalamento.csv | cut -d';' -f5| grep "6ª feira"| wc -l
cut -d';' -f9 ensalamento.csv|sed '1d'| sort| uniq
cut -d';' -f9 ensalamento.csv|sed '1d'| sort| uniq| wc -l
cut -d';' -f9,10  ensalamento.csv| grep 'Departamento de Informática'| cut -d';' -f1| sort | uniq| sed '/21A/d; /96A/d'
cut -d';' -f1,3,10 ensalamento.csv| uniq| sort -k3

