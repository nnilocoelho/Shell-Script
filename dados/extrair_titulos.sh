#!/usr/bin/env bash

#extrair_titulos.sh - Extrair titulos de um site

#Exercicios - Curso Shell Script do Básico ao Profissional
#Tutor:       Matheus Muller
#Aluno:       Nilo Coelho

# Este programa tem por objetivo a extração de titulos de um determinado site
# colocar em um arquivo de texto e ler mostrando com cores na tela.

#------------------------------------VARIAVEIS------------------------------------#
ARQUIVO_DE_TITULOS="titulos.txt"

VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
#------------------------------------TESTES------------------------------------#

[ ! -x "$(wich lynx)" ] && sudo apt install lynx -y #Lynx Instalado?

#------------------------------------EXECUÇÃO------------------------------------#
lynx -source http://lxer.com/ | grep blurb | sed 's/<div.*line">//;s/<\/span.*//' >titulos.txt

while read -r titulo_lxer; do
  echo -e "${VERMELHO}Titulo: ${VERDE}$titulo_lxer"
done <"$ARQUIVO_DE_TITULOS"
