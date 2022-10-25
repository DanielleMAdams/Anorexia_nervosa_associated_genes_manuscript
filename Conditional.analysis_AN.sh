#!/bin/bash

#SBATCH --cpus-per-task=1
#SBATCH --time=3:00:00
#SBATCH --output=conditional_analysis.out
#SBATCH --error=conditional_analysis.err


cd /home/control/data/users/danielle/conditional_analysis/

#Performed conditional analysis separately for Bonferroni significant and Benjamini-Hochberg significant TWAS/PWAS/spliceWAS signals

for significance in bon FDR
do
#GTEx
for chr in $(seq 1 22);
do 
Rscript  ~/data/users/william/fusion_twas-master/FUSION.post_process.R \
--sumstats ~/data/users/danielle/TWAS/AN.sumstats.gz \
--input GTEx.${significance}sig_for_conditional.txt \
--out GTEx_AN_chr${chr}.top.analysis.${significance} \
--ref_ld_chr  ~/data/users/william/fusion_twas-master/LDREF/1000G.EUR. \
--chr ${chr} --plot --locus_win 500000
done

#PsychENCODE
for chr in $(seq 1 22);
do 
Rscript  ~/data/users/william/fusion_twas-master/FUSION.post_process.R \
--sumstats ~/data/users/danielle/TWAS/CHR_BP_AN.sumstats.gz \
--input PEC.${significance}sig_for_conditional.txt \
--out PEC_AN_chr${chr}.top.analysis.${significance} \
--ref_ld_chr  ~/data/users/william/CHR_BP_g1000_LDREF/All_common_SNPs_1000G.EUR. \
--chr ${chr} --plot --locus_win 500000
done

#Plasma protein
for chr in $(seq 1 22);
do 
Rscript  ~/data/users/william/fusion_twas-master/FUSION.post_process.R \
--sumstats ~/data/users/danielle/TWAS/AN.sumstats.gz \
--input PP.${significance}sig_for_conditional.txt \
--out PP_AN_chr${chr}.top.analysis.${significance} \
--ref_ld_chr ~/data/users/william/PWAS_weights/Blood/LDref/EUR/chr  \
--chr ${chr} --plot --locus_win 500000
done

#DLPFC protein
for chr in $(seq 1 22);
do 
Rscript  ~/data/users/william/fusion_twas-master/FUSION.post_process.R \
--sumstats ~/data/users/danielle/TWAS/AN.sumstats.gz \
--input DLPFC_P.${significance}sig_for_conditional.txt \
--out DLPFC_P_AN_chr${chr}.top.analysis.${significance} \
--ref_ld_chr  ~/data/users/william/fusion_twas-master/LDREF/1000G.EUR. \
--chr ${chr} --plot --locus_win 500000
done

#DLPFC splicing
for chr in $(seq 1 22);
do 
Rscript  ~/data/users/william/fusion_twas-master/FUSION.post_process.R \
--sumstats ~/data/users/danielle/TWAS/AN.sumstats.gz \
--input DLPFC_splice.${significance}sig_for_conditional.txt \
--out DLPFC_splice_AN_chr${chr}.top.analysis.${significance} \
--ref_ld_chr  ~/data/users/william/fusion_twas-master/LDREF/1000G.EUR. \
--chr ${chr} --plot --locus_win 500000
done
done




