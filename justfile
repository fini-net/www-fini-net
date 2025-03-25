import? '.cache/justfile'

# "list" is already used in the parent (default with no args)
local_list:
    just --list

# sync justfile from www-chicks-net
justsync:
    curl --create-dirs -o .cache/justfile https://raw.githubusercontent.com/chicks-net/www-chicks-net/refs/heads/main/justfile
