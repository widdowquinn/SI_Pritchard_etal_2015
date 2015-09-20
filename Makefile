# Makefile
#
# Running with the following options will perform the associated tasks
#
# data:         download and group sequence data, and create label/class
#               files for ANIm analysis
#
# ANIm_Entero:  run ANIm on all Enterobacteriaceae sequences
#
# ANIm_SRE:     run ANIm on all soft rot enterobacteria sequences
#
# ANIm_Pecto:   run ANIm on all Pectobacterium sequences
#
# ANIm_Dickeya: run ANIm on all Dickeya sequences
#
# all:          will download and group all sequence data, then run ANIm on
#               all Enterobacteriaceae sequences
#
# clean:	will remove all downloaded genome file directories, all ANIm
# 		output, and SGE-associated files
#
# If average_nucleotide_identity.py is located somewhere other than your 
# $PATH, then modify the ANISCRIPT macro accordingly.
#
# If you wish to use the SGE scheduler, set SCHEDULER to SGE; if you would
# prefer to use multiprocessing, then set SCHEDULER to multiprocessing

ANISCRIPT=average_nucleotide_identity.py
SCHEDULER=multiprocessing

all: data ANIm_Entero

clean: clean_genomes clean_output clean_SGE

clean_genomes:
	rm -rf GenBank GenBank_concatenated SRE Enterobacteria

clean_output:
	rm -rf ANIm_Dickeya ANIm_Pecto ANIm_SRE ANIm_Entero
	rm *.log

clean_SGE:
	rm -rf jobs output stderr stdout

data:
	./get_fna.sh
	./concatenate_sequences.sh
	./group_genomes.sh
	./create_class_files.sh

ANIm_Entero:
	$(ANISCRIPT) -i Enterobacteria/ -v \
	  -o ANIm_Entero --scheduler $(SCHEDULER) -g -l ANIm_Entero.log \
	  --force --classes entero_genus.tab --labels entero_species.tab

ANIm_SRE:
	$(ANISCRIPT) -i SRE/ -v \
	  -o ANIm_SRE --scheduler $(SCHEDULER) -g -l ANIm_SRE.log \
	  --force --classes sre_genus.tab

ANIm_Pecto:
	$(ANISCRIPT) -i Pectobacterium/ -v \
	  -o ANIm_Pecto --scheduler $(SCHEDULER) -g -l ANIm_Pecto.log \
	  --force --classes pecto_species.tab

ANIm_Dickeya:
	$(ANISCRIPT) -i Dickeya/ -v \
	  -o ANIm_Dickeya --scheduler $(SCHEDULER) -g -l ANIm_Dickeya.log \
	  --force --classes dickeya_species.tab


