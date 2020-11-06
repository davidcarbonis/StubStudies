echo TTbar output
StubRateTool -i TTbar_output/outputHybridOldLoose.root -o TTbar_output/StubRateToolOutput/outputHybridOldLoose.root --particle="all"
StubRateTool -i TTbar_output/outputHybridOldTight.root -o TTbar_output/StubRateToolOutput/outputHybridOldTight.root --particle="all"
StubRateTool -i TTbar_output/outputTmttOldLoose.root -o TTbar_output/StubRateToolOutput/outputTmttOldLoose.root --particle="all"
StubRateTool -i TTbar_output/outputTmttOldTight.root -o TTbar_output/StubRateToolOutput/outputTmttOldTight.root --particle="all"
echo TTbar output + dtc emulation
StubRateTool -i TTbar_output/dtc_outputHybridOldLoose.root -o TTbar_output/StubRateToolOutput/dtc_outputHybridOldLoose.root --particle="all"
StubRateTool -i TTbar_output/dtc_outputHybridOldTight.root -o TTbar_output/StubRateToolOutput/dtc_outputHybridOldTight.root --particle="all"
StubRateTool -i TTbar_output/dtc_outputTmttOldLoose.root -o TTbar_output/StubRateToolOutput/dtc_outputTmttOldLoose.root --particle="all"
StubRateTool -i TTbar_output/dtc_outputTmttOldTight.root -o TTbar_output/StubRateToolOutput/dtc_outputTmttOldTight.root --particle="all"
StubRateTool -i TTbar_output/dtc_noTruncation_outputHybridOldLoose.root -o TTbar_output/StubRateToolOutput/dtc_noTruncation_outputHybridOldLoose.root --particle="all"
StubRateTool -i TTbar_output/dtc_noTruncation_outputHybridOldTight.root -o TTbar_output/StubRateToolOutput/dtc_noTruncation_outputHybridOldTight.root --particle="all"
StubRateTool -i TTbar_output/dtc_noTruncation_outputTmttOldLoose.root -o TTbar_output/StubRateToolOutput/dtc_noTruncation_outputTmttOldLoose.root --particle="all"
StubRateTool -i TTbar_output/dtc_noTruncation_outputTmttOldTight.root -o TTbar_output/StubRateToolOutput/dtc_noTruncation_outputTmttOldTight.root --particle="all"
#
echo SingleEl output
StubRateTool -i SingleElPt1p5to8_output/outputHybridOldLoose.root -o SingleElPt1p5to8_output/StubRateToolOutput/outputHybridOldLoose.root --particle="ele"
StubRateTool -i SingleElPt1p5to8_output/outputHybridOldTight.root -o SingleElPt1p5to8_output/StubRateToolOutput/outputHybridOldTight.root --particle="ele"
StubRateTool -i SingleElPt1p5to8_output/outputTmttOldLoose.root -o SingleElPt1p5to8_output/StubRateToolOutput/outputTmttOldLoose.root --particle="ele" 
StubRateTool -i SingleElPt1p5to8_output/outputTmttOldTight.root -o SingleElPt1p5to8_output/StubRateToolOutput/outputTmttOldTight.root --particle="ele"
echo SingleEl output + dtc emulation
StubRateTool -i SingleElPt1p5to8_output/dtc_outputHybridOldLoose.root -o SingleElPt1p5to8_output/StubRateToolOutput/dtc_outputHybridOldLoose.root --particle="ele"
StubRateTool -i SingleElPt1p5to8_output/dtc_outputHybridOldTight.root -o SingleElPt1p5to8_output/StubRateToolOutput/dtc_outputHybridOldTight.root --particle="ele"
StubRateTool -i SingleElPt1p5to8_output/dtc_outputTmttOldLoose.root -o SingleElPt1p5to8_output/StubRateToolOutput/dtc_outputTmttOldLoose.root --particle="ele"
StubRateTool -i SingleElPt1p5to8_output/dtc_outputTmttOldTight.root -o SingleElPt1p5to8_output/StubRateToolOutput/dtc_outputTmttOldTight.root --particle="ele"
StubRateTool -i SingleElPt1p5to8_output/dtc_noTruncation_outputHybridOldLoose.root -o SingleElPt1p5to8_output/StubRateToolOutput/dtc_noTruncation_outputHybridOldLoose.root --particle="ele"
StubRateTool -i SingleElPt1p5to8_output/dtc_noTruncation_outputHybridOldTight.root -o SingleElPt1p5to8_output/StubRateToolOutput/dtc_noTruncation_outputHybridOldTight.root --particle="ele"
StubRateTool -i SingleElPt1p5to8_output/dtc_noTruncation_outputTmttOldLoose.root -o SingleElPt1p5to8_output/StubRateToolOutput/dtc_noTruncation_outputTmttOldLoose.root --particle="ele"
StubRateTool -i SingleElPt1p5to8_output/dtc_noTruncation_outputTmttOldTight.root -o SingleElPt1p5to8_output/StubRateToolOutput/dtc_noTruncation_outputTmttOldTight.root --particle="ele"
#
echo SingleMu output
StubRateTool -i SingleMuPt1p5to8_output/outputHybridOldLoose.root -o SingleMuPt1p5to8_output/StubRateToolOutput/outputHybridOldLoose.root --particle="mu"
StubRateTool -i SingleMuPt1p5to8_output/outputHybridOldTight.root -o SingleMuPt1p5to8_output/StubRateToolOutput/outputHybridOldTight.root --particle="mu"
StubRateTool -i SingleMuPt1p5to8_output/outputTmttOldLoose.root -o SingleMuPt1p5to8_output/StubRateToolOutput/outputTmttOldLoose.root --particle="mu"
StubRateTool -i SingleMuPt1p5to8_output/outputTmttOldTight.root -o SingleMuPt1p5to8_output/StubRateToolOutput/outputTmttOldTight.root --particle="mu"
echo SingleMu output + dtc emulation
StubRateTool -i SingleMuPt1p5to8_output/dtc_outputHybridOldLoose.root -o SingleMuPt1p5to8_output/StubRateToolOutput/dtc_outputHybridOldLoose.root --particle="mu"
StubRateTool -i SingleMuPt1p5to8_output/dtc_outputHybridOldTight.root -o SingleMuPt1p5to8_output/StubRateToolOutput/dtc_outputHybridOldTight.root --particle="mu"
StubRateTool -i SingleMuPt1p5to8_output/dtc_outputTmttOldLoose.root -o SingleMuPt1p5to8_output/StubRateToolOutput/dtc_outputTmttOldLoose.root --particle="mu"
StubRateTool -i SingleMuPt1p5to8_output/dtc_outputTmttOldTight.root -o SingleMuPt1p5to8_output/StubRateToolOutput/dtc_outputTmttOldTight.root --particle="mu"
StubRateTool -i SingleMuPt1p5to8_output/dtc_noTruncation_outputHybridOldLoose.root -o SingleMuPt1p5to8_output/StubRateToolOutput/dtc_noTruncation_outputHybridOldLoose.root --particle="mu"
StubRateTool -i SingleMuPt1p5to8_output/dtc_noTruncation_outputHybridOldTight.root -o SingleMuPt1p5to8_output/StubRateToolOutput/dtc_noTruncation_outputHybridOldTight.root --particle="mu"
StubRateTool -i SingleMuPt1p5to8_output/dtc_noTruncation_outputTmttOldLoose.root -o SingleMuPt1p5to8_output/StubRateToolOutput/dtc_noTruncation_outputTmttOldLoose.root --particle="mu"
StubRateTool -i SingleMuPt1p5to8_output/dtc_noTruncation_outputTmttOldTight.root -o SingleMuPt1p5to8_output/StubRateToolOutput/dtc_noTruncation_outputTmttOldTight.root --particle="mu"
