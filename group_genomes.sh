#!/usr/bin/env bash
#
# Combine GenBank, Dickeya and Pectobacterium genome sequences into a single
# directory (SRE).
# Create two tab-separated class.tab files - one for genus, one for species.

echo "Making directories"
mkdir -p SRE Enterobacteria

# Place all GenBank, and local Pectobacterium/Dickeya sequences in the
# Enterobacteria directory (the Vibrio genomes are an outgroup)
echo "Grouping genomes"
indirs=( "GenBank_concatenated" "Pectobacterium" "Dickeya" )
for i in ${indirs[@]}
do
    cp ${i}/*.fna Enterobacteria/
done

# Copy all SRE genera sequences to the SRE directory
genus_stems=( "Erwinia" "Pantoea" "Pectobacterium" "Dickeya" )
for s in ${genus_stems[@]}
do
    cp Enterobacteria/${s}*.fna SRE/
done

# Copy all GenBank Pectobacterium sequences to the Pectobacterium directory
genus_stems=( "Pectobacterium" )
for s in ${genus_stems[@]}
do
    cp Enterobacteria/${s}*.fna Pectobacterium/
done

# Copy all GenBank Dickeya sequences to the Dickeya directory
genus_stems=( "Dickeya" )
for s in ${genus_stems[@]}
do
    cp Enterobacteria/${s}*.fna Dickeya/
done

