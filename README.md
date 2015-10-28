# README.md SI_Pritchard_etal_2015

This repository contains supplementary information associated with the manuscript:  Pritchard L, Glover RH, Humphris S, Elphinstone JG and Toth IK, "Genomics and Taxonomy in Diagnostics for Food Security: soft-rotting enterobacterial plant pathogens" (2015)

## Overview 

This repository contains supplementary information and code to reproduce all main and supplementary figures and tables from the Pritchard *et al.* (2015) manuscript:

* Figure 1: `Figure_1_figure_anim_pid_pecto.pdf`
* Figure 2: `Figure_2_figure_anim_pid_dickeya.pdf`
* Figure 3: `Figure_3_figure_anim_cov_pecto.pdf`
* Figure 4: `Figure_4_figure_anim_cov_dickeya.pdf`
* Figure S1: `Figure_S1_figure_anim_pid_entero.pdf`
* Figure S2: `Figure_S2_figure_anim_pid_sre.pdf`
* Figure S3: `Figure_S3_figure_anim_cov_entero.pdf`
* Figure S4: `Figure_S4_figure_anim_cov_sre.pdf`

* Supplementary Table S2: `Table_S2_figure_anim_pid_entero.tab`
* Supplementary Table S3: `Table_S3_figure_anim_cov_entero.tab`
* Supplementary Table S4: `Table_S4_figure_anim_pid_sre.tab`
* Supplementary Table S5: `Table_S5_figure_anim_cov_sre.tab`
* Supplementary Table S6: `Table_S6_figure_anim_pid_dickeya.tab`
* Supplementary Table S7: `Table_S7_figure_anim_cov_pecto.tab`
* Supplementary Table S8: `Table_S8_figure_anim_pid_pecto.tab`
* Supplementary Table S9: `Table_S9_figure_anim_cov_dickeya.tab`

Supplementary data takes the form of the draft genome sequences used in this analysis. These are located in the directories `Dickeya` and `Pectobacterium`, and are sequences in FASTA format.

### Generating Figures and Tables

To recreate all the analysis and generate the figures and tables, you need to have working copies of [`pyani`](https://github.com/widdowquinn/pyani) and [`Make`](https://www.gnu.org/software/make/) installed on your system.

1. Clone this repository to your machine with, e.g. `git clone https://github.com/widdowquinn/SI_Pritchard_etal_2015.git`
2. Change to this repository's root directory
3. To build all tables and figures, issue `make all` at the command-line

The analysis may take some time, especially if you are running this code on a laptop or desktop machine, as it recreates the entire analysis short of generating Excel spreadsheets from plain text tabular output files. On our 180-core cluster, the analysis takes around four hours.

All output files are placed, by default, in the `figures_and_tables` subdirectory.

If you prefer, you can run the data download and analysis separately, with:

```
make data
make analysis
```

## Manuscript Summary

The aim of the manuscript is to use the specific example of bacterial pathogen threats to crops and food security to make a case for a quantitative approach to bacterial taxonomy and nomenclature based on whole-genome sequencing. 

The motivation is that, in order to legislate against the introduction or proliferation of a pathogen such that it can be usefully identified with diagnostic tools, that organism must be well defined. The legal definition is typically by binomial nomenclature (e.g. *Genus species*) but, if the prohibited organism is defined wrongly at any stage, then it is possible that threats may get by legislation and detection, or materials may be incorrectly condemned.

Briefly, the current classification of prokaryotes (bacteria and archaea) has been derived over an extended period through several approaches. Historically, classification has been primarily based on a combination of morphology (shape) and phenotype (biochemical or other behavioural characteristics), in a *polyphasic* classification. This runs into difficulties as each characteristics may not be unique to a related group of organisms, and shared characteristics may not always indicate common origin. 

By contrast, the whole genome of a prokaryote (chromosome and other sequences, such as plasmids) reflects the bulk of its genetic information, and therefore its recoverable evolutionary history. It is complicated by the way in which bacteria reproduce and undergo evolution, which permits frequent horizontal gene transfer in addition to the 'traditional' vertical gene transfer of cloning off from 'parent' individuals. Nevertheless, it is inherently a more precise tool with which to make taxonomic divisions, as differences between genomes are objectively quantifiable. 

With the increasingly affordable advent of high-throughput sequencing, we are now in a position where many prokaryotic genomes can be sequenced, and a measure of the range of genome variation accurately determined. This could lead to an objective, accurate quantifiable definition of prokaryotic *genus* and *species*. Such definitions would improve legislative decisions, and diagnostic tools.

The manuscript generates such a classification for the Enterobacteriacea, including the plant pathogens and soft rot enterobacteria (SREs): *Erwinia*, *Dickeya*, and *Pectobacterium*. The analyses demonstrate that whole-genome sequence (WGS) classifications would set different boundaries between genera and species than have been determined by polyphasic analysis.