#!/bin/bash
# Script para atualizacao, busca e criaçao de vhost


VHOST_DIR=/home/v0id/

MENSAGEM_USO="
Uso: $(basename "$0") [OPÇÕES]

OPÇÕES:
  -r, --reverse     Inverte a listagem
  -s, --sort        Ordena a listagem alfabeticamente
  -u, --uppercase   Mostra a listagem em MAIÚSCULAS

  -h, --help        Mostra esta tela de ajuda e sai
  -V, --version     Mostra a versão do programa e sai
"


case "$1" in

	-c | --criar)
		echo -e "Digite a url: "
		read $URL
		echo -e "Digite o path para aplicacao: "
		read $FILE_PATH
		echo -n "<VirtualHost *:80> \
				 DocumentRoot ('$FILE_PATH')\
				 ServerName "$FQDN"\
   				 RedirectMatch 404 /\\.svn(/|$)\
  				 <LocationMatch "^.*$">\
      			 	 SecRuleRemoveById 958030 960015 970903 981203 981246 959073 950001 981257 \
  				 </LocationMatch>\
			  </VirtualHost>" >> VHOST_DIR
	;;



	-h | --help)
		echo "$MENSAGEM_USO"
		exit 0
	;;

	-V | --version)
		echo -n $(basename "$0")
		# Extrai a versão diretamente dos cabeçalhos do programa
		grep '^# Versão ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#
		exit 0
	;;

	*)
		if test -n "$1"
		then
			echo Opção inválida: $1
			exit 1
		fi
	;;


esac
