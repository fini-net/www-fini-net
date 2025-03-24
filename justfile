import? '.cache/justfile'

justsync:
    curl --create-dirs -o .cache/justfile https://raw.githubusercontent.com/chicks-net/www-chicks-net/refs/heads/main/justfile
