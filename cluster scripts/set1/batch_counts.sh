#!/bin/bash

## counting reads from .fastq files
## run with following command
## sbatch -J counting --ntasks=6 --cpus-per-task=8 --mem=64G --array=1-6 ./batch_counts.sh

module load cellranger

## it's a bit annoying to get this directory structure through bash, so we'll just list the directories in the correct order for samples 1-6

fqlocs=("HHGWKBGXM/outs/fastq_path/HHGWKBGXM" "HHGWKBGXM/outs/fastq_path/HHGWKBGXM" "HHGVNBGXM/outs/fastq_path/HHGVNBGXM" "HHGVNBGXM/outs/fastq_path/HHGVNBGXM" "HJGFMBGXK/outs/fastq_path/HJGFMBGXK" "HJGFMBGXK/outs/fastq_path/HJGFMBGXK")

n=$(expr $SLURM_ARRAY_TASK_ID - 1)

cellranger count --id="counts_sample$SLURM_ARRAY_TASK_ID" \
    --fastqs=${fqlocs[n]} \
    --sample=$SLURM_ARRAY_TASK_ID \
    --transcriptome=/bi/apps/cellranger/references/refdata_sscrofa11.1_v107/refdata_sscrofa11.1_v107

