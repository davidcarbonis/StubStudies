//An example macro for manipulating plots
#include "TFile.h"

#include "TCanvas.h"
#include "TROOT.h"
#include "TH1F.h"
#include "TLegend.h"
#include "TLegendEntry.h"
#include "TStyle.h"
#include "TLatex.h"

#include "TString.h"
#include "TPRegexp.h"

void plotMacroComparisons(TString inputFile1, TString inputFile2, bool pT_eff = true)
{
  TString variable {};
  if ( pT_eff ) variable = "pt";
  else variable = "eta";

  TString outputPath = inputFile1;
  TPRegexp(".root").Substitute(outputPath, "","g");

   // Grab files
   TFile*  inFile1 = new TFile ( inputFile1 );
   TFile*  inFile2 = new TFile ( inputFile2 );

    // Load in histos from file 1
    TH1F* h_layer1_Stub1    = (TH1F*)inFile1->Get( "Barrel_"+variable+"_1_Stub" );
    TH1F* h_layer1_Cluster1 = (TH1F*)inFile1->Get( "Barrel_"+variable+"_1_Cluster" );
    TH1F* h_layer2_Stub1    = (TH1F*)inFile1->Get( "Barrel_"+variable+"_2_Stub" );
    TH1F* h_layer2_Cluster1 = (TH1F*)inFile1->Get( "Barrel_"+variable+"_2_Cluster" );
    TH1F* h_layer3_Stub1    = (TH1F*)inFile1->Get( "Barrel_"+variable+"_3_Stub" );
    TH1F* h_layer3_Cluster1 = (TH1F*)inFile1->Get( "Barrel_"+variable+"_3_Cluster" );
    TH1F* h_layer4_Stub1    = (TH1F*)inFile1->Get( "Barrel_"+variable+"_4_Stub" );
    TH1F* h_layer4_Cluster1 = (TH1F*)inFile1->Get( "Barrel_"+variable+"_4_Cluster" );
    TH1F* h_layer5_Stub1    = (TH1F*)inFile1->Get( "Barrel_"+variable+"_5_Stub" );
    TH1F* h_layer5_Cluster1 = (TH1F*)inFile1->Get( "Barrel_"+variable+"_5_Cluster" );
    TH1F* h_layer6_Stub1    = (TH1F*)inFile1->Get( "Barrel_"+variable+"_6_Stub" );
    TH1F* h_layer6_Cluster1 = (TH1F*)inFile1->Get( "Barrel_"+variable+"_6_Cluster" );

    TH1F* h_disk1_Stub1     = (TH1F*)inFile1->Get( "Endcap_"+variable+"_1_Stub" );
    TH1F* h_disk1_Cluster1  = (TH1F*)inFile1->Get( "Endcap_"+variable+"_1_Cluster" );
    TH1F* h_disk2_Stub1     = (TH1F*)inFile1->Get( "Endcap_"+variable+"_2_Stub" );
    TH1F* h_disk2_Cluster1  = (TH1F*)inFile1->Get( "Endcap_"+variable+"_2_Cluster" );
    TH1F* h_disk3_Stub1     = (TH1F*)inFile1->Get( "Endcap_"+variable+"_3_Stub" );
    TH1F* h_disk3_Cluster1  = (TH1F*)inFile1->Get( "Endcap_"+variable+"_3_Cluster" );
    TH1F* h_disk4_Stub1     = (TH1F*)inFile1->Get( "Endcap_"+variable+"_4_Stub" );
    TH1F* h_disk4_Cluster1  = (TH1F*)inFile1->Get( "Endcap_"+variable+"_4_Cluster" );
    TH1F* h_disk5_Stub1     = (TH1F*)inFile1->Get( "Endcap_"+variable+"_5_Stub" );
    TH1F* h_disk5_Cluster1  = (TH1F*)inFile1->Get( "Endcap_"+variable+"_5_Cluster" );

    // Load in histos from file 2
    TH1F* h_layer1_Stub2    = (TH1F*)inFile2->Get( "Barrel_"+variable+"_1_Stub" );
    TH1F* h_layer1_Cluster2 = (TH1F*)inFile2->Get( "Barrel_"+variable+"_1_Cluster" );
    TH1F* h_layer2_Stub2    = (TH1F*)inFile2->Get( "Barrel_"+variable+"_2_Stub" );
    TH1F* h_layer2_Cluster2 = (TH1F*)inFile2->Get( "Barrel_"+variable+"_2_Cluster" );
    TH1F* h_layer3_Stub2    = (TH1F*)inFile2->Get( "Barrel_"+variable+"_3_Stub" );
    TH1F* h_layer3_Cluster2 = (TH1F*)inFile2->Get( "Barrel_"+variable+"_3_Cluster" );
    TH1F* h_layer4_Stub2    = (TH1F*)inFile2->Get( "Barrel_"+variable+"_4_Stub" );
    TH1F* h_layer4_Cluster2 = (TH1F*)inFile2->Get( "Barrel_"+variable+"_4_Cluster" );
    TH1F* h_layer5_Stub2    = (TH1F*)inFile2->Get( "Barrel_"+variable+"_5_Stub" );
    TH1F* h_layer5_Cluster2 = (TH1F*)inFile2->Get( "Barrel_"+variable+"_5_Cluster" );
    TH1F* h_layer6_Stub2    = (TH1F*)inFile2->Get( "Barrel_"+variable+"_6_Stub" );
    TH1F* h_layer6_Cluster2 = (TH1F*)inFile2->Get( "Barrel_"+variable+"_6_Cluster" );

    TH1F* h_disk1_Stub2     = (TH1F*)inFile2->Get( "Endcap_"+variable+"_1_Stub" );
    TH1F* h_disk1_Cluster2  = (TH1F*)inFile2->Get( "Endcap_"+variable+"_1_Cluster" );
    TH1F* h_disk2_Stub2     = (TH1F*)inFile2->Get( "Endcap_"+variable+"_2_Stub" );
    TH1F* h_disk2_Cluster2  = (TH1F*)inFile2->Get( "Endcap_"+variable+"_2_Cluster" );
    TH1F* h_disk3_Stub2     = (TH1F*)inFile2->Get( "Endcap_"+variable+"_3_Stub" );
    TH1F* h_disk3_Cluster2  = (TH1F*)inFile2->Get( "Endcap_"+variable+"_3_Cluster" );
    TH1F* h_disk4_Stub2     = (TH1F*)inFile2->Get( "Endcap_"+variable+"_4_Stub" );
    TH1F* h_disk4_Cluster2  = (TH1F*)inFile2->Get( "Endcap_"+variable+"_4_Cluster" );
    TH1F* h_disk5_Stub2     = (TH1F*)inFile2->Get( "Endcap_"+variable+"_5_Stub" );
    TH1F* h_disk5_Cluster2  = (TH1F*)inFile2->Get( "Endcap_"+variable+"_5_Cluster" );

   // Setup canvas

   TCanvas *Canvas_barrel = new TCanvas("Canvas_barrel", "Canvas_barrel",0,0,1280,925);
   gStyle->SetOptStat(0);
   Canvas_barrel->Range(-0.4860759,-0.2025316,2.551899,1.063291);
   Canvas_barrel->SetFillColor(0);
   Canvas_barrel->SetBorderMode(0);
   Canvas_barrel->SetBorderSize(2);
   Canvas_barrel->SetLeftMargin(0.15);
   Canvas_barrel->SetRightMargin(0.05);
   Canvas_barrel->SetTopMargin(0.05);
   Canvas_barrel->SetBottomMargin(0.15);
   Canvas_barrel->SetGridy();
   Canvas_barrel->SetTickx(1);
   Canvas_barrel->SetTicky(1);
   Canvas_barrel->SetFrameBorderMode(0);
   Canvas_barrel->cd();

// Draw barrel histos

   TH1F* h_layer_1_eff1  = (TH1F*)h_layer1_Stub1->Clone();
   h_layer_1_eff1->Divide(h_layer_1_eff1, dynamic_cast<TH1F*>(h_layer1_Cluster1), 1, 1);
   TH1F* h_layer_1_eff2 = (TH1F*)h_layer1_Stub2->Clone();
   h_layer_1_eff2->Divide(h_layer_1_eff2, dynamic_cast<TH1F*>(h_layer1_Cluster2), 1, 1);
   h_layer_1_eff1->Add(h_layer_1_eff2, -1);

   h_layer_1_eff1->SetTitle("");
   if ( pT_eff ) h_layer_1_eff1->GetXaxis()->SetTitle("Generated p_{T} [GeV]");
   else h_layer_1_eff1->GetXaxis()->SetTitle("Generated #eta"); 
   h_layer_1_eff1->GetXaxis()->SetLabelFont(42);
   h_layer_1_eff1->GetXaxis()->SetLabelSize(0.05);
   h_layer_1_eff1->GetXaxis()->SetTitleSize(0.05);
   h_layer_1_eff1->GetXaxis()->SetTitleOffset(1.3);
   h_layer_1_eff1->GetXaxis()->SetTitleFont(42);
   h_layer_1_eff1->GetYaxis()->SetRangeUser(-0.1, 0.1);
   h_layer_1_eff1->GetYaxis()->SetTitle("#Delta efficiency (stub finding)");
   h_layer_1_eff1->GetYaxis()->SetLabelFont(42);
   h_layer_1_eff1->GetYaxis()->SetLabelSize(0.035);
   h_layer_1_eff1->GetYaxis()->SetTitleSize(0.035);
   h_layer_1_eff1->GetYaxis()->SetTitleOffset(0);
   h_layer_1_eff1->GetYaxis()->SetTitleFont(42);
   h_layer_1_eff1->SetLineColor(2);
   h_layer_1_eff1->SetMarkerColor(2);
   h_layer_1_eff1->SetMarkerStyle(25);
   h_layer_1_eff1->SetMarkerSize(1);
   h_layer_1_eff1->Draw("HIST p");


   TH1F* h_layer_2_eff1  = (TH1F*)h_layer2_Stub1->Clone();
   h_layer_2_eff1->Divide(h_layer_2_eff1, dynamic_cast<TH1F*>(h_layer2_Cluster1), 1, 1);
   TH1F* h_layer_2_eff2 = (TH1F*)h_layer2_Stub2->Clone();
   h_layer_2_eff2->Divide(h_layer_2_eff2, dynamic_cast<TH1F*>(h_layer2_Cluster2), 1, 1);
   h_layer_2_eff1->Add(h_layer_2_eff2, -1);

   h_layer_2_eff1->SetTitle("");
   if ( pT_eff ) h_layer_2_eff1->GetXaxis()->SetTitle("Generated p_{T} [GeV]");
   else	h_layer_2_eff1->GetXaxis()->SetTitle("Generated #eta");
   h_layer_2_eff1->GetXaxis()->SetLabelFont(42);
   h_layer_2_eff1->GetXaxis()->SetLabelSize(0.05);
   h_layer_2_eff1->GetXaxis()->SetTitleSize(0.05);
   h_layer_2_eff1->GetXaxis()->SetTitleOffset(1.3);
   h_layer_2_eff1->GetXaxis()->SetTitleFont(42);
   h_layer_2_eff1->GetYaxis()->SetRangeUser(-0.1, 0.1);
   h_layer_2_eff1->GetYaxis()->SetTitle("#Delta efficiency (stub finding)");
   h_layer_2_eff1->GetYaxis()->SetLabelFont(42);
   h_layer_2_eff1->GetYaxis()->SetLabelSize(0.035);
   h_layer_2_eff1->GetYaxis()->SetTitleSize(0.035);
   h_layer_2_eff1->GetYaxis()->SetTitleOffset(0);
   h_layer_2_eff1->GetYaxis()->SetTitleFont(42);
   h_layer_2_eff1->SetLineColor(3);
   h_layer_2_eff1->SetMarkerColor(3);
   h_layer_2_eff1->SetMarkerStyle(20);
   h_layer_2_eff1->SetMarkerSize(1);
   h_layer_2_eff1->Draw("HIST p same");

   TH1F* h_layer_3_eff1  = (TH1F*)h_layer3_Stub1->Clone();
   h_layer_3_eff1->Divide(h_layer_3_eff1, dynamic_cast<TH1F*>(h_layer3_Cluster1), 1, 1);
   TH1F* h_layer_3_eff2 = (TH1F*)h_layer3_Stub2->Clone();
   h_layer_3_eff2->Divide(h_layer_3_eff2, dynamic_cast<TH1F*>(h_layer3_Cluster2), 1, 1);
   h_layer_3_eff1->Add(h_layer_3_eff2, -1);

   h_layer_3_eff1->SetTitle("");
   if ( pT_eff ) h_layer_3_eff1->GetXaxis()->SetTitle("Generated p_{T} [GeV]");
   else	h_layer_3_eff1->GetXaxis()->SetTitle("Generated #eta");
   h_layer_3_eff1->GetXaxis()->SetLabelFont(42);
   h_layer_3_eff1->GetXaxis()->SetLabelSize(0.05);
   h_layer_3_eff1->GetXaxis()->SetTitleSize(0.05);
   h_layer_3_eff1->GetXaxis()->SetTitleOffset(1.3);
   h_layer_3_eff1->GetXaxis()->SetTitleFont(42);
   h_layer_3_eff1->GetYaxis()->SetRangeUser(-0.1, 0.1);
   h_layer_3_eff1->GetYaxis()->SetTitle("#Delta efficiency (stub finding)");
   h_layer_3_eff1->GetYaxis()->SetLabelFont(42);
   h_layer_3_eff1->GetYaxis()->SetLabelSize(0.035);
   h_layer_3_eff1->GetYaxis()->SetTitleSize(0.035);
   h_layer_3_eff1->GetYaxis()->SetTitleOffset(0);
   h_layer_3_eff1->GetYaxis()->SetTitleFont(42);
   h_layer_3_eff1->SetLineColor(4);
   h_layer_3_eff1->SetMarkerColor(4);
   h_layer_3_eff1->SetMarkerStyle(21);
   h_layer_3_eff1->SetMarkerSize(1);
   h_layer_3_eff1->Draw("HIST p same");

   TH1F* h_layer_4_eff1  = (TH1F*)h_layer4_Stub1->Clone();
   h_layer_4_eff1->Divide(h_layer_4_eff1, dynamic_cast<TH1F*>(h_layer4_Cluster1), 1, 1);
   TH1F* h_layer_4_eff2 = (TH1F*)h_layer4_Stub2->Clone();
   h_layer_4_eff2->Divide(h_layer_4_eff2, dynamic_cast<TH1F*>(h_layer4_Cluster2), 1, 1);
   h_layer_4_eff1->Add(h_layer_4_eff2, -1);

   h_layer_4_eff1->SetTitle("");
   if ( pT_eff ) h_layer_4_eff1->GetXaxis()->SetTitle("Generated p_{T} [GeV]");
   else	h_layer_4_eff1->GetXaxis()->SetTitle("Generated #eta");
   h_layer_4_eff1->GetXaxis()->SetLabelFont(42);
   h_layer_4_eff1->GetXaxis()->SetLabelSize(0.05);
   h_layer_4_eff1->GetXaxis()->SetTitleSize(0.05);
   h_layer_4_eff1->GetXaxis()->SetTitleOffset(1.3);
   h_layer_4_eff1->GetXaxis()->SetTitleFont(42);
   h_layer_4_eff1->GetYaxis()->SetRangeUser(-0.1, 0.1);
   h_layer_4_eff1->GetYaxis()->SetTitle("#Delta efficiency (stub finding)");
   h_layer_4_eff1->GetYaxis()->SetLabelFont(42);
   h_layer_4_eff1->GetYaxis()->SetLabelSize(0.035);
   h_layer_4_eff1->GetYaxis()->SetTitleSize(0.035);
   h_layer_4_eff1->GetYaxis()->SetTitleOffset(0);
   h_layer_4_eff1->GetYaxis()->SetTitleFont(42);
   h_layer_4_eff1->SetLineColor(1);
   h_layer_4_eff1->SetMarkerColor(1);
   h_layer_4_eff1->SetMarkerStyle(22);
   h_layer_4_eff1->SetMarkerSize(1);
   h_layer_4_eff1->Draw("HIST p same");

   TH1F* h_layer_5_eff1  = (TH1F*)h_layer5_Stub1->Clone();
   h_layer_5_eff1->Divide(h_layer_5_eff1, dynamic_cast<TH1F*>(h_layer5_Cluster1), 1, 1);
   TH1F* h_layer_5_eff2 = (TH1F*)h_layer5_Stub2->Clone();
   h_layer_5_eff2->Divide(h_layer_5_eff2, dynamic_cast<TH1F*>(h_layer5_Cluster2), 1, 1);
   h_layer_5_eff1->Add(h_layer_5_eff2, -1);

   h_layer_5_eff1->SetTitle("");
   if ( pT_eff ) h_layer_5_eff1->GetXaxis()->SetTitle("Generated p_{T} [GeV]");
   else	h_layer_5_eff1->GetXaxis()->SetTitle("Generated #eta");
   h_layer_5_eff1->GetXaxis()->SetLabelFont(42);
   h_layer_5_eff1->GetXaxis()->SetLabelSize(0.05);
   h_layer_5_eff1->GetXaxis()->SetTitleSize(0.05);
   h_layer_5_eff1->GetXaxis()->SetTitleOffset(1.3);
   h_layer_5_eff1->GetXaxis()->SetTitleFont(42);
   h_layer_5_eff1->GetYaxis()->SetRangeUser(-0.1, 0.1);
   h_layer_5_eff1->GetYaxis()->SetTitle("#Delta efficiency (stub finding)");
   h_layer_5_eff1->GetYaxis()->SetLabelFont(42);
   h_layer_5_eff1->GetYaxis()->SetLabelSize(0.035);
   h_layer_5_eff1->GetYaxis()->SetTitleSize(0.035);
   h_layer_5_eff1->GetYaxis()->SetTitleOffset(0);
   h_layer_5_eff1->GetYaxis()->SetTitleFont(42);
   h_layer_5_eff1->SetLineColor(6);
   h_layer_5_eff1->SetMarkerColor(6);
   h_layer_5_eff1->SetMarkerStyle(23);
   h_layer_5_eff1->SetMarkerSize(1);
   h_layer_5_eff1->Draw("HIST p same");

   TH1F* h_layer_6_eff1  = (TH1F*)h_layer6_Stub1->Clone();
   h_layer_6_eff1->Divide(h_layer_6_eff1, dynamic_cast<TH1F*>(h_layer6_Cluster1), 1, 1);
   TH1F* h_layer_6_eff2 = (TH1F*)h_layer6_Stub2->Clone();
   h_layer_6_eff2->Divide(h_layer_6_eff2, dynamic_cast<TH1F*>(h_layer6_Cluster2), 1, 1);
   h_layer_6_eff1->Add(h_layer_6_eff2, -1);

   h_layer_6_eff1->SetTitle("");
   if ( pT_eff ) h_layer_6_eff1->GetXaxis()->SetTitle("Generated p_{T} [GeV]");
   else	h_layer_6_eff1->GetXaxis()->SetTitle("Generated #eta");
   h_layer_6_eff1->GetXaxis()->SetLabelFont(42);
   h_layer_6_eff1->GetXaxis()->SetLabelSize(0.05);
   h_layer_6_eff1->GetXaxis()->SetTitleSize(0.05);
   h_layer_6_eff1->GetXaxis()->SetTitleOffset(1.3);
   h_layer_6_eff1->GetXaxis()->SetTitleFont(42);
   h_layer_6_eff1->GetYaxis()->SetRangeUser(-0.1, 0.1);
   h_layer_6_eff1->GetYaxis()->SetTitle("#Delta efficiency (stub finding)");
   h_layer_6_eff1->GetYaxis()->SetLabelFont(42);
   h_layer_6_eff1->GetYaxis()->SetLabelSize(0.035);
   h_layer_6_eff1->GetYaxis()->SetTitleSize(0.035);
   h_layer_6_eff1->GetYaxis()->SetTitleOffset(0);
   h_layer_6_eff1->GetYaxis()->SetTitleFont(42);
   h_layer_6_eff1->SetLineColor(8);
   h_layer_6_eff1->SetMarkerColor(8);
   h_layer_6_eff1->SetMarkerStyle(24);
   h_layer_6_eff1->SetMarkerSize(1);
   h_layer_6_eff1->Draw("HIST p same");

/// Draw Legend
   TLegend *leg_barrel = new TLegend(0.80,0.25,0.87,0.45,NULL,"brNDC");
   leg_barrel->SetBorderSize(0);
   leg_barrel->SetTextSize(0.02);
   leg_barrel->SetLineColor(1);
   leg_barrel->SetLineStyle(1);
   leg_barrel->SetLineWidth(1);
   leg_barrel->SetFillColor(0);
   leg_barrel->SetFillStyle(1001);
   TLegendEntry *entry_barrel = leg_barrel->AddEntry("Barrel_1_Stub", "Layer 1","P");
   entry_barrel->SetMarkerColor(2);
   entry_barrel->SetMarkerStyle(25);
   entry_barrel->SetMarkerSize(2);
   entry_barrel->SetTextFont(42);
   entry_barrel=leg_barrel->AddEntry("Barrel_2_Stub", "Layer 2","P");
   entry_barrel->SetMarkerColor(3);
   entry_barrel->SetMarkerStyle(20);
   entry_barrel->SetMarkerSize(2);
   entry_barrel->SetTextFont(42);
   entry_barrel=leg_barrel->AddEntry("Barrel_3_Stub", "Layer 3","P");
   entry_barrel->SetMarkerColor(4);
   entry_barrel->SetMarkerStyle(21);
   entry_barrel->SetMarkerSize(2);
   entry_barrel->SetTextFont(42);
   entry_barrel=leg_barrel->AddEntry("Barrel_4_Stub", "Layer 4","P");
   entry_barrel->SetMarkerColor(1);
   entry_barrel->SetMarkerStyle(22);
   entry_barrel->SetMarkerSize(2);
   entry_barrel->SetTextFont(42);
   entry_barrel=leg_barrel->AddEntry("Barrel_5_Stub", "Layer 5","P");
   entry_barrel->SetMarkerColor(6);
   entry_barrel->SetMarkerStyle(23);
   entry_barrel->SetMarkerSize(2);
   entry_barrel->SetTextFont(42);
   entry_barrel=leg_barrel->AddEntry("Barrel_6_Stub", "Layer 6","P");
   entry_barrel->SetMarkerColor(8);
   entry_barrel->SetMarkerStyle(24);
   entry_barrel->SetMarkerSize(2);
   entry_barrel->SetTextFont(42);
   leg_barrel->Draw("HIST");

   Canvas_barrel->Modified();
   Canvas_barrel->cd();
   Canvas_barrel->SetSelected(Canvas_barrel);
   Canvas_barrel->SaveAs( outputPath+"_layer_"+variable+"_eff_comparison.pdf" );

   TCanvas *Canvas_endcap = new TCanvas("Canvas_endcap", "Canvas_endcap",0,0,1280,925);
   gStyle->SetOptStat(0);
   Canvas_endcap->Range(-0.4860759,-0.2025316,2.551899,1.063291);
   Canvas_endcap->SetFillColor(0);
   Canvas_endcap->SetBorderMode(0);
   Canvas_endcap->SetBorderSize(2);
   Canvas_endcap->SetLeftMargin(0.15);
   Canvas_endcap->SetRightMargin(0.05);
   Canvas_endcap->SetTopMargin(0.05);
   Canvas_endcap->SetBottomMargin(0.15);
   Canvas_endcap->SetGridy();
   Canvas_endcap->SetTickx(1);
   Canvas_endcap->SetTicky(1);
   Canvas_endcap->SetFrameBorderMode(0);

// Draw endcap histos

   TH1F* h_disk_1_eff1  = (TH1F*)h_disk1_Stub1->Clone();
   h_disk_1_eff1->Divide(h_disk_1_eff1, dynamic_cast<TH1F*>(h_disk1_Cluster1), 1, 1);
   TH1F* h_disk_1_eff2 = (TH1F*)h_disk1_Stub2->Clone();
   h_disk_1_eff2->Divide(h_disk_1_eff2, dynamic_cast<TH1F*>(h_disk1_Cluster2), 1, 1);
   h_disk_1_eff1->Add(h_disk_1_eff2, -1);

   h_disk_1_eff1->SetTitle("");
   if ( pT_eff ) h_disk_1_eff1->GetXaxis()->SetTitle("Generated p_{T} [GeV]");
   else h_disk_1_eff1->GetXaxis()->SetTitle("Generated #eta"); 
   h_disk_1_eff1->GetXaxis()->SetLabelFont(42);
   h_disk_1_eff1->GetXaxis()->SetLabelSize(0.05);
   h_disk_1_eff1->GetXaxis()->SetTitleSize(0.05);
   h_disk_1_eff1->GetXaxis()->SetTitleOffset(1.3);
   h_disk_1_eff1->GetXaxis()->SetTitleFont(42);
   h_disk_1_eff1->GetYaxis()->SetRangeUser(-0.1, 0.1);
   h_disk_1_eff1->GetYaxis()->SetTitle("#Delta efficiency (stub finding)");
   h_disk_1_eff1->GetYaxis()->SetLabelFont(42);
   h_disk_1_eff1->GetYaxis()->SetLabelSize(0.035);
   h_disk_1_eff1->GetYaxis()->SetTitleSize(0.035);
   h_disk_1_eff1->GetYaxis()->SetTitleOffset(0);
   h_disk_1_eff1->GetYaxis()->SetTitleFont(42);
   h_disk_1_eff1->SetLineColor(2);
   h_disk_1_eff1->SetMarkerColor(2);
   h_disk_1_eff1->SetMarkerStyle(25);
   h_disk_1_eff1->SetMarkerSize(1);
   h_disk_1_eff1->Draw("HIST p");

   TH1F* h_disk_2_eff1  = (TH1F*)h_disk2_Stub1->Clone();
   h_disk_2_eff1->Divide(h_disk_2_eff1, dynamic_cast<TH1F*>(h_disk2_Cluster1), 1, 1);
   TH1F* h_disk_2_eff2 = (TH1F*)h_disk2_Stub2->Clone();
   h_disk_2_eff2->Divide(h_disk_2_eff2, dynamic_cast<TH1F*>(h_disk2_Cluster2), 1, 1);
   h_disk_2_eff1->Add(h_disk_2_eff2, -1);

   h_disk_2_eff1->SetTitle("");
   if ( pT_eff ) h_disk_2_eff1->GetXaxis()->SetTitle("Generated p_{T} [GeV]");
   else	h_disk_2_eff1->GetXaxis()->SetTitle("Generated #eta");
   h_disk_2_eff1->GetXaxis()->SetLabelFont(42);
   h_disk_2_eff1->GetXaxis()->SetLabelSize(0.05);
   h_disk_2_eff1->GetXaxis()->SetTitleSize(0.05);
   h_disk_2_eff1->GetXaxis()->SetTitleOffset(1.3);
   h_disk_2_eff1->GetXaxis()->SetTitleFont(42);
   h_disk_2_eff1->GetYaxis()->SetRangeUser(-0.1, 0.1);
   h_disk_2_eff1->GetYaxis()->SetTitle("#Delta efficiency (stub finding)");
   h_disk_2_eff1->GetYaxis()->SetLabelFont(42);
   h_disk_2_eff1->GetYaxis()->SetLabelSize(0.035);
   h_disk_2_eff1->GetYaxis()->SetTitleSize(0.035);
   h_disk_2_eff1->GetYaxis()->SetTitleOffset(0);
   h_disk_2_eff1->GetYaxis()->SetTitleFont(42);
   h_disk_2_eff1->SetLineColor(3);
   h_disk_2_eff1->SetMarkerColor(3);
   h_disk_2_eff1->SetMarkerStyle(20);
   h_disk_2_eff1->SetMarkerSize(1);
   h_disk_2_eff1->Draw("HIST p same");

   TH1F* h_disk_3_eff1  = (TH1F*)h_disk3_Stub1->Clone();
   h_disk_3_eff1->Divide(h_disk_3_eff1, dynamic_cast<TH1F*>(h_disk3_Cluster1), 1, 1);
   TH1F* h_disk_3_eff2 = (TH1F*)h_disk3_Stub2->Clone();
   h_disk_3_eff2->Divide(h_disk_3_eff2, dynamic_cast<TH1F*>(h_disk3_Cluster2), 1, 1);
   h_disk_3_eff1->Add(h_disk_3_eff2, -1);

   h_disk_3_eff1->SetTitle("");
   if ( pT_eff ) h_disk_3_eff1->GetXaxis()->SetTitle("Generated p_{T} [GeV]");
   else	h_disk_3_eff1->GetXaxis()->SetTitle("Generated #eta");
   h_disk_3_eff1->GetXaxis()->SetLabelFont(42);
   h_disk_3_eff1->GetXaxis()->SetLabelSize(0.05);
   h_disk_3_eff1->GetXaxis()->SetTitleSize(0.05);
   h_disk_3_eff1->GetXaxis()->SetTitleOffset(1.3);
   h_disk_3_eff1->GetXaxis()->SetTitleFont(42);
   h_disk_3_eff1->GetYaxis()->SetRangeUser(-0.1, 0.1);
   h_disk_3_eff1->GetYaxis()->SetTitle("#Delta efficiency (stub finding)");
   h_disk_3_eff1->GetYaxis()->SetLabelFont(42);
   h_disk_3_eff1->GetYaxis()->SetLabelSize(0.035);
   h_disk_3_eff1->GetYaxis()->SetTitleSize(0.035);
   h_disk_3_eff1->GetYaxis()->SetTitleOffset(0);
   h_disk_3_eff1->GetYaxis()->SetTitleFont(42);
   h_disk_3_eff1->SetLineColor(4);
   h_disk_3_eff1->SetMarkerColor(4);
   h_disk_3_eff1->SetMarkerStyle(21);
   h_disk_3_eff1->SetMarkerSize(1);
   h_disk_3_eff1->Draw("HIST p same");

   TH1F* h_disk_4_eff1  = (TH1F*)h_disk4_Stub1->Clone();
   h_disk_4_eff1->Divide(h_disk_4_eff1, dynamic_cast<TH1F*>(h_disk4_Cluster1), 1, 1);
   TH1F* h_disk_4_eff2 = (TH1F*)h_disk4_Stub2->Clone();
   h_disk_4_eff2->Divide(h_disk_4_eff2, dynamic_cast<TH1F*>(h_disk4_Cluster2), 1, 1);
   h_disk_4_eff1->Add(h_disk_4_eff2, -1);

   h_disk_4_eff1->SetTitle("");
   if ( pT_eff ) h_disk_4_eff1->GetXaxis()->SetTitle("Generated p_{T} [GeV]");
   else	h_disk_4_eff1->GetXaxis()->SetTitle("Generated #eta");
   h_disk_4_eff1->GetXaxis()->SetLabelFont(42);
   h_disk_4_eff1->GetXaxis()->SetLabelSize(0.05);
   h_disk_4_eff1->GetXaxis()->SetTitleSize(0.05);
   h_disk_4_eff1->GetXaxis()->SetTitleOffset(1.3);
   h_disk_4_eff1->GetXaxis()->SetTitleFont(42);
   h_disk_4_eff1->GetYaxis()->SetRangeUser(-0.1, 0.1);
   h_disk_4_eff1->GetYaxis()->SetTitle("#Delta efficiency (stub finding)");
   h_disk_4_eff1->GetYaxis()->SetLabelFont(42);
   h_disk_4_eff1->GetYaxis()->SetLabelSize(0.035);
   h_disk_4_eff1->GetYaxis()->SetTitleSize(0.035);
   h_disk_4_eff1->GetYaxis()->SetTitleOffset(0);
   h_disk_4_eff1->GetYaxis()->SetTitleFont(42);
   h_disk_4_eff1->SetLineColor(1);
   h_disk_4_eff1->SetMarkerColor(1);
   h_disk_4_eff1->SetMarkerStyle(22);
   h_disk_4_eff1->SetMarkerSize(1);
   h_disk_4_eff1->Draw("HIST p same");

   TH1F* h_disk_5_eff1  = (TH1F*)h_disk5_Stub1->Clone();
   h_disk_5_eff1->Divide(h_disk_5_eff1, dynamic_cast<TH1F*>(h_disk5_Cluster1), 1, 1);
   TH1F* h_disk_5_eff2 = (TH1F*)h_disk5_Stub2->Clone();
   h_disk_5_eff2->Divide(h_disk_5_eff2, dynamic_cast<TH1F*>(h_disk5_Cluster2), 1, 1);
   h_disk_5_eff1->Add(h_disk_5_eff2, -1);

   h_disk_5_eff1->SetTitle("");
   if ( pT_eff ) h_disk_5_eff1->GetXaxis()->SetTitle("Generated p_{T} [GeV]");
   else	h_disk_5_eff1->GetXaxis()->SetTitle("Generated #eta");
   h_disk_5_eff1->GetXaxis()->SetLabelFont(42);
   h_disk_5_eff1->GetXaxis()->SetLabelSize(0.05);
   h_disk_5_eff1->GetXaxis()->SetTitleSize(0.05);
   h_disk_5_eff1->GetXaxis()->SetTitleOffset(1.3);
   h_disk_5_eff1->GetXaxis()->SetTitleFont(42);
   h_disk_5_eff1->GetYaxis()->SetRangeUser(-0.1, 0.1);
   h_disk_5_eff1->GetYaxis()->SetTitle("#Delta efficiency (stub finding)");
   h_disk_5_eff1->GetYaxis()->SetLabelFont(42);
   h_disk_5_eff1->GetYaxis()->SetLabelSize(0.035);
   h_disk_5_eff1->GetYaxis()->SetTitleSize(0.035);
   h_disk_5_eff1->GetYaxis()->SetTitleOffset(0);
   h_disk_5_eff1->GetYaxis()->SetTitleFont(42);
   h_disk_5_eff1->SetLineColor(6);
   h_disk_5_eff1->SetMarkerColor(6);
   h_disk_5_eff1->SetMarkerStyle(23);
   h_disk_5_eff1->SetMarkerSize(1);
   h_disk_5_eff1->Draw("HIST p same");

/// Draw Legend
   TLegend *leg_endcap = new TLegend(0.80,0.25,0.87,0.45,NULL,"brNDC");
   leg_endcap->SetBorderSize(0);
   leg_endcap->SetTextSize(0.02);
   leg_endcap->SetLineColor(1);
   leg_endcap->SetLineStyle(1);
   leg_endcap->SetLineWidth(1);
   leg_endcap->SetFillColor(0);
   leg_endcap->SetFillStyle(1001);
   TLegendEntry *entry_endcap = leg_endcap->AddEntry("Endcap_1_Stub", "Disk 1","P");
   entry_endcap->SetMarkerColor(2);
   entry_endcap->SetMarkerStyle(25);
   entry_endcap->SetMarkerSize(2);
   entry_endcap->SetTextFont(42);
   entry_endcap=leg_endcap->AddEntry("Endcap_2_Stub", "Disk 2","P");
   entry_endcap->SetMarkerColor(3);
   entry_endcap->SetMarkerStyle(20);
   entry_endcap->SetMarkerSize(2);
   entry_endcap->SetTextFont(42);
   entry_endcap=leg_endcap->AddEntry("Endcap_3_Stub", "Disk 3","P");
   entry_endcap->SetMarkerColor(4);
   entry_endcap->SetMarkerStyle(21);
   entry_endcap->SetMarkerSize(2);
   entry_endcap->SetTextFont(42);
   entry_endcap=leg_endcap->AddEntry("Endcap_4_Stub", "Disk 4","P");
   entry_endcap->SetMarkerColor(1);
   entry_endcap->SetMarkerStyle(22);
   entry_endcap->SetMarkerSize(2);
   entry_endcap->SetTextFont(42);
   entry_endcap=leg_endcap->AddEntry("Endcap_5_Stub", "Disk 5","P");
   entry_endcap->SetMarkerColor(6);
   entry_endcap->SetMarkerStyle(23);
   entry_endcap->SetMarkerSize(2);
   entry_endcap->SetTextFont(42);
   leg_endcap->Draw("HIST");

   Canvas_endcap->Modified();
   Canvas_endcap->cd();
   Canvas_endcap->SetSelected(Canvas_endcap);
   Canvas_endcap->SaveAs( outputPath+"_disk_"+variable+"_eff_comparison.pdf" );

   inFile1->Close();
   inFile2->Close();
   delete Canvas_barrel;
   delete Canvas_endcap;

}
