#include "FWCore/Framework/interface/Frameworkfwd.h"
#include "FWCore/Framework/interface/EDProducer.h"

#include "FWCore/Framework/interface/Event.h"
#include "FWCore/Framework/interface/MakerMacros.h"

#include "FWCore/ParameterSet/interface/ParameterSet.h"

#include "FWCore/Framework/interface/Run.h"
#include "FWCore/Framework/interface/EventSetup.h"

#include "FWCore/Utilities/interface/EDGetToken.h"
#include "FWCore/Utilities/interface/EDPutToken.h"
#include "FWCore/Utilities/interface/ESGetToken.h"
#include "DataFormats/Common/interface/Handle.h"
#include "DataFormats/DetId/interface/DetId.h"

#include "DataFormats/L1TrackTrigger/interface/TTTypes.h"
#include "DataFormats/L1TrackTrigger/interface/TTDTC.h"
#include "L1Trigger/TrackerDTC/interface/Setup.h"
#include "L1Trigger/TrackerDTC/interface/SensorModule.h"
#include "L1Trigger/TrackerDTC/interface/DTC.h"

#include <numeric>
#include <algorithm>
#include <vector>
#include <string>
#include <memory>

class TTStubsFromDTCStubProducer : public edm::EDProducer {

   public:
      explicit TTStubsFromDTCStubProducer(const edm::ParameterSet&);
      ~TTStubsFromDTCStubProducer();

   private:
      virtual void beginJob(const edm::EventSetup&) ;
      virtual void produce(edm::Event&, const edm::EventSetup&);
      virtual void endJob();

      void convertDTCstubs(edm::Handle<TTDTC>& ttdtcHandle, std::map< DetId, std::vector< TTStub<Ref_Phase2TrackerDigi_> >* >& outputTTStubMap) const;

      template <typename TT, typename TTDetSetVec>
      void fill ( TTDetSetVec& outputEP, std::map< DetId, std::vector< TT >* >& inputMap ) const {
          // Loop over DetIds found and fill output collections for each DetId
          for ( auto const& map : inputMap ) {
              typename TTDetSetVec::FastFiller ff( outputEP, map.first );
              ff.resize( map.second->size() );
              std::copy( map.second->begin(), map.second->end(), ff.begin() );
          }
      }

      // ----------member data ---------------------------

    // ED input token for dtc stubs
    edm::EDGetTokenT<TTDTC> edGetTTDTCTokenAccepted_;
    edm::EDGetTokenT<TTDTC> edGetTTDTCTokenRejected_;

    // ED output tokens for TTStubs
    edm::EDPutTokenT<TTStubDetSetVec> edPutTTStubTokenAccepted_;
    edm::EDPutTokenT<TTStubDetSetVec> edPutTTStubTokenRejected_;

    const int numRegions_;            // number of phi slices the outer tracker readout is organized in
    const int numDTCsPerRegion_;      // number of DTC boards used to readout a detector region, likely constructed to be an integerer multiple of NumSlots_
    const int numOverlappingRegions_; // number of regions a reconstructable particles may cross
    const int numDTCsPerTFP_;         // numDTCsPerRegion_*numOverlappingRegions_
};

TTStubsFromDTCStubProducer::TTStubsFromDTCStubProducer(const edm::ParameterSet& iConfig) : 

    // constants 
    numRegions_            (iConfig.getParameter<int>("NumRegions")),
    numDTCsPerRegion_      (iConfig.getParameter<int>("NumDTCsPerRegion")),
    numOverlappingRegions_ (iConfig.getParameter<int>("NumOverlappingRegions")),
    numDTCsPerTFP_         (numDTCsPerRegion_*numOverlappingRegions_)
{
    // book in- and output ED products
 
    // Get input/output params
    const auto& TTDTCStubsAcceptedTag     = iConfig.getParameter<edm::InputTag>("TTDTCStubsAcceptedTag");
    const auto& TTDTCStubsRejectedTag     = iConfig.getParameter<edm::InputTag>("TTDTCStubsRejectedTag");
    const auto& branchStubAccepted        = iConfig.getParameter<std::string>("BranchStubAccepted");
    const auto& branchStubRejected        = iConfig.getParameter<std::string>("BranchStubRejected");

    // Get tokens

    edGetTTDTCTokenAccepted_       = consumes<TTDTC>(TTDTCStubsAcceptedTag);
    edGetTTDTCTokenRejected_       = consumes<TTDTC>(TTDTCStubsRejectedTag);
    edPutTTStubTokenAccepted_      = produces<TTStubDetSetVec>(branchStubAccepted);
    edPutTTStubTokenRejected_      = produces<TTStubDetSetVec>(branchStubRejected);
}

TTStubsFromDTCStubProducer::~TTStubsFromDTCStubProducer(){}

void TTStubsFromDTCStubProducer::produce(edm::Event& iEvent, const edm::EventSetup& iSetup) {

    TTStubDetSetVec acceptedStubDetSetVec;
    TTStubDetSetVec rejectedStubDetSetVec;

    // Read in DTC products
    edm::Handle<TTDTC> handleTTDTCAccepted;
    iEvent.getByToken<TTDTC>(edGetTTDTCTokenAccepted_, handleTTDTCAccepted);
    edm::Handle<TTDTC> handleTTDTCRejected;
    iEvent.getByToken<TTDTC>(edGetTTDTCTokenRejected_, handleTTDTCRejected);

    // Create a map that contains all the TTStubs from the same DetId so input format is acceptable to fastfiller
    std::map< DetId, std::vector< TTStub<Ref_Phase2TrackerDigi_> >* > TTStubMapAcc;
    std::map< DetId, std::vector< TTStub<Ref_Phase2TrackerDigi_> >* > TTStubMapRej;
    TTStubMapAcc.clear();
    TTStubMapRej.clear();

    // Read in DTC stubs and create TTStub and TTCluster collections
    this->convertDTCstubs(handleTTDTCAccepted, TTStubMapAcc);
    this->convertDTCstubs(handleTTDTCRejected, TTStubMapRej);

    // Fill DetSetVec to be stored in event record using map contents
    if (not TTStubMapAcc.empty()) this->fill(acceptedStubDetSetVec, TTStubMapAcc);
    if (not TTStubMapRej.empty()) this->fill(rejectedStubDetSetVec, TTStubMapRej);

    // store ED products

    iEvent.emplace(edPutTTStubTokenAccepted_, std::move(acceptedStubDetSetVec) );
    iEvent.emplace(edPutTTStubTokenRejected_, std::move(rejectedStubDetSetVec) );
}

// ------------ method called to extract TTDTC Stubs and organise them into vectors sorted by DetId ------------
void TTStubsFromDTCStubProducer::convertDTCstubs(edm::Handle<TTDTC>& ttdtcHandle, std::map< DetId, std::vector< TTStub<Ref_Phase2TrackerDigi_> >* >& outputTTStubMap) const {

    for (int region = 0; region < numRegions_; region++) {
        for (int channel = 0; channel < numDTCsPerTFP_; channel++) {

            const TTDTC::Stream& stream = ttdtcHandle.product()->stream(region, channel);
            for (const TTDTC::Frame& frame : stream) {
                if (frame.first.isNull()) continue;
                const TTStubRef stubPtr = frame.first;

                // Setup temp TTStub
                const DetId detId = stubPtr->getDetId();
                TTStub<Ref_Phase2TrackerDigi_>     tempTTStub ( detId );

                const TTClusterRef& lowerCluster = stubPtr->clusterRef(0);
                const TTClusterRef& upperCluster = stubPtr->clusterRef(1);
                tempTTStub.addClusterRef( lowerCluster );
                tempTTStub.addClusterRef( upperCluster );

                tempTTStub.setRawBend      ( 2. * stubPtr->rawBend() );
                tempTTStub.setBendOffset   ( 2. * stubPtr->bendOffset() );
                tempTTStub.setBendBE       ( stubPtr->bendBE() );
                tempTTStub.setModuleTypePS ( stubPtr->moduleTypePS() );

                // Setup temp TTCluster
                TTCluster<Ref_Phase2TrackerDigi_>  tempTTClusterLower {*(tempTTStub.clusterRef(0))};
                TTCluster<Ref_Phase2TrackerDigi_>  tempTTClusterUpper {*(tempTTStub.clusterRef(1))};

                // Add TTStub to map
                std::vector< TTStub<Ref_Phase2TrackerDigi_> >* tempStubVecPtr = nullptr;
                std::map< DetId, std::vector< TTStub<Ref_Phase2TrackerDigi_> >* >::const_iterator stubMapIter;

                // Check if DetId is listed in map or not
                if ( (stubMapIter = outputTTStubMap.find(detId)) != outputTTStubMap.end() ) { //DetId IS in 
                    tempStubVecPtr = stubMapIter->second;
                }
                else // DetId IS NOT in map
                     outputTTStubMap.insert(std::pair<DetId, std::vector< TTStub<Ref_Phase2TrackerDigi_> >*>( detId, tempStubVecPtr = new std::vector< TTStub<Ref_Phase2TrackerDigi_> > ));

                // Append TTStub to list of TTStubs for this DetId
                tempStubVecPtr->push_back(tempTTStub);
            }

        } // end channel loop
    } // end region loop

}

// ------------ method called once each job just before starting event loop  ------------
void TTStubsFromDTCStubProducer::beginJob(const edm::EventSetup&)
{
}

// ------------ method called once each job just after ending the event loop  ------------
void TTStubsFromDTCStubProducer::endJob() {
}

DEFINE_FWK_MODULE(TTStubsFromDTCStubProducer);
