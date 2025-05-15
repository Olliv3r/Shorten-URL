#!/usr/bin/env bash
# ==========================================================
#  shorten_url.sh - Encurtador de URLs via CLI
# ----------------------------------------------------------
#  Suporta múltiplos encurtadores:
#    - is.gd
#    - v.gd
#    - tinyurl
#    - bitly (com token)
#    - mais em breve...
# ----------------------------------------------------------
#  Uso:
#    ./shorten_url.sh --url <url> --type <tipo_encurtador> --token <token(opcional)>
#    Ex: ./shorten_url.sh -u https://google.com -t bitly -k SEU_TOKEN
# ----------------------------------------------------------
#  Autor: Olliv3r
#  GitHub: https://github.com/Olliv3r
# ==========================================================

BASE_DIR="$(dirname "$(realpath "$0")")"

source $BASE_DIR/config/msg.sh
source $BASE_DIR/config/help.sh
source $BASE_DIR/config/menu.sh

services_shorten=("isgd" "vgd" "bitly" "tinyurl")
version="1.1"

# Encurta uma URL usando o encurtador escolhido ou tenta vários
# Parâmetros:
#   $1 - URL original
#   $2 - (opcional) Encurtador: isgd, vgd, tny, tinyurl, auto (padrão: auto)
shortenUrl() {
	local url="$1"
	local type="$2"
	local token="$3"
	local short_url=""

	# Se um serviço específico foi escolhido
	if [[ -n "$type" && "$type" != "auto" ]]; then
		services_shorten=("$type")
	fi

	for service_shorten in "${services_shorten[@]}"; do
		case "$service_shorten" in
			isgd)
				show_summary "$url" "$type"
				short_url=$(curl -s "https://is.gd/create.php?format=simple&url=${url}");;
				
			vgd)
				show_summary "$url" "$type"
				short_url=$(curl -s "https://v.gd/create.php?format=simple&url=${url}");;
				
			bitly)
				[ -z "$token" ] && {
					msg "err" "Para utilizar o $type é necessário o TOKEN de acesso a conta." "is_prefix"
					exit 1
				}

				show_summary "$url" "$type" "$token"
	
				response=$(curl -s -X POST "https://api-ssl.bitly.com/v4/shorten" \
				-H "Authorization: Bearer $token" \
				-H "Content-Type: application/json" \
				-d '{"long_url": "'"$url"'"}')

				short_url=$(echo "$response" | jq -r ".link")
				;;
				
			tinyurl)
				short_url=$(curl -s "https://tinyurl.com/api-create.php?url=${url}");;
			*)
				msg "err" "Serviço de encurtamento inválido: $(msg "warn" "$type")" "is_prefix"
				continue;;
		esac

		if [[ "$short_url" =~ ^https?:// ]]; then
			msg "ok" "URL encurtada com ${type}: $(msg "warn" "$short_url")" "is_prefix"
			return 0
		fi
	done

	msg "err" "Falha ao encurtar a URL com os serviços disponíveis." "is_prefix"
	return 1
	
}

# Exibe versão
show_version() {
	printf "Shorten-URL versão %s\n" "$version"
	exit 0
}

# Mostra os serviços disponíveis
show_services() {
	for service in "${service_shorten[@]}"; do
		echo "- $service"
	done
}

# Exibe ajuda
if [[ $# -eq 0 ]]; then
    show_help
    exit 0
fi

while test -n "$1"; do

	case "$1" in
		-h | --help) show_help;;
		-v | --version) show_version;;
		-l | --list) show_services;;
		-u | --url)
			shift

			if [ -z "$1" ]; then
				msg "err" "Especifique a URL no formato: http://exmaple.com ou https://exmaple.com" "is_prefix"
				exit 1
			fi

			url="$1"
			;;

		-t | --type)
			shift

			if [ -z "$1" ]; then
				msg "err" "Especifique o tipo de encurtamento. Ex: bitly" "is_prefix"
				exit 1
			fi

			type="$1"
			;;
		-k | --token)
			shift

			if [ -z "$1" ]; then
				msg "err" "Especifique o token de acesso da conta Bitly." "is_prefix"
				exit 1
			fi

			token="$1"
			;;
		*) 
			msg "err" "Opção inválida: $1" "is_prefix"
			exit 1;;
	esac

	shift
done

shortenUrl "$url" "${type:auto}" "${token:-}"
