#!/bin/bash

#!/bin/bash
fail_exit() { echo "$@" 1>&2; exit 1; }

echo "Start of job on " `date`

cd /home/hep/adm10/CMSSW/CMSSW_11_2_0_pre6/src/L1Trigger/StubStudies/

source /cvmfs/cms.cern.ch/cmsset_default.sh

eval `scramv1 runtime -sh`

export LD_LIBRARY_PATH=`pwd`/lib/:`pwd`/lib64/:${LD_LIBRARY_PATH}

#echo TTbar + PU200 output
# all particles
#echo TTbar + PU200 output all particles
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_DefaultWindows/ $TMP/outputHybridDefaultWindows_all.root --particle="all"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_DefaultWindows/ $TMP/outputHybridDefaultWindows_all.root --particle="all"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_OldLoose/ $TMP/outputHybridOldLoose_all.root --particle="all"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_OldLoose/ $TMP/outputHybridOldLoose_all.root --particle="all"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_OldTight/ $TMP/outputHybridOldTight_all.root --particle="all"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_OldTight/ $TMP/outputHybridOldTight_all.root --particle="all"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_DefaultWindows/ $TMP/outputTmttDefaultWindows_all.root --particle="all"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_DefaultWindows/ $TMP/outputTmttDefaultWindows_all.root --particle="all"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_OldLoose/ $TMP/outputTmttOldLoose_all.root --particle="all"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_OldLoose/ $TMP/outputTmttOldLoose_all.root --particle="all"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_OldTight/ $TMP/outputTmttOldTight_all.root --particle="all"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_OldTight/ $TMP/outputTmttOldTight_all.root --particle="all"

#electrons
#echo TTbar + PU200 output electrons
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_DefaultWindows/ $TMP/outputHybridDefaultWindows_ele.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_DefaultWindows/ $TMP/outputHybridDefaultWindows_ele.root --particle="ele"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_OldLoose/ $TMP/outputHybridOldLoose_ele.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_OldLoose/ $TMP/outputHybridOldLoose_ele.root --particle="ele"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_OldTight/ $TMP/outputHybridOldTight_ele.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_OldTight/ $TMP/outputHybridOldTight_ele.root --particle="ele"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_DefaultWindows/ $TMP/outputTmttDefaultWindows_ele.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_DefaultWindows/ $TMP/outputTmttDefaultWindows_ele.root --particle="ele"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_OldLoose/ $TMP/outputTmttOldLoose_ele.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_OldLoose/ $TMP/outputTmttOldLoose_ele.root --particle="ele"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_OldTight/ $TMP/outputTmttOldTight_ele.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_OldTight/ $TMP/outputTmttOldTight_ele.root --particle="ele"

#muons
#echo TTbar + PU200 output muons
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_DefaultWindows/ $TMP/outputHybridDefaultWindows_mu.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_DefaultWindows/ $TMP/outputHybridDefaultWindows_mu.root --particle="mu"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_OldLoose/ $TMP/outputHybridOldLoose_mu.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_OldLoose/ $TMP/outputHybridOldLoose_mu.root --particle="mu"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_OldTight/ $TMP/outputHybridOldTight_mu.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_OldTight/ $TMP/outputHybridOldTight_mu.root --particle="mu"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_DefaultWindows/ $TMP/outputTmttDefaultWindows_mu.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_DefaultWindows/ $TMP/outputTmttDefaultWindows_mu.root --particle="mu"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_OldLoose/ $TMP/outputTmttOldLoose_mu.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_OldLoose/ $TMP/outputTmttOldLoose_mu.root --particle="mu"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_OldTight/ $TMP/outputTmttOldTight_mu.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_OldTight/ $TMP/outputTmttOldTight_mu.root --particle="mu"

#pions
#echo TTbar + PU200 output pions
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_DefaultWindows/ $TMP/outputHybridDefaultWindows_pion.root --particle="pion"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_DefaultWindows/ $TMP/outputHybridDefaultWindows_pion.root --particle="pion"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_OldLoose/ $TMP/outputHybridOldLoose_pion.root --particle="pion"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_OldLoose/ $TMP/outputHybridOldLoose_pion.root --particle="pion"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_OldTight/ $TMP/outputHybridOldTight_pion.root --particle="pion"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Hybrid_OldTight/ $TMP/outputHybridOldTight_pion.root --particle="pion"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_DefaultWindows/ $TMP/outputTmttDefaultWindows_pion.root --particle="pion"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_DefaultWindows/ $TMP/outputTmttDefaultWindows_pion.root --particle="pion"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_OldLoose/ $TMP/outputTmttOldLoose_pion.root --particle="pion"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_OldLoose/ $TMP/outputTmttOldLoose_pion.root --particle="pion"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_OldTight/ $TMP/outputTmttOldTight_pion.root --particle="pion"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/Tmtt_OldTight/ $TMP/outputTmttOldTight_pion.root --particle="pion"

#
#echo TTbar output + PU200 + dtc emulation
# all particles
#echo TTbar output + PU200 + dtc emulation all particles
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_DefaultWindows/ $TMP/dtc_outputHybridDefaultWindows_all.root --particle="all"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_DefaultWindows/ $TMP/dtc_outputHybridDefaultWindows_all.root --particle="all"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldLoose/ $TMP/dtc_outputHybridOldLoose_all.root --particle="all"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldLoose/ $TMP/dtc_outputHybridOldLoose_all.root --particle="all"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldTight/ $TMP/dtc_outputHybridOldTight_all.root --particle="all"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldTight/ $TMP/dtc_outputHybridOldTight_all.root --particle="all"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_DefaultWindows/ $TMP/dtc_outputTmttDefaultWindows_all.root --particle="all"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_DefaultWindows/ $TMP/dtc_outputTmttDefaultWindows_all.root --particle="all"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldLoose/ $TMP/dtc_outputTmttOldLoose_all.root --particle="all"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldLoose/ $TMP/dtc_outputTmttOldLoose_all.root --particle="all"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldTight/ $TMP/dtc_outputTmttOldTight_all.root --particle="all"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldTight/ $TMP/dtc_outputTmttOldTight_all.root --particle="all"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_DefaultWindows_noTruncation/ $TMP/dtc_noTruncation_outputHybridDefaultWindows_all.root --particle="all"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_DefaultWindows_noTruncation/ $TMP/dtc_noTruncation_outputHybridDefaultWindows_all.root --particle="all"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldLoose_noTruncation/ $TMP/dtc_noTruncation_outputHybridOldLoose_all.root --particle="all"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldLoose_noTruncation/ $TMP/dtc_noTruncation_outputHybridOldLoose_all.root --particle="all"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldTight_noTruncation/ $TMP/dtc_noTruncation_outputHybridOldTight_all.root --particle="all"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldTight_noTruncation/ $TMP/dtc_noTruncation_outputHybridOldTight_all.root --particle="all"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_DefaultWindows_noTruncation/ $TMP/dtc_noTruncation_outputTmttDefaultWindows_all.root --particle="all"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_DefaultWindows_noTruncation/ $TMP/dtc_noTruncation_outputTmttDefaultWindows_all.root --particle="all"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldLoose_noTruncation/ $TMP/dtc_noTruncation_outputTmttOldLoose_all.root --particle="all"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldLoose_noTruncation/ $TMP/dtc_noTruncation_outputTmttOldLoose_all.root --particle="all"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldTight_noTruncation/ $TMP/dtc_noTruncation_outputTmttOldTight_all.root --particle="all"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldTight_noTruncation/ $TMP/dtc_noTruncation_outputTmttOldTight_all.root --particle="all"

#electrons
#echo TTbar output + PU200 + dtc emulation electrons
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_DefaultWindows/ $TMP/dtc_outputHybridDefaultWindows_ele.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_DefaultWindows/ $TMP/dtc_outputHybridDefaultWindows_ele.root --particle="ele"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldLoose/ $TMP/dtc_outputHybridOldLoose_ele.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldLoose/ $TMP/dtc_outputHybridOldLoose_ele.root --particle="ele"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldTight/ $TMP/dtc_outputHybridOldTight_ele.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldTight/ $TMP/dtc_outputHybridOldTight_ele.root --particle="ele"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_DefaultWindows/ $TMP/dtc_outputTmttDefaultWindows_ele.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_DefaultWindows/ $TMP/dtc_outputTmttDefaultWindows_ele.root --particle="ele"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldLoose/ $TMP/dtc_outputTmttOldLoose_ele.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldLoose/ $TMP/dtc_outputTmttOldLoose_ele.root --particle="ele"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldTight/ $TMP/dtc_outputTmttOldTight_ele.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldTight/ $TMP/dtc_outputTmttOldTight_ele.root --particle="ele"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_DefaultWindows_noTruncation/ $TMP/dtc_noTruncation_outputHybridDefaultWindows_ele.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_DefaultWindows_noTruncation/ $TMP/dtc_noTruncation_outputHybridDefaultWindows_ele.root --particle="ele"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldLoose_noTruncation/ $TMP/dtc_noTruncation_outputHybridOldLoose_ele.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldLoose_noTruncation/ $TMP/dtc_noTruncation_outputHybridOldLoose_ele.root --particle="ele"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldTight_noTruncation/ $TMP/dtc_noTruncation_outputHybridOldTight_ele.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldTight_noTruncation/ $TMP/dtc_noTruncation_outputHybridOldTight_ele.root --particle="ele"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_DefaultWindows_noTruncation/ $TMP/dtc_noTruncation_outputTmttDefaultWindows_ele.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_DefaultWindows_noTruncation/ $TMP/dtc_noTruncation_outputTmttDefaultWindows_ele.root --particle="ele"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldLoose_noTruncation/ $TMP/dtc_noTruncation_outputTmttOldLoose_ele.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldLoose_noTruncation/ $TMP/dtc_noTruncation_outputTmttOldLoose_ele.root --particle="ele"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldTight_noTruncation/ $TMP/dtc_noTruncation_outputTmttOldTight_ele.root --particle="ele"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldTight_noTruncation/ $TMP/dtc_noTruncation_outputTmttOldTight_ele.root --particle="ele"

#muons
#echo TTbar output + PU200 + dtc emulation muons
#echoStubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_DefaultWindows/ $TMP/dtc_outputHybridDefaultWindows_mu.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_DefaultWindows/ $TMP/dtc_outputHybridDefaultWindows_mu.root --particle="mu"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldLoose/ $TMP/dtc_outputHybridOldLoose_mu.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldLoose/ $TMP/dtc_outputHybridOldLoose_mu.root --particle="mu"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldTight/ $TMP/dtc_outputHybridOldTight_mu.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldTight/ $TMP/dtc_outputHybridOldTight_mu.root --particle="mu"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_DefaultWindows/ $TMP/dtc_outputTmttDefaultWindows_mu.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_DefaultWindows/ $TMP/dtc_outputTmttDefaultWindows_mu.root --particle="mu"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldLoose/ $TMP/dtc_outputTmttOldLoose_mu.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldLoose/ $TMP/dtc_outputTmttOldLoose_mu.root --particle="mu"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldTight/ $TMP/dtc_outputTmttOldTight_mu.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldTight/ $TMP/dtc_outputTmttOldTight_mu.root --particle="mu"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_DefaultWindows_noTruncation/ $TMP/dtc_noTruncation_outputHybridDefaultWindows_mu.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_DefaultWindows_noTruncation/ $TMP/dtc_noTruncation_outputHybridDefaultWindows_mu.root --particle="mu"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldLoose_noTruncation/ $TMP/dtc_noTruncation_outputHybridOldLoose_mu.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldLoose_noTruncation/ $TMP/dtc_noTruncation_outputHybridOldLoose_mu.root --particle="mu"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldTight_noTruncation/ $TMP/dtc_noTruncation_outputHybridOldTight_mu.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldTight_noTruncation/ $TMP/dtc_noTruncation_outputHybridOldTight_mu.root --particle="mu"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_DefaultWindows_noTruncation/ $TMP/dtc_noTruncation_outputTmttDefaultWindows_mu.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_DefaultWindows_noTruncation/ $TMP/dtc_noTruncation_outputTmttDefaultWindows_mu.root --particle="mu"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldLoose_noTruncation/ $TMP/dtc_noTruncation_outputTmttOldLoose_mu.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldLoose_noTruncation/ $TMP/dtc_noTruncation_outputTmttOldLoose_mu.root --particle="mu"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldTight_noTruncation/ $TMP/dtc_noTruncation_outputTmttOldTight_mu.root --particle="mu"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldTight_noTruncation/ $TMP/dtc_noTruncation_outputTmttOldTight_mu.root --particle="mu"

#pions
echo TTbar output + PU200 + dtc emulation pions
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_DefaultWindows/ $TMP/dtc_outputHybridDefaultWindows_pion.root --particle="pion"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_DefaultWindows/ $TMP/dtc_outputHybridDefaultWindows_pion.root --particle="pion"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldLoose/ $TMP/dtc_outputHybridOldLoose_pion.root --particle="pion"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldLoose/ $TMP/dtc_outputHybridOldLoose_pion.root --particle="pion"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldTight/ $TMP/dtc_outputHybridOldTight_pion.root --particle="pion"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldTight/ $TMP/dtc_outputHybridOldTight_pion.root --particle="pion"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_DefaultWindows/ $TMP/dtc_outputTmttDefaultWindows_pion.root --particle="pion"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_DefaultWindows/ $TMP/dtc_outputTmttDefaultWindows_pion.root --particle="pion"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldLoose/ $TMP/dtc_outputTmttOldLoose_pion.root --particle="pion"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldLoose/ $TMP/dtc_outputTmttOldLoose_pion.root --particle="pion"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldTight/ $TMP/dtc_outputTmttOldTight_pion.root --particle="pion"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldTight/ $TMP/dtc_outputTmttOldTight_pion.root --particle="pion"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_DefaultWindows_noTruncation/ $TMP/dtc_noTruncation_outputHybridDefaultWindows_pion.root --particle="pion"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_DefaultWindows_noTruncation/ $TMP/dtc_noTruncation_outputHybridDefaultWindows_pion.root --particle="pion"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldLoose_noTruncation/ $TMP/dtc_noTruncation_outputHybridOldLoose_pion.root --particle="pion"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldLoose_noTruncation/ $TMP/dtc_noTruncation_outputHybridOldLoose_pion.root --particle="pion"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldTight_noTruncation/ $TMP/dtc_noTruncation_outputHybridOldTight_pion.root --particle="pion"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Hybrid_OldTight_noTruncation/ $TMP/dtc_noTruncation_outputHybridOldTight_pion.root --particle="pion"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_DefaultWindows_noTruncation/ $TMP/dtc_noTruncation_outputTmttDefaultWindows_pion.root --particle="pion"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_DefaultWindows_noTruncation/ $TMP/dtc_noTruncation_outputTmttDefaultWindows_pion.root --particle="pion"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldLoose_noTruncation/ $TMP/dtc_noTruncation_outputTmttOldLoose_pion.root --particle="pion"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldLoose_noTruncation/ $TMP/dtc_noTruncation_outputTmttOldLoose_pion.root --particle="pion"
#echo StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldTight_noTruncation/ $TMP/dtc_noTruncation_outputTmttOldTight_pion.root --particle="pion"
#StubRateTool -i /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/dtc_Tmtt_OldTight_noTruncation/ $TMP/dtc_noTruncation_outputTmttOldTight_pion.root --particle="pion"

echo "ls $TMP/*.root"
ls $TMP/*.root
cp $TMP/*.root /vols/cms/adm10/MC/TMTT/StubStudies/TTbar_PU200_output/StubRateToolOutput/ -v

echo "\nEnd of job on " `date` "\n"


