#!/bin/bash

## Run cellranger mkfastq

## 220728_NB551375_0065_samplesheet.csv
## Lane,Sample,Index
## *,1,SI-TT-D1
## *,2,SI-TT-E1

## 220729_NB551375_0066_samplesheet.csv
## Lane,Sample,Index
## *,3,SI-TT-F1
## *,4,SI-TT-G1

## 220730_NB551375_0067_samplesheet.csv
## Lane,Sample,Index
## *,5,SI-TT-H1
## *,6,SI-TT-A2



module load cellranger
module load bcl2fastq
module load ssub

ssub -o mkfastq_220728.log --mem=128G -c 8 --email cellranger mkfastq --run=220728_NB551375_0065_AHHGWKBGXM/ --csv=220728_NB551375_0065_samplesheet.csv
ssub -o mkfastq_220729.log --mem=128G -c 8 --email cellranger mkfastq --run=220729_NB551375_0066_AHHGVNBGXM/ --csv=220729_NB551375_0066_samplesheet.csv
ssub -o mkfastq_220730.log --mem=128G -c 8 --email cellranger mkfastq --run=220730_NB551375_0067_AHJGFMBGXK/ --csv=220730_NB551375_0067_samplesheet.csv

