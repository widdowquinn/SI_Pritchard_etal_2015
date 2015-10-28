# Makefile
#
# Running with the following options will perform the associated tasks
#
# all:          will download and group all sequence data, then run ANIm on
#               all sequence groups
#
# data:         download and group sequence data, and create label/class
#               files for ANIm analysis
#
# analysis:	run ANIm on all sequence groups
#
# ANIm_Entero:  run ANIm on all Enterobacteriaceae sequences
#
# ANIm_SRE:     run ANIm on all soft rot enterobacteria sequences
#
# ANIm_Pecto:   run ANIm on all Pectobacterium sequences
#
# ANIm_Dickeya: run ANIm on all Dickeya sequences
#
# clean:	will remove all downloaded genome file directories, all ANIm
# 		output, and SGE-associated files
#
# If average_nucleotide_identity.py is located somewhere other than your 
# $PATH, then you will need to modify the ANISCRIPT macro below, accordingly.
#
# If you wish to use the SGE scheduler, set SCHEDULER to SGE; if you would
# prefer to use multiprocessing, then set SCHEDULER to multiprocessing

ANISCRIPT=average_nucleotide_identity.py
SCHEDULER=multiprocessing
OUTDIR=figures_and_tables

all: data analysis

analysis: ANIm_Dickeya ANIm_Pecto ANIm_SRE ANIm_Entero copy_files

clean: clean_genomes clean_output clean_SGE

clean_genomes:
	rm -rf GenBank GenBank_concatenated SRE Enterobacteria
	rm downloads_complete

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

copy_files:
	copy_figures copy_tables

copy_figures:
	cp ANIm_Pecto/ANIm_percentage_identity.pdf \
	   $(OUTDIR)/Figure_1_figure_anim_pid_pecto.pdf
	cp ANIm_Dickeya/ANIm_percentage_identity.pdf \
	   $(OUTDIR)/Figure_2_figure_anim_pid_dickeya.pdf
	cp ANIm_Pecto/ANIm_alignment_coverage.pdf \
	   $(OUTDIR)/Figure_3_figure_anim_cov_pecto.pdf
	cp ANIm_Dickeya/ANIm_alignment_coverage.pdf \
	   $(OUTDIR)/Figure_4_figure_anim_cov_dickeya.pdf
	cp ANIm_Entero/ANIm_percentage_identity.pdf \
	   $(OUTDIR)/Figure_S1_figure_anim_pid_entero.pdf
	cp ANIm_SRE/ANIm_percentage_identity.pdf \
	   $(OUTDIR)/Figure_S2_figure_anim_pid_sre.pdf
	cp ANIm_Entero/ANIm_alignment_coverage.pdf \
	   $(OUTDIR)/Figure_S3_figure_anim_cov_entero.pdf
	cp ANIm_SRE/ANIm_alignment_coverage.pdf \
	   $(OUTDIR)/Figure_S4_figure_anim_cov_sre.pdf

copy_tables:
	cp ANIm_Pecto/ANIm_percentage_identity.tab \
	   $(OUTDIR)/Table_S8_figure_anim_pid_pecto.tab
	cp ANIm_Dickeya/ANIm_percentage_identity.tab \
	   $(OUTDIR)/Table_S6_figure_anim_pid_dickeya.tab
	cp ANIm_Pecto/ANIm_alignment_coverage.tab \
	   $(OUTDIR)/Table_S7_figure_anim_cov_pecto.tab
	cp ANIm_Dickeya/ANIm_alignment_coverage.tab \
	   $(OUTDIR)/Table_S9_figure_anim_cov_dickeya.tab
	cp ANIm_Entero/ANIm_percentage_identity.tab \
	   $(OUTDIR)/Table_S2_figure_anim_pid_entero.tab
	cp ANIm_SRE/ANIm_percentage_identity.tab \
	   $(OUTDIR)/Table_S4_figure_anim_pid_sre.tab
	cp ANIm_Entero/ANIm_alignment_coverage.tab \
	   $(OUTDIR)/Table_S3_figure_anim_cov_entero.tab
	cp ANIm_SRE/ANIm_alignment_coverage.tab \
	   $(OUTDIR)/Table_S5_figure_anim_cov_sre.tab


