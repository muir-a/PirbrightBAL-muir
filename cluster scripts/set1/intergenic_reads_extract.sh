#!/bin/bash

## Extract intergenic reads from sample 1 to find out where these are falling
## run the following commands to achieve this

# module load samtools
# module load bedtools
# module load ssub

# ssub -o intergenic_extract.log --email ./intergenic_reads_extract.sh

samtools view -H counts_sample1/outs/possorted_genome_bam.bam > counts_sample1/outs/sample1_header.sam
samtools view -h counts_sample1/outs/possorted_genome_bam.bam | grep -w 'RE:A:I' > counts_sample1/outs/intergenic_reads.sam
cat counts_sample1/outs/sample1_header.sam counts_sample1/outs/intergenic_reads.sam > counts_sample1/outs/intergenic_reads_h.sam
samtools view -S -b counts_sample1/outs/intergenic_reads_h.sam > counts_sample1/outs/intergenic_reads.bam
samtools index -b counts_sample1/outs/intergenic_reads.bam
 
# then remove all extraneous .sam files generated

# then need to get bed file out of this

bedtools bamtobed -i counts_sample1/outs/intergenic_reads.bam > counts_sample1/outs/intergenic_reads.bed
bedtools merge -i counts_sample1/outs/intergenic_reads.bed -c 1 -o count > counts_sample1/outs/intergenic_reads_merged.bed
