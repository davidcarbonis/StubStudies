################################################################################################
# To run execute do
# cmsRun L1Trigger/TrackerDTC/test/test.py
# where the arguments take default values if you don't specify them. You can change defaults below.
#################################################################################################

import FWCore.ParameterSet.Config as cms

process = cms.Process( "Demo" )
process.load( 'Configuration.Geometry.GeometryExtended2026D49Reco_cff' )
process.load( 'Configuration.StandardSequences.MagneticField_cff' )
process.load( 'Configuration.StandardSequences.FrontierConditions_GlobalTag_cff' )
process.load( 'Configuration.StandardSequences.L1TrackTrigger_cff' )
process.load( "FWCore.MessageLogger.MessageLogger_cfi" )

from Configuration.AlCa.GlobalTag import GlobalTag
process.GlobalTag = GlobalTag( process.GlobalTag, 'auto:phase2_realistic', '' )

# load code that produces DTCStubs
process.load( 'L1Trigger.TrackerDTC.ProducerED_cff' )
# load code that analyzes DTCStubs
process.load( 'L1Trigger.TrackerDTC.Analyzer_cff' )
# cosutmize TT algorithm
from L1Trigger.TrackerDTC.Customize_cff import *
#producerUseTMTT(process)
#analyzerUseTMTT(process)

############################################################
# L1 tracking: remake stubs
############################################################

process.load('L1Trigger.TrackTrigger.TrackTrigger_cff')
process.load("SimTracker.TrackTriggerAssociation.TrackTriggerAssociator_cff")

from L1Trigger.TrackTrigger.TTStubAlgorithmRegister_cfi import *

### from SimTracker.TrackTriggerAssociation.TTClusterAssociation_cfi import *
process.TTClusterAssociatorFromPixelDigis.digiSimLinks = cms.InputTag("simSiPixelDigis","Tracker")

STUBWINDOW = ''
#STUBWINDOW = 'OLD_LOOSE'

if (STUBWINDOW == 'OLD_LOOSE'):
  # S.Viret's loose Dec. 2017 stub windows from commented out part of
  # L1Trigger/TrackTrigger/python/TTStubAlgorithmRegister_cfi.py in CMSSW 9.3.7
  # Optimised for electrons.
  print "Using Seb Viret's old loose stub window tuning"
  process.TTStubAlgorithm_official_Phase2TrackerDigi_ = cms.ESProducer("TTStubAlgorithm_official_Phase2TrackerDigi_",
    zMatchingPS  = cms.bool(True),
    zMatching2S  = cms.bool(True),
    #Number of tilted rings per side in barrel layers (for tilted geom only)
    NTiltedRings = cms.vdouble( 0., 12., 12., 12., 0., 0., 0.), 
    BarrelCut    = cms.vdouble( 0, 2.0, 3, 4.5, 6, 6.5, 7.0),
    TiltedBarrelCutSet = cms.VPSet(
      cms.PSet( TiltedCut = cms.vdouble( 0 ) ),
      cms.PSet( TiltedCut = cms.vdouble( 0, 3, 3., 2.5, 3., 3., 2.5, 2.5, 2., 1.5, 1.5, 1, 1) ),
      cms.PSet( TiltedCut = cms.vdouble( 0, 4., 4, 4, 4, 4., 4., 4.5, 5, 4., 3.5, 3.5, 3) ),
      cms.PSet( TiltedCut = cms.vdouble( 0, 5, 5, 5, 5, 5, 5, 5.5, 5, 5, 5.5, 5.5, 5.5) ),
    ),
    EndcapCutSet = cms.VPSet(
      cms.PSet( EndcapCut = cms.vdouble( 0 ) ),
      cms.PSet( EndcapCut = cms.vdouble( 0, 1., 2.5, 2.5, 3.5, 5.5, 5.5, 6, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 7, 7) ),
      cms.PSet( EndcapCut = cms.vdouble( 0, 0.5, 2.5, 2.5, 3, 5, 6, 6, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 7, 7) ),
      cms.PSet( EndcapCut = cms.vdouble( 0, 1, 3., 4.5, 6., 6.5, 6.5, 6.5, 7, 7, 7, 7, 7) ),
      cms.PSet( EndcapCut = cms.vdouble( 0, 1., 2.5, 3.5, 6., 6.5, 6.5, 6.5, 6.5, 7, 7, 7, 7) ),
      cms.PSet( EndcapCut = cms.vdouble( 0, 0.5, 1.5, 3., 4.5, 6.5, 6.5, 7, 7, 7, 7, 7, 7) ),
    )
  )

elif (STUBWINDOW == 'OLD_TIGHT'):
  # S.Viret's July 2017 stub windows (tight) from commented out part of
  # L1Trigger/TrackTrigger/python/TTStubAlgorithmRegister_cfi.py in CMSSW 9.3.2
  print "Using Seb Viret's old tight stub window tuning"

  process.TTStubAlgorithm_official_Phase2TrackerDigi_ = cms.ESProducer("TTStubAlgorithm_official_Phase2TrackerDigi_",
    zMatchingPS  = cms.bool(True),
    zMatching2S  = cms.bool(True),
    #Number of tilted rings per side in barrel layers (for tilted geom only)
    NTiltedRings = cms.vdouble( 0., 12., 12., 12., 0., 0., 0.), 
    BarrelCut = cms.vdouble( 0, 2.0, 2.0, 3.5, 4.5, 5.5, 6.5), #Use 0 as dummy to have direct access using DetId to the correct element 

    TiltedBarrelCutSet = cms.VPSet(
      cms.PSet( TiltedCut = cms.vdouble( 0 ) ),
      cms.PSet( TiltedCut = cms.vdouble( 0, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2., 2., 1.5, 1.5, 1., 1.) ),
      cms.PSet( TiltedCut = cms.vdouble( 0, 3., 3., 3., 3., 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2, 2) ),
      cms.PSet( TiltedCut = cms.vdouble( 0, 4.5, 4.5, 4, 4, 4, 4, 3.5, 3.5, 3.5, 3, 3, 3) ),
    ),
    EndcapCutSet = cms.VPSet(
      cms.PSet( EndcapCut = cms.vdouble( 0 ) ),
      cms.PSet( EndcapCut = cms.vdouble( 0, 1, 1.5, 1.5, 2, 2, 2.5, 3, 3, 3.5, 4, 2.5, 3, 3.5, 4.5, 5.5) ),
      cms.PSet( EndcapCut = cms.vdouble( 0, 1, 1.5, 1.5, 2, 2, 2, 2.5, 3, 3, 3, 2, 3, 4, 5, 5.5) ),
      cms.PSet( EndcapCut = cms.vdouble( 0, 1.5, 1.5, 2, 2, 2.5, 2.5, 2.5, 3.5, 2.5, 5, 5.5, 6) ),
      cms.PSet( EndcapCut = cms.vdouble( 0, 1.0, 1.5, 1.5, 2, 2, 2, 2, 3, 3, 6, 6, 6.5) ),
      cms.PSet( EndcapCut = cms.vdouble( 0, 1.0, 1.5, 1.5, 1.5, 2, 2, 2, 3, 3, 6, 6, 6.5) ),
    )
) 

process.remakeStubs = cms.Path(process.TrackTriggerClustersStubs * process.TrackTriggerAssociatorClustersStubs)

# build schedule
process.produce = cms.Path( process.TrackerDTCProducer )
process.analyze = cms.Path( process.TrackerDTCAnalyzer )
process.schedule = cms.Schedule( process.remakeStubs, process.produce, process.analyze )

# create options
import FWCore.ParameterSet.VarParsing as VarParsing
options = VarParsing.VarParsing( 'analysis' )
# specify input MC
Samples = {
#  '/store/relval/CMSSW_11_1_0_pre1/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU25ns_110X_mcRun4_realistic_v2_2026D49PU200_ext1-v1/20000/0330453B-9B8E-CA41-88B0-A047B68D1AF9.root',
#  '/store/relval/CMSSW_11_1_0_pre1/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU25ns_110X_mcRun4_realistic_v2_2026D49PU200_ext1-v1/20000/02180D14-024D-ED46-9899-B275EADB82CE.root',
#  '/store/relval/CMSSW_11_1_0_pre1/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU25ns_110X_mcRun4_realistic_v2_2026D49PU200_ext1-v1/20000/0207F436-9BAC-904D-B86A-C2CE18CC2A46.root',
#  '/store/relval/CMSSW_11_1_0_pre1/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU25ns_110X_mcRun4_realistic_v2_2026D49PU200_ext1-v1/20000/01323A12-1A0B-AE43-B7AB-BAAE294E4EFA.root',
#  '/store/relval/CMSSW_11_1_0_pre1/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU25ns_110X_mcRun4_realistic_v2_2026D49PU200_ext1-v1/20000/D87319E3-F541-5840-AA58-10F84ACE1523.root',
#  '/store/relval/CMSSW_11_1_0_pre1/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU25ns_110X_mcRun4_realistic_v2_2026D49PU200_ext1-v1/20000/D7384F02-54C2-AB49-AEF3-E4E7303541CA.root',
#  '/store/relval/CMSSW_11_1_0_pre1/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU25ns_110X_mcRun4_realistic_v2_2026D49PU200_ext1-v1/20000/D3629C85-EA34-C147-AC4D-939C41DEC68A.root',
#  '/store/relval/CMSSW_11_1_0_pre1/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU25ns_110X_mcRun4_realistic_v2_2026D49PU200_ext1-v1/20000/D253E174-69A1-A544-9719-0D9BFDAD5320.root',
#  '/store/relval/CMSSW_11_1_0_pre1/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU25ns_110X_mcRun4_realistic_v2_2026D49PU200_ext1-v1/20000/D0D41CBC-08BA-E14E-8FE9-BD982CC6CA95.root',
#  '/store/relval/CMSSW_11_1_0_pre1/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU25ns_110X_mcRun4_realistic_v2_2026D49PU200_ext1-v1/20000/CD22CEB0-26EE-3147-8076-82926A26FAD4.root',
#  '/store/relval/CMSSW_11_1_0_pre1/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU25ns_110X_mcRun4_realistic_v2_2026D49PU200_ext1-v1/20000/CB67FBC0-0BF9-BE4E-A6D6-1388B2B2D2BF.root',
#  '/store/relval/CMSSW_11_1_0_pre1/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU25ns_110X_mcRun4_realistic_v2_2026D49PU200_ext1-v1/20000/CB36BB1A-67D7-C04D-ADB9-50DEB9B49E73.root',
#  '/store/relval/CMSSW_11_1_0_pre1/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU25ns_110X_mcRun4_realistic_v2_2026D49PU200_ext1-v1/20000/C9DEB7AA-E520-8C4C-AE74-A482BF59B048.root',
#  '/store/relval/CMSSW_11_1_0_pre1/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU25ns_110X_mcRun4_realistic_v2_2026D49PU200_ext1-v1/20000/C8ABAD54-6291-FA44-92E1-5BEECB1D6793.root',
#  '/store/relval/CMSSW_11_1_0_pre1/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU25ns_110X_mcRun4_realistic_v2_2026D49PU200_ext1-v1/20000/C74CD357-330E-E442-8F9F-C060CA44964A.root',
#  '/store/relval/CMSSW_11_1_0_pre1/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU25ns_110X_mcRun4_realistic_v2_2026D49PU200_ext1-v1/20000/C6BD36D2-79B9-2142-9A17-1CCC4FA2DDF1.root',
#  '/store/relval/CMSSW_11_1_0_pre1/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU25ns_110X_mcRun4_realistic_v2_2026D49PU200_ext1-v1/20000/C5DE1FC8-F963-7641-8020-451DB641C609.root',
#  '/store/relval/CMSSW_11_1_0_pre1/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU25ns_110X_mcRun4_realistic_v2_2026D49PU200_ext1-v1/20000/C57720E8-F837-0448-8483-D06474BB316B.root',
#  '/store/relval/CMSSW_11_1_0_pre1/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU25ns_110X_mcRun4_realistic_v2_2026D49PU200_ext1-v1/20000/C41FF339-435A-EC4A-A830-3D9DB7630B0A.root',
#  '/store/relval/CMSSW_11_1_0_pre1/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU25ns_110X_mcRun4_realistic_v2_2026D49PU200_ext1-v1/20000/C38AE82D-587E-C34B-89DC-FBAE92696270.root',
  'file:/vols/cms/adm10/MC/TMTT/MCsamples/1110/RelVel/TTbar/PU200/EEF2AE4F-EAF2-5645-B18F-99261DE20003.root',
  'file:/vols/cms/adm10/MC/TMTT/MCsamples/1110/RelVel/TTbar/PU200/EFC9D9D3-09DC-304D-80E1-3A14B9E8CDDD.root',
  'file:/vols/cms/adm10/MC/TMTT/MCsamples/1110/RelVel/TTbar/PU200/F33F8D29-C834-B34C-AC6A-4C96BCC9A626.root',
  'file:/vols/cms/adm10/MC/TMTT/MCsamples/1110/RelVel/TTbar/PU200/F70AFCD2-89B3-2343-8ADA-D2101F96943B.root',
  'file:/vols/cms/adm10/MC/TMTT/MCsamples/1110/RelVel/TTbar/PU200/F7BF4AED-51F1-9D47-B86D-6C3DDA134AB9.root',

}

options.register( 'inputMC', Samples, VarParsing.VarParsing.multiplicity.singleton, VarParsing.VarParsing.varType.string, "Files to be processed" )
# specify number of events to process.
options.register( 'Events',100,VarParsing.VarParsing.multiplicity.singleton, VarParsing.VarParsing.varType.int, "Number of Events to analyze" )
options.parseArguments()

process.options = cms.untracked.PSet( wantSummary = cms.untracked.bool(False) )
process.maxEvents = cms.untracked.PSet( input = cms.untracked.int32(options.Events) )
process.source = cms.Source(
  "PoolSource",
  fileNames = cms.untracked.vstring( options.inputMC ),
  secondaryFileNames = cms.untracked.vstring(),
  duplicateCheckMode = cms.untracked.string( 'noDuplicateCheck' )
)
process.Timing = cms.Service( "Timing", summaryOnly = cms.untracked.bool( True ) )
process.TFileService = cms.Service( "TFileService", fileName = cms.string( "Hist.root" ) )

# uncomment next 8 lines to use local cabling map
#process.load("CondCore.CondDB.CondDB_cfi")
#process.CondDB.connect = 'sqlite_file:__PATH_TO_DB__/__FILE_NAME__.db'
#process.PoolDBESSource = cms.ESSource(
#  "PoolDBESSource", process.CondDB, toGet = cms.VPSet( cms.PSet(
#    record = cms.string( 'TrackerDetToDTCELinkCablingMapRcd' ),
#    tag    = cms.string( "__CHOSEN_TAG__"                    )
#) ) )
#process.es_prefer_local_TrackerDetToDTCELinkCablingMapRcd = cms.ESPrefer( "PoolDBESSource", "" )
