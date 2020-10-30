#!/bin/bash

#qsub -q hep.q -l h_rt=172799  -m ea -M adm10@ic.ac.uk -pe hep.pe 1 /home/hep/adm10/CMSSW/CMSSW_11_2_0_pre6/src/L1Trigger/StubStudies/batch_Hybrid_nominal.sh
qsub -q hep.q -l h_rt=35999  -m ea -M adm10@ic.ac.uk -pe hep.pe 1 /home/hep/adm10/CMSSW/CMSSW_11_2_0_pre6/src/L1Trigger/StubStudies/batch_Hybrid_dtc.sh
#qsub -q hep.q -l h_rt=172799  -m ea -M adm10@ic.ac.uk -pe hep.pe 1 /home/hep/adm10/CMSSW/CMSSW_11_2_0_pre6/src/L1Trigger/StubStudies/batch_TMTT_nominal.sh
qsub -q hep.q -l h_rt=35999  -m ea -M adm10@ic.ac.uk -pe hep.pe 1 /home/hep/adm10/CMSSW/CMSSW_11_2_0_pre6/src/L1Trigger/StubStudies/batch_TMTT_dtc.sh
