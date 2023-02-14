#!/bin/bash

## Run cellranger mkfastq

## 221010_0068_samplesheet.csv
## Lane,Sample,Index
## *,7,SI-TT-B2
## *,8,SI-TT-C2

## 221011_0069_samplesheet.csv
## Lane,Sample,Index
## *,9,SI-TT-D2
## *,10,SI-TT-E2

## 221013_0070_samplesheet.csv
## Lane,Sample,Index
## *,11,SI-TT-F2
## *,12,SI-TT-G2



module load cellranger
module load bcl2fastq
module load ssub

ssub -o mkfastq_221010.log --mem=128G -c 8 --email cellranger mkfastq --run=221010_0068/ --csv=221010_0068_samplesheet.csv
ssub -o mkfastq_221011.log --mem=128G -c 8 --email cellranger mkfastq --run=221011_0069/ --csv=221011_0069_samplesheet.csv
ssub -o mkfastq_221013.log --mem=128G -c 8 --email cellranger mkfastq --run=221013_0070/ --csv=221013_0070_samplesheet.csv

