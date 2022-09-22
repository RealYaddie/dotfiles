#!/usr/bin/env bash

# DESCRIPTION: A script that uses dmenu and opens up the definition page of whatever word that I type in. (Gonna use Wordnik for now.)
# TODO: This might be a situation where a python program might work out a whole lot better for this situation.

if [ -f ~/.dmenurc ]; then
    . ~/.dmenurc
else
    DMENU="dmenu -i"
fi

# Prompt with dictionary sites
site=$(echo -e "WordNik\nWikipedia\nDictionary.com" | $DMENU)

# Prompt that saves the word to look for
choice=$(- | $DMENU)
# echo -e "Site chosen: ${site}\nWord to Search for: ${choice}"
# run_this=$(echo "${choice}" | xargs -r -I{} brave "{}")

if [ "${site}" == "WordNik" ]; then
    # brave "https://www.wordnik.com/words/${choice}"
    $(echo "${choice}" | xargs -r -I{} brave "https://www.wordnik.com/words/""{}")
elif
    [ "${site}" == "Wikipedia" ]; then
    # brave "https://en.wikipedia.org/wiki/${choice}"
    ${run_this}
elif
    [ "${site}" == "Dictionary.com" ]; then
    # brave "https://www.dictionary.com/browse/${choice}"
    ${run_this}
else
    notify-send "End."
fi
# link=$(echo "$choice" | xargs -r -I{} brave "{}")
