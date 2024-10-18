Code to run [CellReg](https://github.com/zivlab/CellReg/tree/master) on 2P data, via a script. 
Add it to the Matlab path, on top of CellReg (`mat_to_sparse_cell.m` needs to overwride the one in CellReg).
Expected naming convention for ROI files is `ROI_xxx.mat`. Or change line 16 in `run_CellReg.m` to match your naming convention. 

### Run on the local machine
Open run_CellReg.m in the Matlab editor.

1. _Edit parameters_  
 `data_dir`  
 `runs`  
 `microns_per_pixel`  

2. _Run the script_  
In the Matlab editor, press `F5` or the green arrow.

### Run on the cluster

1. _Edit parameters_  
Open run_CellReg.m in an editor (e.g., WinSCP) and edit the following parameters:  
 `data_dir`  
 `runs`  
 `microns_per_pixel`  

2. _Login to the cluster and navigate to the directory containing the script_  
```bash
ssh cluster
cd /path/to/Run_CellReg
```
Create a slurm_logs directory (need to do this only once)
```bash
mkdir slurm_logs
```

3. _Run the script_  
```bash
sbatch --mail-user=$USER@uni.edu cellreg.sh
```
The email flag is optional.  

Job output for the example data:  
```bash
Job ID: 39048640
Cluster: openmind7
User/Group: prevosto/wanglab
State: COMPLETED (exit code 0)
Nodes: 1
Cores per node: 24
CPU Utilized: 00:39:06
CPU Efficiency: 11.33% of 05:45:12 core-walltime
Job Wall-clock time: 00:14:23
Memory Utilized: 31.59 GB
Memory Efficiency: 65.82% of 48.00 GB
```


