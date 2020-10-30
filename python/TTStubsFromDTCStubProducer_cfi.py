import FWCore.ParameterSet.Config as cms

TTStubsFromDTCStubProducer_params = cms.PSet (

  TTDTCStubsAcceptedTag        = cms.InputTag( "TrackerDTCProducer", "StubAccepted" ), # dtc passed stubs selection
  TTDTCStubsRejectedTag        = cms.InputTag( "TrackerDTCProducer", "StubLost" ), # dtc passed stubs selection
  BranchStubAccepted           = cms.string  ( "DTCStubAccepted" ), # label for product with passed stubs
  BranchStubRejected           = cms.string  ( "DTCStubRejected" ), # label for product with rejected stubs

  NumRegions = cms.int32(9),
  NumDTCsPerRegion = cms.int32(24),
  NumOverlappingRegions = cms.int32(2)
)
