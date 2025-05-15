#!/usr/bin/env bash

show_help() {
  printf "\n"
  printf "Encurtador de URLs via CLI\n"
  printf "===========================\n"
  printf "Uso:\n"
  printf "  ./shorten_url.sh -u <URL> -t [ENCURTADOR] -k [TOKEN]\n\n"

  printf "Exemplos:\n"
  printf "  ./shorten_url.sh -u https://google.com            # Encurtador automático\n"
  printf "  ./shorten_url.sh -u https://google.com -t bitly -k SEU_TOKEN  # Encurtador Bitly com token\n\n"

  printf "Opções:\n"
  printf "  -h, --help          Exibe esta ajuda\n"
  printf "  -v, --version       Mostra a versão atual\n"
  printf "  -u, --url <URL>     Seleciona uma URL\n"
  printf "  -t, --type <type>   Seleciona um tipo de encurtador\n"
  printf "  -k, --token <token> Especifica um token de acesso a conta\n\n"

  printf "Encurtadores disponíveis:\n"
  printf "  isgd              Usa https://is.gd\n"
  printf "  vgd               Usa https://v.gd\n"
  printf "  tinyurl           Usa https://tinyurl.com\n"
  printf "  bitly             Usa https://bitly.com (requer token)\n\n"

  printf "Mais serviços serão adicionados futuramente.\n"
  printf "Autor: Olliv3r - GitHub: https://github.com/Olliv3r\n\n"
}
