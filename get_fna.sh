#!/usr/bin/env bash
#
# Get all Enterobacteriaceae .fna (nucleotide sequence) files from GenBank
# at http://ftp.ncbi.nlm.nih.gov/genomes/Bacteria/ and place in subdirectories
# of the directory GenBank (which will be created if it does not exist),
# grouped by sequenced isolate.
#
# Vibrio spp. are included here as an outgroup.

genera=( "Dickeya" "Erwinia" "Pectobacterium" "Serratia" "Salmonella"\
         "Proteus" "Enterobacter" "Escherichia" "Shigella" "Pantoea"\
         "Sitophilus" "Sodalis" "Photorhabdus" "Hamiltonella" "Regiella"\
         "Vibrio" "Yersinia" )

for g in "${genera[@]}"
do
    wget -r --no-parent -nH --cut-dirs 2 -A fna --directory-prefix=GenBank \
         ftp://ftp.ncbi.nih.gov/genomes/Bacteria/${g}*
done
