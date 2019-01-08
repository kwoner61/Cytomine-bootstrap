#!/usr/bin/env bash

. ./files.sh

echo "Clean installation directory. All generated configuration files will be removed."
for i in ${FILES[@]}; do
    if [[ -f "$i" ]]; then
        echo "Remove file $i ..."
        rm $i
    fi
done
echo "Done."