#!/bin/bash

#!/bin/bash
fail_exit() { echo "$@" 1>&2; exit 1; }

echo "Start of job on " `date`

cd /home/hep/adm10/CMSSW/CMSSW_11_2_0_pre6/src/L1Trigger/StubStudies/

source /cvmfs/cms.cern.ch/cmsset_default.sh

eval `scramv1 runtime -sh`

export LD_LIBRARY_PATH=`pwd`/lib/:`pwd`/lib64/:${LD_LIBRARY_PATH}

echo TTbar + PU0 output
## all particles
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_DefaultWindows/ -o  $TMP/outputHybridDefaultWindows_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_OldLoose/ -o  $TMP/outputHybridOldLoose_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_OldTight/ -o  $TMP/outputHybridOldTight_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_DefaultWindows/ -o  $TMP/outputTmttDefaultWindows_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_OldLoose/ -o  $TMP/outputTmttOldLoose_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_OldTight/ -o  $TMP/outputTmttOldTight_all.root --particle="all"
## electrons
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_DefaultWindows/ -o  $TMP/outputHybridDefaultWindows_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_OldLoose/ -o  $TMP/outputHybridOldLoose_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_OldTight/ -o  $TMP/outputHybridOldTight_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_DefaultWindows/ -o  $TMP/outputTmttDefaultWindows_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_OldLoose/ -o  $TMP/outputTmttOldLoose_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_OldTight/ -o  $TMP/outputTmttOldTight_ele.root --particle="ele"
## muons
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_DefaultWindows/ -o  $TMP/outputHybridDefaultWindows_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_OldLoose/ -o  $TMP/outputHybridOldLoose_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_OldTight/ -o  $TMP/outputHybridOldTight_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_DefaultWindows/ -o  $TMP/outputTmttDefaultWindows_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_OldLoose/ -o  $TMP/outputTmttOldLoose_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_OldTight/ -o  $TMP/outputTmttOldTight_mu.root --particle="mu"
## pions
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_DefaultWindows/ -o  $TMP/outputHybridDefaultWindows_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_OldLoose/ -o  $TMP/outputHybridOldLoose_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_OldTight/ -o  $TMP/outputHybridOldTight_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_DefaultWindows/ -o  $TMP/outputTmttDefaultWindows_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_OldLoose/ -o  $TMP/outputTmttOldLoose_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_OldTight/ -o  $TMP/outputTmttOldTight_pion.root --particle="pion"
##
echo TTbar output + PU0 + dtc emulation
## all particles
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_DefaultWindows/ -o  $TMP/dtc_outputHybridDefaultWindows_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldLoose/ -o  $TMP/dtc_outputHybridOldLoose_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldTight/ -o  $TMP/dtc_outputHybridOldTight_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_DefaultWindows/ -o  $TMP/dtc_outputTmttDefaultWindows_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldLoose/ -o  $TMP/dtc_outputTmttOldLoose_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldTight/ -o  $TMP/dtc_outputTmttOldTight_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_DefaultWindows_noTruncation/ -o  $TMP/dtc_noTruncation_outputHybridDefaultWindows_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldLoose_noTruncation/ -o  $TMP/dtc_noTruncation_outputHybridOldLoose_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldTight_noTruncation/ -o  $TMP/dtc_noTruncation_outputHybridOldTight_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_DefaultWindows_noTruncation/ -o  $TMP/dtc_noTruncation_outputTmttDefaultWindows_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldLoose_noTruncation/ -o  $TMP/dtc_noTruncation_outputTmttOldLoose_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldTight_noTruncation/ -o  $TMP/dtc_noTruncation_outputTmttOldTight_all.root --particle="all"
## electrons
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_DefaultWindows/ -o  $TMP/dtc_outputHybridDefaultWindows_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldLoose/ -o  $TMP/dtc_outputHybridOldLoose_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldTight/ -o  $TMP/dtc_outputHybridOldTight_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_DefaultWindows/ -o  $TMP/dtc_outputTmttDefaultWindows_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldLoose/ -o  $TMP/dtc_outputTmttOldLoose_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldTight/ -o  $TMP/dtc_outputTmttOldTight_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_DefaultWindows_noTruncation/ -o  $TMP/dtc_noTruncation_outputHybridDefaultWindows_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldLoose_noTruncation/ -o  $TMP/dtc_noTruncation_outputHybridOldLoose_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldTight_noTruncation/ -o  $TMP/dtc_noTruncation_outputHybridOldTight_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_DefaultWindows_noTruncation/ -o  $TMP/dtc_noTruncation_outputTmttDefaultWindows_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldLoose_noTruncation/ -o  $TMP/dtc_noTruncation_outputTmttOldLoose_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldTight_noTruncation/ -o  $TMP/dtc_noTruncation_outputTmttOldTight_ele.root --particle="ele"
## muons
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_DefaultWindows/ -o  $TMP/dtc_outputHybridDefaultWindows_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldLoose/ -o  $TMP/dtc_outputHybridOldLoose_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldTight/ -o  $TMP/dtc_outputHybridOldTight_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_DefaultWindows/ -o  $TMP/dtc_outputTmttDefaultWindows_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldLoose/ -o  $TMP/dtc_outputTmttOldLoose_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldTight/ -o  $TMP/dtc_outputTmttOldTight_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_DefaultWindows_noTruncation/ -o  $TMP/dtc_noTruncation_outputHybridDefaultWindows_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldLoose_noTruncation/ -o  $TMP/dtc_noTruncation_outputHybridOldLoose_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldTight_noTruncation/ -o  $TMP/dtc_noTruncation_outputHybridOldTight_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_DefaultWindows_noTruncation/ -o  $TMP/dtc_noTruncation_outputTmttDefaultWindows_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldLoose_noTruncation/ -o  $TMP/dtc_noTruncation_outputTmttOldLoose_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldTight_noTruncation/ -o  $TMP/dtc_noTruncation_outputTmttOldTight_mu.root --particle="mu"
## pions
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_DefaultWindows/ -o  $TMP/dtc_outputHybridDefaultWindows_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldLoose/ -o  $TMP/dtc_outputHybridOldLoose_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldTight/ -o  $TMP/dtc_outputHybridOldTight_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_DefaultWindows/ -o  $TMP/dtc_outputTmttDefaultWindows_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldLoose/ -o  $TMP/dtc_outputTmttOldLoose_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldTight/ -o  $TMP/dtc_outputTmttOldTight_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_DefaultWindows_noTruncation/ -o  $TMP/dtc_noTruncation_outputHybridDefaultWindows_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldLoose_noTruncation/ -o  $TMP/dtc_noTruncation_outputHybridOldLoose_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldTight_noTruncation/ -o  $TMP/dtc_noTruncation_outputHybridOldTight_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_DefaultWindows_noTruncation/ -o  $TMP/dtc_noTruncation_outputTmttDefaultWindows_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldLoose_noTruncation/ -o  $TMP/dtc_noTruncation_outputTmttOldLoose_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldTight_noTruncation/ -o  $TMP/dtc_noTruncation_outputTmttOldTight_pion.root --particle="pion"

cp $TMP/*.root /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/StubRateToolOutput/ -v

echo "\nEnd of job on " `date` "\n"

