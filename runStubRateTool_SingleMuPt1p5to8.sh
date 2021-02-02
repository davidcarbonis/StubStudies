#!/bin/bash

#!/bin/bash
fail_exit() { echo "$@" 1>&2; exit 1; }

echo "Start of job on " `date`

cd /home/hep/adm10/CMSSW/CMSSW_11_2_0_pre6/src/L1Trigger/StubStudies/

source /cvmfs/cms.cern.ch/cmsset_default.sh

eval `scramv1 runtime -sh`

export LD_LIBRARY_PATH=`pwd`/lib/:`pwd`/lib64/:${LD_LIBRARY_PATH}

##
#echo SingleMu + PU0 output
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU0_output/Hybrid_DefaultWindows/ -o $TMPDIR/outputHybridDefaultWindows.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU0_output/Hybrid_OldLoose/ -o $TMPDIR/outputHybridOldLoose.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU0_output/Hybrid_OldTight/ -o $TMPDIR/outputHybridOldTight.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU0_output/Tmtt_DefaultWindows/ -o $TMPDIR/outputTmttDefaultWindows.root --particle="mu" 
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU0_output/Tmtt_OldLoose/ -o $TMPDIR/outputTmttOldLoose.root --particle="mu" 
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU0_output/Tmtt_OldTight/ -o $TMPDIR/outputTmttOldTight.root --particle="mu"
#echo SingleMu output + PU0 + dtc emulation
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU0_output/dtc_Hybrid_DefaultWindows/ -o $TMPDIR/dtc_outputHybridDefaultWindows.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU0_output/dtc_Hybrid_OldLoose/ -o $TMPDIR/dtc_outputHybridOldLoose.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU0_output/dtc_Hybrid_OldTight/ -o $TMPDIR/dtc_outputHybridOldTight.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU0_output/dtc_Tmtt_DefaultWindows/ -o $TMPDIR/dtc_outputTmttDefaultWindows.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU0_output/dtc_Tmtt_OldLoose/ -o $TMPDIR/dtc_outputTmttOldLoose.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU0_output/dtc_Tmtt_OldTight/ -o $TMPDIR/dtc_outputTmttOldTight.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU0_output/dtc_Hybrid_DefaultWindows_noTruncation/ -o $TMPDIR/dtc_noTruncation_outputHybridDefaultWindows.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU0_output/dtc_Hybrid_OldLoose_noTruncation/ -o $TMPDIR/dtc_noTruncation_outputHybridOldLoose.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU0_output/dtc_Hybrid_OldTight_noTruncation/ -o $TMPDIR/dtc_noTruncation_outputHybridOldTight.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU0_output/dtc_Tmtt_DefaultWindows_noTruncation/ -o $TMPDIR/dtc_noTruncation_outputTmttDefaultWindows.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU0_output/dtc_Tmtt_OldLoose_noTruncation/ -o $TMPDIR/dtc_noTruncation_outputTmttOldLoose.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU0_output/dtc_Tmtt_OldTight_noTruncation/ -o $TMPDIR/dtc_noTruncation_outputTmttOldTight.root --particle="mu"
#
#echo SingleMu + PU200 output
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU200_output/Hybrid_DefaultWindows/ -o $TMPDIR/outputHybridDefaultWindows.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU200_output/Hybrid_OldLoose/ -o $TMPDIR/outputHybridOldLoose.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU200_output/Hybrid_OldTight/ -o $TMPDIR/outputHybridOldTight.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU200_output/Tmtt_DefaultWindows/ -o $TMPDIR/outputTmttDefaultWindows.root --particle="mu" 
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU200_output/Tmtt_OldLoose/ -o $TMPDIR/outputTmttOldLoose.root --particle="mu" 
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU200_output/Tmtt_OldTight/ -o $TMPDIR/outputTmttOldTight.root --particle="mu"
#echo SingleMu output + PU200 + dtc emulation
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU200_output/dtc_Hybrid_DefaultWindows/ -o $TMPDIR/dtc_outputHybridDefaultWindows.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU200_output/dtc_Hybrid_OldLoose/ -o $TMPDIR/dtc_outputHybridOldLoose.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU200_output/dtc_Hybrid_OldTight/ -o $TMPDIR/dtc_outputHybridOldTight.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU200_output/dtc_Tmtt_DefaultWindows/ -o $TMPDIR/dtc_outputTmttDefaultWindows.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU200_output/dtc_Tmtt_OldLoose/ -o $TMPDIR/dtc_outputTmttOldLoose.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU200_output/dtc_Tmtt_OldTight/ -o $TMPDIR/dtc_outputTmttOldTight.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU200_output/dtc_Hybrid_DefaultWindows_noTruncation/ -o $TMPDIR/dtc_noTruncation_outputHybridDefaultWindows.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU200_output/dtc_Hybrid_OldLoose_noTruncation/ -o $TMPDIR/dtc_noTruncation_outputHybridOldLoose.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU200_output/dtc_Hybrid_OldTight_noTruncation/ -o $TMPDIR/dtc_noTruncation_outputHybridOldTight.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU200_output/dtc_Tmtt_DefaultWindows_noTruncation/ -o $TMPDIR/dtc_noTruncation_outputTmttDefaultWindows.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU200_output/dtc_Tmtt_OldLoose_noTruncation/ -o $TMPDIR/dtc_noTruncation_outputTmttOldLoose.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5to8_PU200_output/dtc_Tmtt_OldTight_noTruncation/ -o $TMPDIR/dtc_noTruncation_outputTmttOldTight.root --particle="mu"

cp $TMPDIR/*.root    /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5To8_PU0_output/StubRateToolOutput/
# cp $TMPDIR/*.root  /vols/cms/adm10/MC/TMTT/StubStudies/SingleMuPt1p5To8_PU200_output/StubRateToolOutput/

echo "\nEnd of job on " `date` "\n"

