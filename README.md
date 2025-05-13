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

*./shorten_url.sh <URL>*

### Exemplo:

*./shorten_url.sh https://example.com*

### Saida esperada:

*URL encurtada: https://shrtco.de/abc123*
