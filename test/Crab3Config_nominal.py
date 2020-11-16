# -*- coding: utf-8 -*-
from collections import namedtuple
from datetime import datetime

from CRABClient.UserUtilities import config

Dataset = namedtuple("Dataset", "process dataset")
#dataset = Dataset("DisplacedMuPt1p5To8_PU0", "/RelValDisplacedMuPt1p5To8/CMSSW_11_2_0_pre6-112X_mcRun4_realistic_v2_2026D49noPU_L1T-v1/GEN-SIM-DIGI-RAW")
#dataset = Dataset("DisplacedMuPt2To100_PU0", "/RelValDisplacedMuPt2To100/CMSSW_11_2_0_pre6-112X_mcRun4_realistic_v2_2026D49noPU_L1T-v1/GEN-SIM-DIGI-RAW")
#dataset = Dataset("SingleElectronPt1p5To8_PU0", "/RelValSingleElectronFlatPt1p5To8/CMSSW_11_2_0_pre6-112X_mcRun4_realistic_v2_2026D49noPU_L1T-v1/GEN-SIM-DIGI-RAW")
#dataset = Dataset("SingleElectronPt2To100_PU0", "/RelValSingleEFlatPt2To100/CMSSW_11_2_0_pre6-112X_mcRun4_realistic_v2_2026D49noPU_L1T-v1/GEN-SIM-DIGI-RAW")
#dataset = Dataset("SingleMuFlatPt1p5To8_PU0", "/RelValSingleMuFlatPt1p5To8/CMSSW_11_2_0_pre6-112X_mcRun4_realistic_v2_2026D49noPU_L1T-v1/GEN-SIM-DIGI-RAW")
#dataset = Dataset("SingleMuFlatPt2To100_PU0", "/RelValSingleMuFlatPt2To100/CMSSW_11_2_0_pre6-112X_mcRun4_realistic_v2_2026D49noPU_L1T-v1/GEN-SIM-DIGI-RAW")
dataset = Dataset("TTbar_PU0", "/RelValTTbar_14TeV/CMSSW_11_2_0_pre5-110X_mcRun4_realistic_v3_2026D49noPU-v1/GEN-SIM-DIGI-RAW")

#dataset = Dataset("DisplacedMuPt1p5To8_PU200", "/RelValDisplacedMuPt1p5To8/CMSSW_11_2_0_pre6-PU25ns_112X_mcRun4_realistic_v2_2026D49PU200_L1T-v2/GEN-SIM-DIGI-RAW")
#dataset = Dataset("DisplacedMuPt2To100_PU200", "/RelValDisplacedMuPt2To100/CMSSW_11_2_0_pre6-PU25ns_112X_mcRun4_realistic_v2_2026D49PU200_L1T-v2/GEN-SIM-DIGI-RAW")
#dataset = Dataset("SingleElectronPt1p5To8_PU200", "/RelValSingleElectronFlatPt1p5To8/CMSSW_11_2_0_pre6-PU25ns_112X_mcRun4_realistic_v2_2026D49PU200_L1T-v2/GEN-SIM-DIGI-RAW")
#dataset = Dataset("SingleElectronPt2To100_PU200", "/RelValSingleEFlatPt2To100/CMSSW_11_2_0_pre6-PU25ns_112X_mcRun4_realistic_v2_2026D49PU200_L1T-v2/GEN-SIM-DIGI-RAW")
#dataset = Dataset("SingleMuFlatPt1p5To8_PU200", "/RelValSingleMuFlatPt1p5To8/CMSSW_11_2_0_pre6-PU25ns_112X_mcRun4_realistic_v2_2026D49PU200_L1T-v2/GEN-SIM-DIGI-RAW")
#dataset = Dataset("SingleMuFlatPt2To100_PU200", "/RelValSingleMuFlatPt2To100/CMSSW_11_2_0_pre6-PU25ns_112X_mcRun4_realistic_v2_2026D49PU200_L1T-v2/GEN-SIM-DIGI-RAW")
#dataset = Dataset("TTbar_PU200", "/RelValTTbar_14TeV/CMSSW_11_2_0_pre5-PU25ns_110X_mcRun4_realistic_v3_2026D49PU200-v1/GEN-SIM-DIGI-RAW")

##

AlgoArg = namedtuple("AlgoArg", "process algoarg")
algoArg = AlgoArg("Hybrid", "HYBRID")
#algoArg = AlgoArg("Tmtt", "TMTT")

StubWindow = namedtuple("StubWindow", "process stubwindow")
stubWindow = StubWindow("OldTight", "OLD_TIGHT")
#stubWindow = StubWindow("OldLoose", "OLD_LOOSE")
#stubWindow = StubWindow("NewTight", "NEW_TIGHT")
#stubWindow = StubWindow("NewLoose", "NEW_LOOSE")

time = datetime.now().strftime("%Y%m%d%H%M%S")

config = config()

config.General.requestName = '{}_{}_{}_{}'.format(dataset.process, algoArg.process, stubWindow.process, time)
config.General.workArea = 'crab_projects'

config.JobType.pluginName = 'Analysis'
config.JobType.psetName = 'L1TrackNtupleMaker_cfg.py'
config.JobType.pyCfgParams=["L1Algo="+algoArg.algoarg, "StubWindow="+stubWindow.stubwindow]

config.Data.inputDataset = dataset.dataset
config.Data.inputDBS = 'global' ## normal centrally generated MC

config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = 1
config.Data.outLFNDirBase = '/store/user/almorton/MC/Ph2-TkFinding/'

config.Data.publication = False
config.Data.outputDatasetTag = "CRAB3_MC_L1TrackNtupleMaker_default_{}_{}_{}_{}".format(dataset.process, algoArg.process, stubWindow.process, time)

config.Data.allowNonValidInputDataset = False

config.Site.storageSite = 'T2_UK_London_IC'

