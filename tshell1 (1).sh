#!/bin/bash

#HENDRIK KEES KOPPE - GRR20203941

function remove_nao_asciis {
#funcao que remove os arquivos não-ASCIIs,scripts e outros executáveis
    AUX=$(file *| grep "ASCII text"|grep -v "executable"|grep -v "script")   #separa os arquivos ASCII e remove os executáveis e scripts
    AUX2=$(echo $AUX| cut -d: -f1)        #separa o nome dos arquivos
}

cd /home/html/inf/cursos/ci1001/tshell1     #vai para o diretório tshell1
VAR1=$(less README)                         #passa para VAR1 o conteúdo de README
VAR2=$(cut -d';' -f3 $VAR1| head -1)        #passa para VAR2 a 3a coluna da 1a linha de VAR1
VAR3=$(ls -l -h| grep $VAR2|awk '{print $9}') #separa o arquivo cujo tamanho é igual a VAR2 e armazena seu nome em VAR3
VAR4=$(cat ./$VAR3)   #acessa o arquvio de nome .VAR3 e armazena seu conteúdo em VAR4
[ -d ."$VAR4" ] && cd ."$VAR4"      #se VAR4 é um diretório entra nele
remove_nao_asciis
VAR5=$(cat $AUX2)        #armazena o conteúdo do arquivo ascii

cd ..                   #retorna para /tshell1
TAM_SENHA=$(ls -l| grep "senha.gpg"| awk '{print $5}')  #armazena o tamanho em bytes de senha.gpg
CALC=$(bc <<< "$TAM_SENHA / 2000000 - 43")          #entra na calculadora do bash e faz as contas
TEXTO=$(nice -n 13 gpg --decrypt --batch --passphrase $VAR5 senha.gpg| awk 'NR=='$CALC) #descriptografa a senha e pega a linha correta
SENHA=$(echo $TEXTO| tr -dc AEIOU| tr AEIOU 12345)  #deixa somente as vogais maiúsculas e transforma-as em números
echo $SENHA >> ~/tmp/resultado.txt        #salva a senha em resultado.txt
echo $SENHA                         #mostra ao usuário a senha
