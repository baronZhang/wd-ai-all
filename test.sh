#!/bin/bash
git submodule foreach --recursive '
    if git symbolic-ref -q HEAD >/dev/null; then
        BRANCH=$(git rev-parse --abbrev-ref HEAD)
        if git rev-parse --abbrev-ref --symbolic-full-name @{u} >/dev/null 2>&1; then
            if [ -n "$(git log @{u}.. 2>/dev/null)" ]; then
                echo "Pushing $name..."
                git push
            fi
        else
            echo "Skipping $name"
        fi
    else
        :
    fi
' || exit 1
