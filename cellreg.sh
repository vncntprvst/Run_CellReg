#!/bin/sh
#SBATCH -t 00:30:00
#SBATCH -N 1
#SBATCH -n 24    
#SBATCH --mem=48G               
#SBATCH --job-name=cellreg  
#SBATCH -o ./slurm_logs/cellreg-%j.out
#SBATCH --mail-type=ALL

# Dynamically set mail-user, in case it wasn't passed by user.
if [ -z "$SLURM_MAIL_USER" ]; then
    scontrol update job $SLURM_JOB_ID MailUser=$USER@uni.edu
fi

# Example usage:
# sbatch --mail-user=$USER@uni.edu cellreg.sh

echo -e '\n'
echo '################'
echo '##  Cell Reg  ##'
echo '################'
echo -e '\n'

# Check resource availability and usage
echo "Starting job $SLURM_JOB_ID on $(hostname) at $(date)"
echo "Requested CPUs: $SLURM_CPUS_ON_NODE (Available CPUs: $(nproc --all))"
echo "Requested GPUs: $SLURM_GPUS (Available GPUs: $(nvidia-smi --query-gpu=count --format=csv,noheader,nounits))"
echo "Requested memory: $SLURM_MEM_PER_NODE (Available memory: $(free -h | grep Mem | awk '{print $2}'))"
echo "Requested walltime: $(squeue -j $SLURM_JOB_ID -h --Format TimeLimit)"

echo -e '\n'

# Load the Matlab module
if ! command -v module &> /dev/null 
then
    source /etc/profile.d/modules.sh
fi
module load mit/matlab/2021b

# Add code path and run the CellReg script
matlab -r "addpath('.','../../CellReg/CellReg','../../CellReg/Helper'); run_CellReg; exit"


echo -e "\nDone at $(date)"