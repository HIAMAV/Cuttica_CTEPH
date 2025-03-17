#!/bin/bash

#SBATCH --account=p32291
#SBATCH --partition=gengpu
#SBATCH --time=10:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mem=700G
#SBATCH --gres=gpu:h100:1
#SBATCH --constraint=rhel8
#SBATCH --mail-user=arun.sivakumar@northwestern.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --job-name='nf-core'
#SBATCH --output=/home/vzh0939/logs/nf-core.out
#SBATCH --error=/home/vzh0939/logs/nf-core.err

cd /projects/b1042/Arun/Mike_Cuttica_fastq_illumina/

module load singularity/3.8.1

nextflow run nf-core/rnaseq --input ./SampleSheet-nf-core.csv --outdir ./result_nf-core_fastq --genome GRCh38 -profile singularity 
