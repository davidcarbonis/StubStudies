#!/bin/bash

qsub -q hep.q -l h_rt=10799 -m ea -M adm10@ic.ac.uk -pe hep.pe 1 /home/hep/adm10/CMSSW/CMSSW_11_2_0_pre6/src/L1Trigger/StubStudies/runStubRateTool_DisplacedMuPt1p5to8.sh 
qsub -q hep.q -l h_rt=10799 -m ea -M adm10@ic.ac.uk -pe hep.pe 1 /home/hep/adm10/CMSSW/CMSSW_11_2_0_pre6/src/L1Trigger/StubStudies/runStubRateTool_SingleElPt1p5to8.sh
qsub -q hep.q -l h_rt=10799 -m ea -M adm10@ic.ac.uk -pe hep.pe 1 /home/hep/adm10/CMSSW/CMSSW_11_2_0_pre6/src/L1Trigger/StubStudies/runStubRateTool_SingleMuPt1p5to8.sh
qsub -q hep.q -l h_rt=10799 -m ea -M adm10@ic.ac.uk -pe hep.pe 1 /home/hep/adm10/CMSSW/CMSSW_11_2_0_pre6/src/L1Trigger/StubStudies/runStubRateTool_ttbar_PU0.sh
qsub -q hep.q -l h_rt=10799 -m ea -M adm10@ic.ac.uk -pe hep.pe 1 /home/hep/adm10/CMSSW/CMSSW_11_2_0_pre6/src/L1Trigger/StubStudies/runStubRateTool_ttbar_PU200.sh
