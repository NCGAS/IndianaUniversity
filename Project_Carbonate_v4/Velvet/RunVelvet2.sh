#!/bin/bash 

#SBATCH -J RunVelvet2                                  
#SBATCH -p general 
#SBATCH -o Velvet2_%j.log
#SBATCH -e Velvet2_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=2
#SBATCH --mem=200gb
#SBATCH --time=03:00:00 

##Move to correct WD
cd PWDHERE/Velvet

##load modules
module load velvet/1.2.10
module load oases/0.2.09

#input define
right=PWDHERE/input_files/right-norm.fq
left=PWDHERE/input_files/left-norm.fq

##run code
velvetg oases.35 -read_trkg yes -ins_length 400 &
velvetg oases.45 -read_trkg yes -ins_length 400 &
velvetg oases.55 -read_trkg yes -ins_length 400 &

wait
