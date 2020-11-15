#!/bin/bash
fail_exit() { echo "$@" 1>&2; exit 1; }

echo "Start of job on " `date`

cd /home/hep/adm10/CMSSW/CMSSW_11_2_0_pre6/src/L1Trigger/StubStudies

source /cvmfs/cms.cern.ch/cmsset_default.sh

eval `scramv1 runtime -sh`

export LD_LIBRARY_PATH=`pwd`/lib/:`pwd`/lib64/:${LD_LIBRARY_PATH}

echo SingleEl + PU0 output
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/outputHybridOldLoose.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/StubRateToolOutput/outputHybridOldLoose.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/outputHybridOldTight.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/StubRateToolOutput/outputHybridOldTight.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/outputTmttOldLoose.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/StubRateToolOutput/outputTmttOldLoose.root --particle="ele" 
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/outputTmttOldTight.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/StubRateToolOutput/outputTmttOldTight.root --particle="ele"
echo SingleEl output + PU0 + dtc emulation
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/dtc_outputHybridOldLoose.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/StubRateToolOutput/dtc_outputHybridOldLoose.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/dtc_outputHybridOldTight.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/StubRateToolOutput/dtc_outputHybridOldTight.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/dtc_outputTmttOldLoose.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/StubRateToolOutput/dtc_outputTmttOldLoose.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/dtc_outputTmttOldTight.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/StubRateToolOutput/dtc_outputTmttOldTight.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/dtc_noTruncation_outputHybridOldLoose.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/StubRateToolOutput/dtc_noTruncation_outputHybridOldLoose.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/dtc_noTruncation_outputHybridOldTight.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/StubRateToolOutput/dtc_noTruncation_outputHybridOldTight.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/dtc_noTruncation_outputTmttOldLoose.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/StubRateToolOutput/dtc_noTruncation_outputTmttOldLoose.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/dtc_noTruncation_outputTmttOldTight.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/StubRateToolOutput/dtc_noTruncation_outputTmttOldTight.root --particle="ele"
#
echo SingleEl + PU200 output
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/outputHybridOldLoose.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/StubRateToolOutput/outputHybridOldLoose.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/outputHybridOldTight.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/StubRateToolOutput/outputHybridOldTight.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/outputTmttOldLoose.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/StubRateToolOutput/outputTmttOldLoose.root --particle="ele" 
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/outputTmttOldTight.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/StubRateToolOutput/outputTmttOldTight.root --particle="ele"
echo SingleEl output + PU200 + dtc emulation
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/dtc_outputHybridOldLoose.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/StubRateToolOutput/dtc_outputHybridOldLoose.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/dtc_outputHybridOldTight.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/StubRateToolOutput/dtc_outputHybridOldTight.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/dtc_outputTmttOldLoose.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/StubRateToolOutput/dtc_outputTmttOldLoose.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/dtc_outputTmttOldTight.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/StubRateToolOutput/dtc_outputTmttOldTight.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/dtc_noTruncation_outputHybridOldLoose.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/StubRateToolOutput/dtc_noTruncation_outputHybridOldLoose.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/dtc_noTruncation_outputHybridOldTight.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/StubRateToolOutput/dtc_noTruncation_outputHybridOldTight.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/dtc_noTruncation_outputTmttOldLoose.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/StubRateToolOutput/dtc_noTruncation_outputTmttOldLoose.root --particle="ele"
StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/dtc_noTruncation_outputTmttOldTight.root -o /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/StubRateToolOutput/dtc_noTruncation_outputTmttOldTight.root --particle="ele"
