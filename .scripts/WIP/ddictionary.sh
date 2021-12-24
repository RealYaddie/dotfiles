#!/usr/bin/env bash

# DESCRIPTION: A script that uses dmenu and opens up the definition page of whatever word that I type in. (Gonna use Wordnik for now.)
# TODO: Instead of only using one site can maybe show another prompt before or after entering the word asking you to choose which site you wanna use. <22-11-21> #

if [ -f ~/.dmenurc ]; then
    . ~/.dmenurc
else
    DMENU="dmenu -i"
fi

# Prompt with dictionary sites
site=$(echo -e "WordNik\nWikipedia\nDictionary.com" | $DMENU)
echo "${site}"
# Prompt that saves the word to look for
# choice="$(echo "Definition of:")"
choice=$(- | $DMENU)
echo "This is choice: ${choice}"

echo "${site}${choice}"


# link=$(echo "$choice" | xargs -r -I{} brave "{}")
