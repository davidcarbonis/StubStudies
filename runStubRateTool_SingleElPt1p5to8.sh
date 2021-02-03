#!/bin/bash

#!/bin/bash
fail_exit() { echo "$@" 1>&2; exit 1; }

echo "Start of job on " `date`

cd /home/hep/adm10/CMSSW/CMSSW_11_2_0_pre6/src/L1Trigger/StubStudies/

source /cvmfs/cms.cern.ch/cmsset_default.sh

eval `scramv1 runtime -sh`

export LD_LIBRARY_PATH=`pwd`/lib/:`pwd`/lib64/:${LD_LIBRARY_PATH}

##
#echo SingleEl + PU0 output
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/Hybrid_DefaultWindows/-o $TMP/outputHybridDefaultWindows.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/Hybrid_OldLoose/-o $TMP/outputHybridOldLoose.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/Hybrid_OldTight/-o $TMP/outputHybridOldTight.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/Tmtt_DefaultWindows/-o $TMP/outputTmttDefaultWindows.root --particle="ele" 
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/Tmtt_OldLoose/-o $TMP/outputTmttOldLoose.root --particle="ele" 
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/Tmtt_OldTight/-o $TMP/outputTmttOldTight.root --particle="ele"
#echo SingleEl output + PU0 + dtc emulation
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/dtc_Hybrid_DefaultWindows/-o $TMP/dtc_outputHybridDefaultWindows.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/dtc_Hybrid_OldLoose/-o $TMP/dtc_outputHybridOldLoose.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/dtc_Hybrid_OldTight/-o $TMP/dtc_outputHybridOldTight.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/dtc_Tmtt_DefaultWindows/-o $TMP/dtc_outputTmttDefaultWindows.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/dtc_Tmtt_OldLoose/-o $TMP/dtc_outputTmttOldLoose.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/dtc_Tmtt_OldTight/-o $TMP/dtc_outputTmttOldTight.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/dtc_Hybrid_DefaultWindows_noTruncation/-o $TMP/dtc_noTruncation_outputHybridDefaultWindows.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/dtc_Hybrid_OldLoose_noTruncation/-o $TMP/dtc_noTruncation_outputHybridOldLoose.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/dtc_Hybrid_OldTight_noTruncation/-o $TMP/dtc_noTruncation_outputHybridOldTight.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/dtc_Tmtt_DefaultWindows_noTruncation/-o $TMP/dtc_noTruncation_outputTmttDefaultWindows.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/dtc_Tmtt_OldLoose_noTruncation/-o $TMP/dtc_noTruncation_outputTmttOldLoose.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/dtc_Tmtt_OldTight_noTruncation/-o $TMP/dtc_noTruncation_outputTmttOldTight.root --particle="ele"

##
#echo SingleEl + PU200 output
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/Hybrid_DefaultWindows -o /$TMP/outputHybridDefaultWindows.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/Hybrid_OldLoose -o /$TMP/outputHybridOldLoose.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/Hybrid_OldTight -o /$TMP/outputHybridOldTight.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/Tmtt_DefaultWindows -o /$TMP/outputTmttDefaultWindows.root --particle="ele" 
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/Tmtt_OldLoose -o /$TMP/outputTmttOldLoose.root --particle="ele" 
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/Tmtt_OldTight -o /$TMP/outputTmttOldTight.root --particle="ele"
#echo SingleEl output + PU200 + dtc emulation
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/dtc_Hybrid_DefaultWindows -o /$TMP/dtc_outputHybridDefaultWindows.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/dtc_Hybrid_OldLoose -o /$TMP/dtc_outputHybridOldLoose.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/dtc_Hybrid_OldTight -o /$TMP/dtc_outputHybridOldTight.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/dtc_Tmtt_DefaultWindows -o /$TMP/dtc_outputTmttDefaultWindows.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/dtc_Tmtt_OldLoose -o /$TMP/dtc_outputTmttOldLoose.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/dtc_Tmtt_OldTight -o /$TMP/dtc_outputTmttOldTight.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/dtc_Hybrid_DefaultWindows_noTruncation -o /$TMP/dtc_noTruncation_outputHybridDefaultWindows.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/dtc_Hybrid_OldLoose_noTruncation -o /$TMP/dtc_noTruncation_outputHybridOldLoose.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/dtc_Hybrid_OldTight_noTruncation -o /$TMP/dtc_noTruncation_outputHybridOldTight.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/dtc_Tmtt_DefaultWindows_noTruncation -o /$TMP/dtc_noTruncation_outputTmttDefaultWindows.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/dtc_Tmtt_OldLoose_noTruncation -o /$TMP/dtc_noTruncation_outputTmttOldLoose.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/dtc_Tmtt_OldTight_noTruncation -o /$TMP/dtc_noTruncation_outputTmttOldTight.root --particle="ele"

cp $TMP/*.root  /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU0_output/StubRateToolOutput/ -v
# cp $TMP/*.root  /vols/cms/adm10/MC/TMTT/StubStudies/SingleElPt1p5to8_PU200_output/StubRateToolOutput/ -v

echo "\nEnd of job on " `date` "\n"

