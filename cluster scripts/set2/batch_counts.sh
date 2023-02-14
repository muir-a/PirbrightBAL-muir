#!/bin/bash

## counting reads from .fastq files
## run with following command
## sbatch -J counting --ntasks=6 --cpus-per-task=8 --mem=64G --array=7-12 ./batch_counts.sh

module load cellranger

## it's a bit annoying to get this directory structure through bash, so we'll just list the directories in the correct order for samples 1-6

fqlocs=("HW7HHBGXM/outs/fastq_path/HW7HHBGXM" "HW7HHBGXM/outs/fastq_path/HW7HHBGXM" "HHGT2BGXM/outs/fastq_path/HHGT2BGXM" "HHGT2BGXM/outs/fastq_path/HHGT2BGXM" "H3VC5BGXN/outs/fastq_path/H3VC5BGXN" "H3VC5BGXN/outs/fastq_path/H3VC5BGXN")

n=$(expr $SLURM_ARRAY_TASK_ID - 7)

cellranger count --id="counts_sample$SLURM_ARRAY_TASK_ID" \
    --fastqs=${fqlocs[n]} \
    --sample=$SLURM_ARRAY_TASK_ID \
    --transcriptome=/bi/apps/cellranger/references/refdata_sscrofa11.1_v107/refdata_sscrofa11.1_v107

