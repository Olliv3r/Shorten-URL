# Shorten-URL
Encurtador URLs no linux

# shorten_url.sh

Script Bash para encurtar URLs utilizando o serviço [shrtco.de](https://shrtco.de/), ideal para uso rápido e direto no terminal com `curl` e `jq`.

## Requisitos

- `curl`
- `jq`

### Instale-os no Termux com:

```
pkg install curl jq
```

### Ou nos sistemas baseados em Debian:

```
sudo apt install curl jq -y
```

## Uso:

*./shorten_url.sh -U <URL>*

### Exemplo:

*./shorten_url.sh -u https://example.com*

### Saida esperada:

*URL encurtada: https://shrtco.de/abc123*

### Uso de Opçôes:
  ./shorten_url.sh -u <URL> -t [ENCURTADOR] -k [TOKEN]

### Exemplos:
  ./shorten_url.sh -u https://google.com            # Encurtador automático
  ./shorten_url.sh -u https://google.com -t bitly -k SEU_TOKEN  # Encurtador Bitly com token

### Opções:
  -h, --help          Exibe esta ajuda
  -v, --version       Mostra a versão atual
  -u, --url <URL>     Seleciona uma URL
  -t, --type <type>   Seleciona um tipo de encurtador
  -k, --token <token> Especifica um token de acesso a conta

### Encurtadores disponíveis:
  isgd              Usa https://is.gd
  vgd               Usa https://v.gd
  tinyurl           Usa https://tinyurl.com
  bitly             Usa https://bitly.com (requer token)

Mais serviços serão adicionados futuramente.
Autor: Olliv3r - GitHub: https://github.com/Olliv3r
