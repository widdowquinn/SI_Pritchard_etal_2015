#!/usr/bin/env bash
#
# Create class files for rendering ANIm output, based on the genus and species
# identifiers of the input files

echo "Creating class files"
rm -f entero_genus.tab entero_species.tab dickeya_species.tab pecto_species.tab
for f in Enterobacteria/*.fna
do
    stem1=${f##Enterobacteria/}
    stem=${stem1%%.fna}
    IFS='_' read -ra array <<< "${stem}"
    genus=${array[0]}
    species=${array[1]}
    echo -e "${stem}\t${genus}" >> entero_genus.tab
    echo -e "${stem}\t${genus}_${species}" >> entero_species.tab
done

# 
for f in Pectobacterium/*.fna
do
    stem1=${f##Pectobacterium/}
    stem=${stem1%%.fna}
    IFS='_' read -ra array <<< "${stem}"
    genus=${array[0]}
    species=${array[1]}
    echo -e "${stem}\t${genus}_${species}" >> pecto_species.tab
done

for f in SRE/*.fna
do
    stem1=${f##SRE/}
    stem=${stem1%%.fna}
    IFS='_' read -ra array <<< "${stem}"
    genus=${array[0]}
    species=${array[1]}
    echo -e "${stem}\t${genus}" >> sre_genus.tab
    echo -e "${stem}\t${genus}_${species}" >> sre_species.tab
done

for f in Dickeya/*.fna
do
    stem1=${f##Dickeya/}
    stem=${stem1%%.fna}
    IFS='_' read -ra array <<< "${stem}"
    genus=${array[0]}
    species=${array[1]}
    echo -e "${stem}\t${genus}_${species}" >> dickeya_species.tab
done
