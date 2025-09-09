#!/bin/bash
query="$1"
subject="$2"
output_file="$3"

tblastn -query "$query" -subject "$subject" -outfmt "6 qseqid sseqid pident length qlen" 2>/dev/null | awk '$3 > 30 && $4 / $5 > 0.9' > "$output_file"

wc -l < "$output_file"
