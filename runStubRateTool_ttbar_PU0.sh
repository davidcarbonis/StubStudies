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
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_DefaultWindows/ -o  $TMPDIR/outputHybridDefaultWindows_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_OldLoose/ -o  $TMPDIR/outputHybridOldLoose_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_OldTight/ -o  $TMPDIR/outputHybridOldTight_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_DefaultWindows/ -o  $TMPDIR/outputTmttDefaultWindows_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_OldLoose/ -o  $TMPDIR/outputTmttOldLoose_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_OldTight/ -o  $TMPDIR/outputTmttOldTight_all.root --particle="all"
## electrons
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_DefaultWindows/ -o  $TMPDIR/outputHybridDefaultWindows_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_OldLoose/ -o  $TMPDIR/outputHybridOldLoose_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_OldTight/ -o  $TMPDIR/outputHybridOldTight_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_DefaultWindows/ -o  $TMPDIR/outputTmttDefaultWindows_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_OldLoose/ -o  $TMPDIR/outputTmttOldLoose_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_OldTight/ -o  $TMPDIR/outputTmttOldTight_ele.root --particle="ele"
## muons
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_DefaultWindows/ -o  $TMPDIR/outputHybridDefaultWindows_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_OldLoose/ -o  $TMPDIR/outputHybridOldLoose_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_OldTight/ -o  $TMPDIR/outputHybridOldTight_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_DefaultWindows/ -o  $TMPDIR/outputTmttDefaultWindows_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_OldLoose/ -o  $TMPDIR/outputTmttOldLoose_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_OldTight/ -o  $TMPDIR/outputTmttOldTight_mu.root --particle="mu"
## pions
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_DefaultWindows/ -o  $TMPDIR/outputHybridDefaultWindows_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_OldLoose/ -o  $TMPDIR/outputHybridOldLoose_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Hybrid_OldTight/ -o  $TMPDIR/outputHybridOldTight_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_DefaultWindows/ -o  $TMPDIR/outputTmttDefaultWindows_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_OldLoose/ -o  $TMPDIR/outputTmttOldLoose_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/Tmtt_OldTight/ -o  $TMPDIR/outputTmttOldTight_pion.root --particle="pion"
##
echo TTbar output + PU0 + dtc emulation
## all particles
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_DefaultWindows/ -o  $TMPDIR/dtc_outputHybridDefaultWindows_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldLoose/ -o  $TMPDIR/dtc_outputHybridOldLoose_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldTight/ -o  $TMPDIR/dtc_outputHybridOldTight_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_DefaultWindows/ -o  $TMPDIR/dtc_outputTmttDefaultWindows_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldLoose/ -o  $TMPDIR/dtc_outputTmttOldLoose_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldTight/ -o  $TMPDIR/dtc_outputTmttOldTight_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_DefaultWindows_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputHybridDefaultWindows_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldLoose_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputHybridOldLoose_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldTight_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputHybridOldTight_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_DefaultWindows_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputTmttDefaultWindows_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldLoose_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputTmttOldLoose_all.root --particle="all"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldTight_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputTmttOldTight_all.root --particle="all"
## electrons
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_DefaultWindows/ -o  $TMPDIR/dtc_outputHybridDefaultWindows_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldLoose/ -o  $TMPDIR/dtc_outputHybridOldLoose_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldTight/ -o  $TMPDIR/dtc_outputHybridOldTight_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_DefaultWindows/ -o  $TMPDIR/dtc_outputTmttDefaultWindows_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldLoose/ -o  $TMPDIR/dtc_outputTmttOldLoose_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldTight/ -o  $TMPDIR/dtc_outputTmttOldTight_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_DefaultWindows_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputHybridDefaultWindows_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldLoose_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputHybridOldLoose_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldTight_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputHybridOldTight_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_DefaultWindows_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputTmttDefaultWindows_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldLoose_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputTmttOldLoose_ele.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldTight_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputTmttOldTight_ele.root --particle="ele"
## muons
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_DefaultWindows/ -o  $TMPDIR/dtc_outputHybridDefaultWindows_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldLoose/ -o  $TMPDIR/dtc_outputHybridOldLoose_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldTight/ -o  $TMPDIR/dtc_outputHybridOldTight_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_DefaultWindows/ -o  $TMPDIR/dtc_outputTmttDefaultWindows_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldLoose/ -o  $TMPDIR/dtc_outputTmttOldLoose_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldTight/ -o  $TMPDIR/dtc_outputTmttOldTight_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_DefaultWindows_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputHybridDefaultWindows_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldLoose_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputHybridOldLoose_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldTight_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputHybridOldTight_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_DefaultWindows_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputTmttDefaultWindows_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldLoose_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputTmttOldLoose_mu.root --particle="mu"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldTight_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputTmttOldTight_mu.root --particle="mu"
## pions
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_DefaultWindows/ -o  $TMPDIR/dtc_outputHybridDefaultWindows_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldLoose/ -o  $TMPDIR/dtc_outputHybridOldLoose_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldTight/ -o  $TMPDIR/dtc_outputHybridOldTight_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_DefaultWindows/ -o  $TMPDIR/dtc_outputTmttDefaultWindows_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldLoose/ -o  $TMPDIR/dtc_outputTmttOldLoose_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldTight/ -o  $TMPDIR/dtc_outputTmttOldTight_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_DefaultWindows_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputHybridDefaultWindows_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldLoose_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputHybridOldLoose_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Hybrid_OldTight_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputHybridOldTight_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_DefaultWindows_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputTmttDefaultWindows_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldLoose_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputTmttOldLoose_pion.root --particle="pion"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/dtc_Tmtt_OldTight_noTruncation/ -o  $TMPDIR/dtc_noTruncation_outputTmttOldTight_pion.root --particle="pion"

cp $TMPDIR/*.root /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU0_output/StubRateToolOutput/

echo "\nEnd of job on " `date` "\n"

