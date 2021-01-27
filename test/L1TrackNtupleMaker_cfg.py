############################################################
# define basic process
############################################################
import FWCore.ParameterSet.Config as cms
import FWCore.Utilities.FileUtils as FileUtils
import FWCore.ParameterSet.VarParsing as opts
import os
import sys

process = cms.Process("L1TrackNtuple")

options = opts.VarParsing ("analysis")

#--- Specify input MC
options.register('inputMC', 'TTBar_PU200.txt', opts.VarParsing.multiplicity.singleton, opts.VarParsing.varType.string, "Files to be processed")

#--- Specify number of events to process.
options.register('Events',100, opts.VarParsing.multiplicity.singleton, opts.VarParsing.varType.int,"Number of Events to analyze")

#--- Specify name of output root file. (If name = '', then no histogram file will be produced).
options.register('output','output.root', opts.VarParsing.multiplicity.singleton, opts.VarParsing.varType.string,"Name of output ROOT file")

#--- Specify geometry to be used
options.register("Geometry", "D49", opts.VarParsing.multiplicity.singleton, opts.VarParsing.varType.string, "Geometry used")

#--- Specify L1 Tracking algo to be used
options.register("L1Algo", 'HYBRID', opts.VarParsing.multiplicity.singleton, opts.VarParsing.varType.string, "L1 Tracking algo used")

#--- Specify stub window to be used
options.register("StubWindow", '', opts.VarParsing.multiplicity.singleton, opts.VarParsing.varType.string, "Stub window to be used")

#--- Specify the track nTuple process 
options.register('Process', 1, opts.VarParsing.multiplicity.singleton, opts.VarParsing.varType.int,"Track nTuple process")

options.parseArguments()

############################################################
# edit options here
############################################################

GEOMETRY = options.Geometry
L1TRKALGO = options.L1Algo  # L1 tracking algorithm: 'HYBRID' (baseline, 4par fit) or 'HYBRID_DISPLACED' (extended, 5par fit)
STUBWINDOW = options.StubWindow

WRITE_DATA = False

############################################################
# import standard configurations
############################################################

if GEOMETRY == "D49": 
    print "using geometry " + GEOMETRY + " (tilted)"
    process.load('Configuration.Geometry.GeometryExtended2026D49Reco_cff')
    process.load('Configuration.Geometry.GeometryExtended2026D49_cff')
else:
    print "this is not a valid geometry!!!"

process.load('Configuration.StandardSequences.Services_cff')
process.load('Configuration.EventContent.EventContent_cff')
process.load('Configuration.StandardSequences.MagneticField_cff')

process.load('Configuration.StandardSequences.EndOfProcess_cff')
process.load('Configuration.StandardSequences.FrontierConditions_GlobalTag_cff')

from Configuration.AlCa.GlobalTag import GlobalTag
process.GlobalTag = GlobalTag(process.GlobalTag, 'auto:phase2_realistic', '')

process.load('FWCore.MessageService.MessageLogger_cfi')
process.MessageLogger.categories.append('Tracklet')
process.MessageLogger.categories.append('L1track')
process.MessageLogger.Tracklet = cms.untracked.PSet(limit = cms.untracked.int32(-1))

############################################################
# input and output
############################################################

process.maxEvents = cms.untracked.PSet( input = cms.untracked.int32(options.Events) )

# Get list of MC datasets from repo, or specify yourself.

#def getTxtFile(txtFileName): 
#  return FileUtils.loadListFromFile(os.environ['CMSSW_BASE']+'/src/'+txtFileName)

#if GEOMETRY == "D49":
#    inputMC = ["/store/relval/CMSSW_11_1_0_pre2/RelValTTbar_14TeV/GEN-SIM-DIGI-RAW/PU25ns_110X_mcRun4_realistic_v2_2026D49PU200-v1/20000/F7BF4AED-51F1-9D47-B86D-6C3DDA134AB9.root"]
#    inputMC = ["file:/vols/cms/adm10/MC/TMTT/MCsamples/1110/RelVel/TTbar/PU200/EEF2AE4F-EAF2-5645-B18F-99261DE20003.root"]
#else:
#    print "this is not a valid geometry!!!"

#list = FileUtils.loadListFromFile(options.inputMC)
#readFiles = cms.untracked.vstring(*list)
##process.source = cms.Source("PoolSource", fileNames = cms.untracked.vstring(*inputMC))
#process.source = cms.Source("PoolSource", fileNames = readFiles)

process.source = cms.Source("PoolSource", fileNames= cms.untracked.vstring(options.inputFiles))

process.TFileService = cms.Service("TFileService", fileName = cms.string(options.output), closeFileFast = cms.untracked.bool(True))
process.Timing = cms.Service("Timing", summaryOnly = cms.untracked.bool(True))

############################################################
# L1 tracking
############################################################

process.load("L1Trigger.TrackFindingTracklet.L1HybridEmulationTracks_cff")

# HYBRID: prompt tracking
if (L1TRKALGO == 'HYBRID'):
    process.TTTracksEmulation = cms.Path(process.L1HybridTracks)
    process.TTTracksEmulationWithTruth = cms.Path(process.L1HybridTracksWithAssociators)
    NHELIXPAR = 4
    L1TRK_NAME  = "TTTracksFromTrackletEmulation"
    L1TRK_LABEL = "Level1TTTracks"
    L1TRUTH_NAME = "TTTrackAssociatorFromPixelDigis"

# HYBRID: extended tracking
elif (L1TRKALGO == 'HYBRID_DISPLACED'):
    process.TTTracksEmulation = cms.Path(process.L1ExtendedHybridTracks)
    process.TTTracksEmulationWithTruth = cms.Path(process.L1ExtendedHybridTracksWithAssociators)
    NHELIXPAR = 5
    L1TRK_NAME  = "TTTracksFromExtendedTrackletEmulation"
    L1TRK_LABEL = "Level1TTTracks"
    L1TRUTH_NAME = "TTTrackAssociatorFromPixelDigisExtended"
    
# LEGACY ALGORITHM (EXPERTS ONLY): TRACKLET  
elif (L1TRKALGO == 'TRACKLET'):
    print "\n WARNING - this is not a recommended algorithm! Please use HYBRID (HYBRID_DISPLACED)!"
    print "\n To run the tracklet-only algorithm, please ensure you have commented out #define USEHYBRID in interface/Settings.h + recompiled! \n"
    process.TTTracksEmulation = cms.Path(process.L1HybridTracks)
    process.TTTracksEmulationWithTruth = cms.Path(process.L1HybridTracksWithAssociators)
    NHELIXPAR = 4
    L1TRK_NAME  = "TTTracksFromTrackletEmulation"
    L1TRK_LABEL = "Level1TTTracks"
    L1TRUTH_NAME = "TTTrackAssociatorFromPixelDigis"

# LEGACY ALGORITHM (EXPERTS ONLY): TMTT  
elif (L1TRKALGO == 'TMTT'):
    print "\n WARNING - this is not a recommended algorithm! Please use HYBRID (HYBRID_DISPLACED)! \n"
    process.load("L1Trigger.TrackFindingTMTT.TMTrackProducer_Ultimate_cff")
    L1TRK_PROC  =  process.TMTrackProducer    
    L1TRK_NAME  = "TMTrackProducer"
    L1TRK_LABEL = "TML1TracksKF4ParamsComb"
    L1TRUTH_NAME = "TTTrackAssociatorFromPixelDigis"
    NHELIXPAR = 4
    L1TRK_PROC.EnableMCtruth = cms.bool(False) # Reduce CPU use by disabling internal histos.
    L1TRK_PROC.EnableHistos  = cms.bool(False)
    process.load("RecoVertex.BeamSpotProducer.BeamSpot_cfi")
    process.load("SimTracker.TrackTriggerAssociation.TrackTriggerAssociator_cff")
    process.TTTrackAssociatorFromPixelDigis.TTTracks = cms.VInputTag( cms.InputTag(L1TRK_NAME, L1TRK_LABEL) )
    process.TTTracksEmulation = cms.Path(process.offlineBeamSpot*L1TRK_PROC)
    process.TTTracksEmulationWithTruth = cms.Path(process.offlineBeamSpot*L1TRK_PROC*process.TrackTriggerAssociatorTracks)

else:
    print "ERROR: Unknown L1TRKALGO option"
    exit(1)

############################################################
# L1 tracking: remake stubs
############################################################

process.load('L1Trigger.TrackTrigger.TrackTrigger_cff')
process.load("SimTracker.TrackTriggerAssociation.TrackTriggerAssociator_cff")

from L1Trigger.TrackTrigger.TTStubAlgorithmRegister_cfi import *

### from SimTracker.TrackTriggerAssociation.TTClusterAssociation_cfi import *
process.TTClusterAssociatorFromPixelDigis.digiSimLinks = cms.InputTag("simSiPixelDigis","Tracker")

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

elif (STUBWINDOW == 'NEW_LOOSE'):
  print "Using Reza Goldouzian's new loose window tuning"

  process.TTStubAlgorithm_official_Phase2TrackerDigi_ = cms.ESProducer("TTStubAlgorithm_official_Phase2TrackerDigi_",
    zMatchingPS  = cms.bool(True),
    zMatching2S  = cms.bool(True),
    #Number of tilted rings per side in barrel layers (for tilted geom only)
    NTiltedRings = cms.vdouble( 0., 12., 12., 12., 0., 0., 0.),
    BarrelCut = cms.vdouble( 0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0 ),
    TiltedBarrelCutSet = cms.VPSet(
      cms.PSet( TiltedCut = cms.vdouble( 0 ) ),
      cms.PSet( TiltedCut = cms.vdouble( 0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0) ),
      cms.PSet( TiltedCut = cms.vdouble( 0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0) ),
      cms.PSet( TiltedCut = cms.vdouble( 0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0) ),
    ),
    EndcapCutSet = cms.VPSet(
      cms.PSet( EndcapCut = cms.vdouble( 0 ) ),
      cms.PSet( EndcapCut = cms.vdouble( 0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0) ),
      cms.PSet( EndcapCut = cms.vdouble( 0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0) ),
      cms.PSet( EndcapCut = cms.vdouble( 0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0) ),
      cms.PSet( EndcapCut = cms.vdouble( 0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0) ),
      cms.PSet( EndcapCut = cms.vdouble( 0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0) ),
    )
) 

elif (STUBWINDOW == 'NEW_TIGHT'):
  print "Using Reza Goldouzian's new tight window tuning"

  process.TTStubAlgorithm_official_Phase2TrackerDigi_ = cms.ESProducer("TTStubAlgorithm_official_Phase2TrackerDigi_",
    zMatchingPS  = cms.bool(True),
    zMatching2S  = cms.bool(True),
    #Number of tilted rings per side in barrel layers (for tilted geom only)
    NTiltedRings = cms.vdouble( 0., 12., 12., 12., 0., 0., 0.),
    BarrelCut = cms.vdouble( 0, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5 ),
    TiltedBarrelCutSet = cms.VPSet(
      cms.PSet( TiltedCut = cms.vdouble( 0 ) ),
      cms.PSet( TiltedCut = cms.vdouble( 0, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5) ),
      cms.PSet( TiltedCut = cms.vdouble( 0, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5) ),
      cms.PSet( TiltedCut = cms.vdouble( 0, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5) ),
    ),
    EndcapCutSet = cms.VPSet(
      cms.PSet( EndcapCut = cms.vdouble( 0 ) ),
      cms.PSet( EndcapCut = cms.vdouble( 0, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5) ),
      cms.PSet( EndcapCut = cms.vdouble( 0, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5) ),
      cms.PSet( EndcapCut = cms.vdouble( 0, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5) ),
      cms.PSet( EndcapCut = cms.vdouble( 0, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5) ),
      cms.PSet( EndcapCut = cms.vdouble( 0, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5) ),
    )
) 



process.remakeStubs = cms.Path(process.TrackTriggerClustersStubs * process.TrackTriggerAssociatorClustersStubs)

############################################################
# Define the track ntuple process, MyProcess is the (unsigned) PDGID corresponding to the process which is run
# e.g. single electron/positron = 11
#      single pion+/pion- = 211
#      single muon+/muon- = 13 
#      pions in jets = 6
#      taus = 15
#      all TPs = 1
############################################################

process.L1TrackNtuple = cms.EDAnalyzer('L1TrackNtupleMakerStubStudy',
                                       MyProcess = cms.int32(options.Process),
                                       DebugMode = cms.bool(False),      # printout lots of debug statements
                                       SaveAllTracks = cms.bool(True),   # save *all* L1 tracks, not just truth matched to primary particle
                                       SaveStubs = cms.bool(True),      # save some info for *all* stubs
                                       L1Tk_nPar = cms.int32(NHELIXPAR), # use 4 or 5-parameter L1 tracking?
                                       L1Tk_minNStub = cms.int32(4),     # L1 tracks with >= 4 stubs
                                       TP_minNStub = cms.int32(4),       # require TP to have >= X number of stubs associated with it
                                       TP_minNStubLayer = cms.int32(4),  # require TP to have stubs in >= X layers/disks
                                       TP_minPt = cms.double(2.0),       # only save TPs with pt > X GeV
                                       TP_maxEta = cms.double(2.5),      # only save TPs with |eta| < X
                                       TP_maxZ0 = cms.double(30.0),      # only save TPs with |z0| < X cm
                                       TP_maxD0 = cms.double(5.0),      # only save TPs with |d0| < X cm
                                       TP_maxVertR = cms.double( 1.  ), # cut on vertex pos r in cm
                                       L1TrackInputTag = cms.InputTag(L1TRK_NAME, L1TRK_LABEL),         # TTTrack input
                                       MCTruthTrackInputTag = cms.InputTag(L1TRUTH_NAME, L1TRK_LABEL),  # MCTruth input 
                                       # other input collections
                                       L1StubInputTag = cms.InputTag("TTStubsFromPhase2TrackerDigis","StubAccepted"), 
                                       L1StubRejectedInputTag = cms.InputTag("TTStubsFromPhase2TrackerDigis","StubRejected"),
                                       MCTruthClusterInputTag = cms.InputTag("TTClusterAssociatorFromPixelDigis", "ClusterInclusive"),
                                       MCTruthStubInputTag = cms.InputTag("TTStubAssociatorFromPixelDigis", "StubAccepted"),
                                       TrackingParticleInputTag = cms.InputTag("mix", "MergedTrackTruth"),
                                       TrackingVertexInputTag = cms.InputTag("mix", "MergedTrackTruth"),
                                       # tracking in jets (--> requires AK4 genjet collection present!)
                                       TrackingInJets = cms.bool(True),
                                       GenJetInputTag = cms.InputTag("ak4GenJets", ""),
                                       )

process.ana = cms.Path(process.L1TrackNtuple)

process.schedule = cms.Schedule(process.remakeStubs, process.TTTracksEmulationWithTruth, process.ana)

############################################################
# write output dataset?
############################################################

if (WRITE_DATA):
  process.writeDataset = cms.OutputModule("PoolOutputModule",
      splitLevel = cms.untracked.int32(0),
      eventAutoFlushCompressedSize = cms.untracked.int32(5242880),
      outputCommands = process.RAWSIMEventContent.outputCommands,
      fileName = cms.untracked.string('output_dataset.root'), ## ADAPT IT ##
      dataset = cms.untracked.PSet(
          filterName = cms.untracked.string(''),
          dataTier = cms.untracked.string('GEN-SIM')
      )
  )
#  process.writeDataset.outputCommands.append('keep  *TTTrack*_*_*_*')
#  process.writeDataset.outputCommands.append('keep  *TTStub*_*_*_*')
  process.writeDataset.outputCommands.append('keep  *')

  process.pd = cms.EndPath(process.writeDataset)
  process.schedule.append(process.pd)

