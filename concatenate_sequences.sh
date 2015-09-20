#!/usr/bin/env bash
#
# Concatenate genome sequences from each subdirectory of the GenBank directory
# into a single multiple FASTA file in the directory GenBank_concatenated,
# with filename <dirname>.fna
#
# The directory GenBank_concatenated will be created if it does not
# already exist

INDIR=GenBank
OUTDIR=GenBank_concatenated

mkdir -p ${OUTDIR}

for d in `ls -d ${INDIR}/*/`
do
    stem=${d##${INDIR}/}
    cmd="cat ${d}*.fna > ${OUTDIR}/${stem%%/}.fna"
    echo ${cmd}
    eval ${cmd}
done
