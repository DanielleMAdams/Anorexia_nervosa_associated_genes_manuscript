#!/bin/bash

#SBATCH --cpus-per-task=1
#SBATCH --time=6:00:00
#SBATCH --output=finemapping.out
#SBATCH --error=finemapping.err


cd /Users/danielle/Documents/finemapping/

#input summary statistics have been munged with the focus munge command

#PEC
for tissue in brain default
do
for chr in $(seq 1 22)
do
focus finemap /Users/danielle/Documents/DataFiles/CHR_BP_cleaned.AN.sumstats.gz \
/Users/danielle/Documents/DataFiles/CHR_BP_g1000_LDREF/All_common_SNPs_1000G.EUR.${chr} \
/Users/danielle/Documents/DataFiles/dbFiles/PEC_TWAS.db \
--chr ${chr} --tissue ${tissue} --p-threshold 1e-5 \
--out /Users/danielle/Documents/finemapping/AN_${tissue}_1e-5_PEC.chr${chr}
done
done
#mRNA-GTEx-focus
for tissue in brain default
do
for chr in $(seq 1 22)
do
focus finemap /Users/danielle/Documents/DataFiles/cleaned.AN.sumstats.gz \
/Users/danielle/Documents/DataFiles/LDREF/1000G.EUR.${chr} \
/Users/danielle/Documents/DataFiles/dbFiles/focus.db \
--chr ${chr} --tissue ${tissue} --p-threshold 1e-5 \
--out /Users/danielle/Documents/finemapping/AN_${tissue}_1e-5_focus.chr${chr}
done
done

#protein_splicing single tissue weights
#CMC
for chr in $(seq 1 22)
do
focus finemap /Users/danielle/Documents/DataFiles/cleaned.AN.sumstats.gz \
/Users/danielle/Documents/DataFiles/LDREF/1000G.EUR.${chr} \
/Users/danielle/Documents/DataFiles/dbFiles/DLPFC_RNASEQ_SPLICING_CMC.db \
--chr ${chr} --p-threshold 1e-5 \
--out /Users/danielle/Documents/finemapping/AN_DLPFC_RNASEQ_SPLICING_1e-5_CMC.chr${chr}
done

#ROSMAP
for chr in $(seq 1 22)
do
focus finemap /Users/danielle/Documents/DataFiles/cleaned.AN.sumstats.gz \
/Users/danielle/Documents/DataFiles/LDREF/1000G.EUR.${chr} \
/Users/danielle/Documents/DataFiles/dbFiles/DLPFC_Protein.ROSMAP.db \
--chr ${chr} --p-threshold 1e-5 \
--out /Users/danielle/Documents/finemapping/AN_DLPFC_Protein_1e-5_ROSMAP.chr${chr}
done

##non hapmap3 LDREF for blood protein
for chr in $(seq 1 22)
do
focus finemap /Users/danielle/Documents/DataFiles/cleaned.AN.sumstats.gz \
/Users/danielle/Documents/DataFiles/EUR/chr${chr} \
/Users/danielle/Documents/DataFiles/dbFiles/Plasma_Protein.GTEx.db \
--chr ${chr} --p-threshold 1e-5 \
--out /Users/danielle/Documents/finemapping/AN_Plasma_Protein_1e-5_GTEx.chr${chr}
done
##







