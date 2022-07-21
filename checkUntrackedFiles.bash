#!/usr/bin/env bash

git -C "$(git rev-parse --show-cdup)" ls-files --others --exclude-standard -z | \
    xargs -0 ls -lR | \
    awk '{sum += $5; print $5 "\t" $9}END{print sum}' | \
    numfmt --field=1 --to=iec | \
    sort -h | \
    column -t
