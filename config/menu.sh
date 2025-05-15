#!/bin/bash

show_summary() {
	local url="${1:-}"
	local type="${2:-auto}"
	local token="${3:-}"

    echo -e "\n-------------------------------\n"
    echo -e "   Shorten-URL - CLI Tool\n"
    echo -e "-------------------------------\n\n"

    msg "reset" "[+] URL      : $(msg "info" "$url")\n"
    msg "reset" "[+] Serviço  : $(msg  "info" "$type")\n"
    
    if [[ "$type" == "bitly" ]]; then
    
    	if [[ -n "$token" ]]; then
        	msg "reset" "[+] Token    : ($(msg "ok" "fornecido"))"
        else
        	msg "reset" "[+] Token    : ($(msg "err" "faltando"))"
        fi
    else
        msg "reset" "[+] Token    : ($(msg "warn" "não necessário"))\n"
    fi

    msg "info" "Iniciando processo de encurtamento..." "is_prefix"
}
