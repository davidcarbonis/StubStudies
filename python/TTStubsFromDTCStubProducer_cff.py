import FWCore.ParameterSet.Config as cms

#=== Import default values for all parameters & define EDProducer.

from L1Trigger.StubStudies.TTStubsFromDTCStubProducer_cfi import TTStubsFromDTCStubProducer_params

TTStubsFromDTCStubProducer = cms.EDProducer('TTStubsFromDTCStubProducer', TTStubsFromDTCStubProducer_params)
