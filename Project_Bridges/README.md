# PSC Bridges Cluster or SLURM job scheduler #

Any step that is followed by a "b", etc. (RunVelvet2b.sh or Step 2b) can be run at the same time as the matching number (RunVelvet.sh or Step2).

- Step 0:
  You need to put your email as the point of contact for all the scripts.  This can be done en masse with the following command (replace   youremail@wherever.com with your actual email) from the Project directory:
  
  `for f in */Run*; do sed -i 's/YOUREMAILHERE/youremail@wherever.com/g' $f; done`

  You will also need to map your project directory to the run files.  To do this, run the following from the Project directory:

  `for f in */*; do p=`pwd`; sed -i "s|PWDHERE|$p|g" $f ; done`

- Step 1:
  Put all your reads into input_files
  Read the README in input_files to get instructions for combining reads properly into input files.

  Then run the normalization command - this will normalize your data and make it take less time/resources without loss of information.
  
  `qsub RunTrinity.normalize.sh`

- Step 2: SOAP
  Run RunSOAP1.sh and RunSOAP1b.sh at the same time.  When they finish, run ./Combine.sh (no need to submit to queue).

- Step 2b: Velvet
  Run RunVelvet1.sh and RunVelvet1b.sh at the same time.  
  When BOTH above are complete, run RunVelvet2.sh and RunVelvet2b.sh at the same time.  
  When BOTH above are complete, run RunVelvet3.sh and RunVelvet3b.sh at the same time.  When they finish, run ./Combine.sh (no need to     submit to queue).

- Step 2c: TransAbyss
  Run RunTransAb1.sh and RunTransAb1b.sh at the same time.  
  When they finish, run ./Combine.sh

- Step 2d: Trinity
  Run RunTrinity.sh, there is no combine script for this assembler.

- Step 3: Combine all outputs
  The outputs for each combined set will be placed automatically in final_assembly.
  Run ./Combine.sh FIRST to get one input for Evigenes
  Run RunEviGene.sh 

### OUTPUT: ###
- In final_assemblies, you will see the following directories:
  - okayset - where the good files are
  - dropset - where dropped files are

within okayset, you will set two sets of files:
    okay.fa/aa/cds - these are the highest quality transcripts 
                     anything labeled "complete" is a full cds 
    okalt.fa/aa/cds- these are the alternative versions of the transcripts in the okay file (alleles, isoforms, etc).
                     anything labeled "complete" is a full cds.

SEE http://arthropods.eugenes.org/EvidentialGene/trassembly.html for documentaiton!