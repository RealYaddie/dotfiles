#!/usr/bin/env bash
# TODO: Decide whether to use variables or just argument sub for the command..

# Simple script that makes use of ghostscript to lower the size of a pdf file
# the '-dPDFSettings' option determines the quality of the pdf
# options: screen, ebook, prepress, printer and default. Printer & prepress highest quality(300dpi), ebook good middle ground(150dpi)
# https://www.digitalocean.com/community/tutorials/reduce-pdf-file-size-in-linux
8750  [2023-01-01 00:25:03] gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=con2.pdf con.pdf
8754  [2023-01-01 00:26:18] gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=con2.pdf con.pdf
8757  [2023-01-01 00:28:17] gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=con3.pdf con.pdf
