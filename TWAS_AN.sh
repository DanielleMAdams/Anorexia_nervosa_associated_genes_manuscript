#!/bin/bash

#SBATCH --cpus-per-task=1
#SBATCH --time=15:00:00
#SBATCH --output=TWAS.out
#SBATCH --error=TWAS.err


cd /home/control/data/users/danielle/TWAS/

#GTEx v7 Whole_blood and brain weights mRNA
for weight_name in $(cat 28_9_2021_weight_names.txt)
do
for chr in $(seq 1 22);
do
Rscript ~/data/users/william/fusion_twas-master/FUSION.assoc_test.R \
--sumstats ~/data/users/danielle/TWAS/AN.sumstats.gz \
--weights  ~/data/users/william/GTEx_TWAS_weights/${weight_name}*/${weight_name}*.pos \
--weights_dir ~/data/users/william/GTEx_TWAS_weights/${weight_name}*/ \
--ref_ld_chr ~/data/users/william/fusion_twas-master/LDREF/1000G.EUR. \
--chr ${chr} \
--out ~/data/users/danielle/TWAS/${weight_name}_chr${chr}_FUSION
done
done

for chr in $(seq 1 22);
do
Rscript ~/data/users/william/fusion_twas-master/FUSION.assoc_test.R \
--sumstats ~/data/users/danielle/TWAS/AN.sumstats.gz \
--weights  ~/data/users/william/GTEx_TWAS_weights/Whole_Blood/Whole_Blood*.pos \
--weights_dir ~/data/users/william/GTEx_TWAS_weights/ \
--ref_ld_chr ~/data/users/william/fusion_twas-master/LDREF/1000G.EUR. \
--chr ${chr} \
--out ~/data/users/danielle/TWAS/Whole_Blood_chr${chr}_FUSION
done

#PsychENCODE cortex weights mRNA
for chr in $(seq 1 22);
do
Rscript ~/data/users/william/fusion_twas-master/FUSION.assoc_test.R \
--sumstats ~/data/users/danielle/TWAS/CHR_BP_AN.sumstats.gz \
--weights   ~/data/users/william/PEC_TWAS/PEC_WEIGHTS_with_N.pos \
--weights_dir ~/data/users/william/PEC_TWAS/ \
--ref_ld_chr ~/data/users/william/CHR_BP_g1000_LDREF/All_common_SNPs_1000G.EUR. \
--chr ${chr} \
--out ~/data/users/danielle/TWAS/PEC_chr${chr}_FUSION
done