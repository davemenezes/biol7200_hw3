#!/bin/sh

query="$1"
subject="$2"
output_file="$3"

tblastn -query "$query" -subject "$subject" -outfmt '6 qseqid sseqid pident length' \
 | awk - v qlen=$(grep -v ">" "query" | ec -c) '$3>30 && $4/qlen>0.9' \
 > "$output_file"

 echo $(wc -1 < "$output_file")
