h#!/bin/bash
query="$1"
subject="$2"
output_file="$3"

qlen=$(grep -v "^>" "$query" | tr -d '\n' | wc -c)

tblastn -query "$query" -subject "$subject" -outfmt "6 qseqid sseqid pident length" \
    | awk -v qlen="$qlen" '$3 > 30 && $4 >= 0.9 * qlen' > "$output_file"

echo $(wc -l < "$output_file")
