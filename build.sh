#!/bin/bash

set -ue

IMAGE_NAME="kumassy/alpine-pandoc-ja"
CONVERTER_NAME="pandoc"
PDF_ENGINE="lualatex"
TEMPLATE_NAME="template.tex"

help() {
        echo "Usage: $0 [-t template] item ..." 1>&2
        exit 1
}

while getopts t:h OPT
do
    case $OPT in
        t)  TEMPLATE_NAME="$OPTARG"
            ;;
        h)  usage_exit
            ;;
        \?) usage_exit
            ;;
    esac
done

shift "$((OPTIND - 1))"

MARKDOWN_NAME="$1"
PDF_NAME="${MARKDOWN_NAME%.*}.pdf"

docker run -it --rm -v "$(pwd):/root/.pandoc/templates" -v "$(pwd):/workspace" "$IMAGE_NAME" "$CONVERTER_NAME" -F "pandoc-crossref" -o "$PDF_NAME" --pdf-engine="$PDF_ENGINE" --template "$TEMPLATE_NAME" -N "$MARKDOWN_NAME"
