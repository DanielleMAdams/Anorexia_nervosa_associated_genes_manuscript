#!/bin/bash

#SBATCH --cpus-per-task=1
#SBATCH --time=5:00:00
#SBATCH --output=PWAS.AN.out
#SBATCH --error=PWAS.AN.err


cd /home/control/data/users/danielle/PWAS/

#ROSMAP DLPFC brain
for chr in $(seq 1 22);
do
Rscript ~/data/users/danielle/TWAS/FUSION.assoc_test.R \
--sumstats ~/data/users/danielle/TWAS/AN.sumstats.gz \
--weights  ~/data/users/william/PWAS_weights/Brain/ROSMAP_and_Banner_PWAS_weights/ROSMAP.n376.fusion.WEIGHTS/train_weights.pos \
--weights_dir ~/data/users/william/PWAS_weights/Brain/ROSMAP_and_Banner_PWAS_weights/ROSMAP.n376.fusion.WEIGHTS \
--ref_ld_chr ~/data/users/william/fusion_twas-master/LDREF/1000G.EUR. \
--chr ${chr} \
--out ~/data/users/danielle/PWAS/ROSMAP.DLPFC_chr${chr}_FUSION
done

#plasma blood protein weights
for chr in $(seq 1 22);
do
Rscript ~/data/users/danielle/TWAS/FUSION.assoc_test.R \
--sumstats ~/data/users/danielle/TWAS/AN.sumstats.gz \
--weights   ~/data/users/william/PWAS_weights/Blood/PWAS_EA/Plasma_Protein_EA_hg38.pos \
--weights_dir ~/data/users/william/PWAS_weights/Blood/PWAS_EA/Plasma_Protein_weights_EA_enet \
--ref_ld_chr ~/data/users/william/PWAS_weights/Blood/LDref/EUR/chr \
--chr ${chr} \
--out ~/data/users/danielle/PWAS/BLood_Plasma_chr${chr}_FUSION
done