#!/bin/bash

#SBATCH --cpus-per-task=1
#SBATCH --time=5:00:00
#SBATCH --output=spliceWAS.AN.out
#SBATCH --error=spliceWAS.AN.err


cd /home/control/data/users/danielle/spliceWAS/

#CommonMind Consortium DLPFC brain mRNA alternative splicing weights
for chr in $(seq 1 22);
do
Rscript ~/data/users/danielle/TWAS/FUSION.assoc_test.R \
--sumstats ~/data/users/danielle/TWAS/AN.sumstats.gz \
--weights  ~/data/users/danielle/spliceWAS/CMC.BRAIN.RNASEQ_SPLICING/CMC.BRAIN.RNASEQ_SPLICING.pos \
--weights_dir ~/data/users/danielle/spliceWAS \
--ref_ld_chr ~/data/users/william/fusion_twas-master/LDREF/1000G.EUR. \
--chr ${chr} \
--out ~/data/users/danielle/spliceWAS/CMC.DLPFC_chr${chr}_FUSION
done

