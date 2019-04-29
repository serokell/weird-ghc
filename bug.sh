#!/usr/bin/env bash
set -e

if [[ "$1" != "1" && "$1" != "2" ]]; then
  cat <<EOF
Usage: $0 <demo-number>

There are two demos:

1. Fails at linking
2. Segfaults
EOF
exit 1
fi

main="Main$1"


ghc --make $main.hs && ./$main

# Do the magic
sed -i -e 's/{- . succ -}/. succ/' MyInteger.hs

ghc --make $main.hs && ./$main  || true  # fails

# Undo the magic for future runs
sed -i -e 's/. succ/{- . succ -}/' MyInteger.hs
