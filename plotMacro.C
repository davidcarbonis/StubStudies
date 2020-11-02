//An example macro for manipulating plots
#include "TFile.h"

#include "TCanvas.h"
#include "TROOT.h"
#include "TH1F.h"
#include "TLegend.h"
#include "TLegendEntry.h"
#include "TStyle.h"
#include "TLatex.h"

#include <iostream>
#include <sstream>
#include <string>
#include <regex>

void plotMacro(std::string inputFile, bool pT_eff = true)
{

  std::cout << "input File: " << inputFile << std::endl;

  std::string variable {};
  if ( pT_eff ) variable = "pt";
  else variable = "eta";

  std::string outputPath = inputFile;
  std::regex pattern(".root");
  outputPath = std::regex_replace(outputPath, pattern, "");
  std::cout << "outputPath: " << outputPath << std::endl;

   // Grab files
   TFile*  inFile = new TFile ( inputFile.c_str() );

    // Load in histos from files
    TH1F* h_layer1_Stub    = (TH1F*)inFile->Get( ("Barrel_"+variable+"_1_Stub").c_str() );
    TH1F* h_layer1_Cluster = (TH1F*)inFile->Get( ("Barrel_"+variable+"_1_Cluster").c_str() );
    TH1F* h_layer2_Stub    = (TH1F*)inFile->Get( ("Barrel_"+variable+"_2_Stub").c_str() );
    TH1F* h_layer2_Cluster = (TH1F*)inFile->Get( ("Barrel_"+variable+"_2_Cluster").c_str() );
    TH1F* h_layer3_Stub    = (TH1F*)inFile->Get( ("Barrel_"+variable+"_3_Stub").c_str() );
    TH1F* h_layer3_Cluster = (TH1F*)inFile->Get( ("Barrel_"+variable+"_3_Cluster").c_str() );
    TH1F* h_layer4_Stub    = (TH1F*)inFile->Get( ("Barrel_"+variable+"_4_Stub").c_str() );
    TH1F* h_layer4_Cluster = (TH1F*)inFile->Get( ("Barrel_"+variable+"_4_Cluster").c_str() );
    TH1F* h_layer5_Stub    = (TH1F*)inFile->Get( ("Barrel_"+variable+"_5_Stub").c_str() );
    TH1F* h_layer5_Cluster = (TH1F*)inFile->Get( ("Barrel_"+variable+"_5_Cluster").c_str() );
    TH1F* h_layer6_Stub    = (TH1F*)inFile->Get( ("Barrel_"+variable+"_6_Stub").c_str() );
    TH1F* h_layer6_Cluster = (TH1F*)inFile->Get( ("Barrel_"+variable+"_6_Cluster").c_str() );

    TH1F* h_disk1_Stub     = (TH1F*)inFile->Get( ("Endcap_"+variable+"_1_Stub").c_str() );
    TH1F* h_disk1_Cluster  = (TH1F*)inFile->Get( ("Endcap_"+variable+"_1_Cluster").c_str() );
    TH1F* h_disk2_Stub     = (TH1F*)inFile->Get( ("Endcap_"+variable+"_2_Stub").c_str() );
    TH1F* h_disk2_Cluster  = (TH1F*)inFile->Get( ("Endcap_"+variable+"_2_Cluster").c_str() );
    TH1F* h_disk3_Stub     = (TH1F*)inFile->Get( ("Endcap_"+variable+"_3_Stub").c_str() );
    TH1F* h_disk3_Cluster  = (TH1F*)inFile->Get( ("Endcap_"+variable+"_3_Cluster").c_str() );
    TH1F* h_disk4_Stub     = (TH1F*)inFile->Get( ("Endcap_"+variable+"_4_Stub").c_str() );
    TH1F* h_disk4_Cluster  = (TH1F*)inFile->Get( ("Endcap_"+variable+"_4_Cluster").c_str() );
    TH1F* h_disk5_Stub     = (TH1F*)inFile->Get( ("Endcap_"+variable+"_5_Stub").c_str() );
    TH1F* h_disk5_Cluster  = (TH1F*)inFile->Get( ("Endcap_"+variable+"_5_Cluster").c_str() );

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

   TH1F* h_layer_1_eff  = (TH1F*)h_layer1_Stub->Clone();
   h_layer_1_eff->Divide(h_layer_1_eff, dynamic_cast<TH1F*>(h_layer1_Cluster), 1, 1);
   h_layer_1_eff->SetTitle("");
   if ( pT_eff ) h_layer_1_eff->GetXaxis()->SetTitle("p_{T} [GeV]");
   else h_layer_1_eff->GetXaxis()->SetTitle("#eta"); 
   h_layer_1_eff->GetXaxis()->SetLabelFont(42);
   h_layer_1_eff->GetXaxis()->SetLabelSize(0.05);
   h_layer_1_eff->GetXaxis()->SetTitleSize(0.05);
   h_layer_1_eff->GetXaxis()->SetTitleOffset(1.3);
   h_layer_1_eff->GetXaxis()->SetTitleFont(42);
   h_layer_1_eff->GetYaxis()->SetRangeUser(0.0, 1.1);
   h_layer_1_eff->GetYaxis()->SetTitle("Efficiency");
   h_layer_1_eff->GetYaxis()->SetLabelFont(42);
   h_layer_1_eff->GetYaxis()->SetLabelSize(0.035);
   h_layer_1_eff->GetYaxis()->SetTitleSize(0.035);
   h_layer_1_eff->GetYaxis()->SetTitleOffset(0);
   h_layer_1_eff->GetYaxis()->SetTitleFont(42);
   h_layer_1_eff->SetLineColor(2);
   h_layer_1_eff->SetMarkerColor(2);
   h_layer_1_eff->SetMarkerStyle(25);
   h_layer_1_eff->SetMarkerSize(1);
   h_layer_1_eff->Draw("HIST p");

   TH1F* h_layer_2_eff  = (TH1F*)h_layer2_Stub->Clone();
   h_layer_2_eff->Divide(h_layer_2_eff, dynamic_cast<TH1F*>(h_layer2_Cluster), 1, 1);
   h_layer_2_eff->SetTitle("");
   if ( pT_eff ) h_layer_2_eff->GetXaxis()->SetTitle("p_{T} [GeV]");
   else	h_layer_2_eff->GetXaxis()->SetTitle("#eta");
   h_layer_2_eff->GetXaxis()->SetLabelFont(42);
   h_layer_2_eff->GetXaxis()->SetLabelSize(0.05);
   h_layer_2_eff->GetXaxis()->SetTitleSize(0.05);
   h_layer_2_eff->GetXaxis()->SetTitleOffset(1.3);
   h_layer_2_eff->GetXaxis()->SetTitleFont(42);
   h_layer_2_eff->GetYaxis()->SetRangeUser(0.0, 1.1);
   h_layer_2_eff->GetYaxis()->SetTitle("Efficiency");
   h_layer_2_eff->GetYaxis()->SetLabelFont(42);
   h_layer_2_eff->GetYaxis()->SetLabelSize(0.035);
   h_layer_2_eff->GetYaxis()->SetTitleSize(0.035);
   h_layer_2_eff->GetYaxis()->SetTitleOffset(0);
   h_layer_2_eff->GetYaxis()->SetTitleFont(42);
   h_layer_2_eff->SetLineColor(3);
   h_layer_2_eff->SetMarkerColor(3);
   h_layer_2_eff->SetMarkerStyle(20);
   h_layer_2_eff->SetMarkerSize(1);
   h_layer_2_eff->Draw("HIST p same");

   TH1F* h_layer_3_eff  = (TH1F*)h_layer3_Stub->Clone();
   h_layer_3_eff->Divide(h_layer_3_eff, dynamic_cast<TH1F*>(h_layer3_Cluster), 1, 1);
   h_layer_3_eff->SetTitle("");
   if ( pT_eff ) h_layer_3_eff->GetXaxis()->SetTitle("p_{T} [GeV]");
   else	h_layer_3_eff->GetXaxis()->SetTitle("#eta");
   h_layer_3_eff->GetXaxis()->SetLabelFont(42);
   h_layer_3_eff->GetXaxis()->SetLabelSize(0.05);
   h_layer_3_eff->GetXaxis()->SetTitleSize(0.05);
   h_layer_3_eff->GetXaxis()->SetTitleOffset(1.3);
   h_layer_3_eff->GetXaxis()->SetTitleFont(42);
   h_layer_3_eff->GetYaxis()->SetRangeUser(0.0, 1.1);
   h_layer_3_eff->GetYaxis()->SetTitle("Efficiency");
   h_layer_3_eff->GetYaxis()->SetLabelFont(42);
   h_layer_3_eff->GetYaxis()->SetLabelSize(0.035);
   h_layer_3_eff->GetYaxis()->SetTitleSize(0.035);
   h_layer_3_eff->GetYaxis()->SetTitleOffset(0);
   h_layer_3_eff->GetYaxis()->SetTitleFont(42);
   h_layer_3_eff->SetLineColor(4);
   h_layer_3_eff->SetMarkerColor(4);
   h_layer_3_eff->SetMarkerStyle(21);
   h_layer_3_eff->SetMarkerSize(1);
   h_layer_3_eff->Draw("HIST p same");

   TH1F* h_layer_4_eff  = (TH1F*)h_layer4_Stub->Clone();
   h_layer_4_eff->Divide(h_layer_4_eff, dynamic_cast<TH1F*>(h_layer4_Cluster), 1, 1);
   h_layer_4_eff->SetTitle("");
   if ( pT_eff ) h_layer_4_eff->GetXaxis()->SetTitle("p_{T} [GeV]");
   else	h_layer_4_eff->GetXaxis()->SetTitle("#eta");
   h_layer_4_eff->GetXaxis()->SetLabelFont(42);
   h_layer_4_eff->GetXaxis()->SetLabelSize(0.05);
   h_layer_4_eff->GetXaxis()->SetTitleSize(0.05);
   h_layer_4_eff->GetXaxis()->SetTitleOffset(1.3);
   h_layer_4_eff->GetXaxis()->SetTitleFont(42);
   h_layer_4_eff->GetYaxis()->SetRangeUser(0.0, 1.1);
   h_layer_4_eff->GetYaxis()->SetTitle("Efficiency");
   h_layer_4_eff->GetYaxis()->SetLabelFont(42);
   h_layer_4_eff->GetYaxis()->SetLabelSize(0.035);
   h_layer_4_eff->GetYaxis()->SetTitleSize(0.035);
   h_layer_4_eff->GetYaxis()->SetTitleOffset(0);
   h_layer_4_eff->GetYaxis()->SetTitleFont(42);
   h_layer_4_eff->SetLineColor(1);
   h_layer_4_eff->SetMarkerColor(1);
   h_layer_4_eff->SetMarkerStyle(22);
   h_layer_4_eff->SetMarkerSize(1);
   h_layer_4_eff->Draw("HIST p same");

   TH1F* h_layer_5_eff  = (TH1F*)h_layer5_Stub->Clone();
   h_layer_5_eff->Divide(h_layer_5_eff, dynamic_cast<TH1F*>(h_layer5_Cluster), 1, 1);
   h_layer_5_eff->SetTitle("");
   if ( pT_eff ) h_layer_5_eff->GetXaxis()->SetTitle("p_{T} [GeV]");
   else	h_layer_5_eff->GetXaxis()->SetTitle("#eta");
   h_layer_5_eff->GetXaxis()->SetLabelFont(42);
   h_layer_5_eff->GetXaxis()->SetLabelSize(0.05);
   h_layer_5_eff->GetXaxis()->SetTitleSize(0.05);
   h_layer_5_eff->GetXaxis()->SetTitleOffset(1.3);
   h_layer_5_eff->GetXaxis()->SetTitleFont(42);
   h_layer_5_eff->GetYaxis()->SetRangeUser(0.0, 1.1);
   h_layer_5_eff->GetYaxis()->SetTitle("Efficiency");
   h_layer_5_eff->GetYaxis()->SetLabelFont(42);
   h_layer_5_eff->GetYaxis()->SetLabelSize(0.035);
   h_layer_5_eff->GetYaxis()->SetTitleSize(0.035);
   h_layer_5_eff->GetYaxis()->SetTitleOffset(0);
   h_layer_5_eff->GetYaxis()->SetTitleFont(42);
   h_layer_5_eff->SetLineColor(6);
   h_layer_5_eff->SetMarkerColor(6);
   h_layer_5_eff->SetMarkerStyle(23);
   h_layer_5_eff->SetMarkerSize(1);
   h_layer_5_eff->Draw("HIST p same");

   TH1F* h_layer_6_eff  = (TH1F*)h_layer6_Stub->Clone();
   h_layer_6_eff->Divide(h_layer_6_eff, dynamic_cast<TH1F*>(h_layer6_Cluster), 1, 1);
   h_layer_6_eff->SetTitle("");
   if ( pT_eff ) h_layer_6_eff->GetXaxis()->SetTitle("p_{T} [GeV]");
   else	h_layer_6_eff->GetXaxis()->SetTitle("#eta");
   h_layer_6_eff->GetXaxis()->SetLabelFont(42);
   h_layer_6_eff->GetXaxis()->SetLabelSize(0.05);
   h_layer_6_eff->GetXaxis()->SetTitleSize(0.05);
   h_layer_6_eff->GetXaxis()->SetTitleOffset(1.3);
   h_layer_6_eff->GetXaxis()->SetTitleFont(42);
   h_layer_6_eff->GetYaxis()->SetRangeUser(0.0, 1.1);
   h_layer_6_eff->GetYaxis()->SetTitle("Efficiency");
   h_layer_6_eff->GetYaxis()->SetLabelFont(42);
   h_layer_6_eff->GetYaxis()->SetLabelSize(0.035);
   h_layer_6_eff->GetYaxis()->SetTitleSize(0.035);
   h_layer_6_eff->GetYaxis()->SetTitleOffset(0);
   h_layer_6_eff->GetYaxis()->SetTitleFont(42);
   h_layer_6_eff->SetLineColor(8);
   h_layer_6_eff->SetMarkerColor(8);
   h_layer_6_eff->SetMarkerStyle(24);
   h_layer_6_eff->SetMarkerSize(1);
   h_layer_6_eff->Draw("HIST p same");

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
   Canvas_barrel->SaveAs( (outputPath+"_layer_eff.pdf").c_str() );

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

   TH1F* h_disk_1_eff  = (TH1F*)h_disk1_Stub->Clone();
   h_disk_1_eff->Divide(h_disk_1_eff, dynamic_cast<TH1F*>(h_disk1_Cluster), 1, 1);
   h_disk_1_eff->SetTitle("");
   if ( pT_eff ) h_disk_1_eff->GetXaxis()->SetTitle("p_{T} [GeV]");
   else h_disk_1_eff->GetXaxis()->SetTitle("#eta"); 
   h_disk_1_eff->GetXaxis()->SetLabelFont(42);
   h_disk_1_eff->GetXaxis()->SetLabelSize(0.05);
   h_disk_1_eff->GetXaxis()->SetTitleSize(0.05);
   h_disk_1_eff->GetXaxis()->SetTitleOffset(1.3);
   h_disk_1_eff->GetXaxis()->SetTitleFont(42);
   h_disk_1_eff->GetYaxis()->SetRangeUser(0.0, 1.1);
   h_disk_1_eff->GetYaxis()->SetTitle("Efficiency");
   h_disk_1_eff->GetYaxis()->SetLabelFont(42);
   h_disk_1_eff->GetYaxis()->SetLabelSize(0.035);
   h_disk_1_eff->GetYaxis()->SetTitleSize(0.035);
   h_disk_1_eff->GetYaxis()->SetTitleOffset(0);
   h_disk_1_eff->GetYaxis()->SetTitleFont(42);
   h_disk_1_eff->SetLineColor(2);
   h_disk_1_eff->SetMarkerColor(2);
   h_disk_1_eff->SetMarkerStyle(25);
   h_disk_1_eff->SetMarkerSize(1);
   h_disk_1_eff->Draw("HIST p");

   TH1F* h_disk_2_eff  = (TH1F*)h_disk2_Stub->Clone();
   h_disk_2_eff->Divide(h_disk_2_eff, dynamic_cast<TH1F*>(h_disk2_Cluster), 1, 1);
   h_disk_2_eff->SetTitle("");
   if ( pT_eff ) h_disk_2_eff->GetXaxis()->SetTitle("p_{T} [GeV]");
   else	h_disk_2_eff->GetXaxis()->SetTitle("#eta");
   h_disk_2_eff->GetXaxis()->SetLabelFont(42);
   h_disk_2_eff->GetXaxis()->SetLabelSize(0.05);
   h_disk_2_eff->GetXaxis()->SetTitleSize(0.05);
   h_disk_2_eff->GetXaxis()->SetTitleOffset(1.3);
   h_disk_2_eff->GetXaxis()->SetTitleFont(42);
   h_disk_2_eff->GetYaxis()->SetRangeUser(0.0, 1.1);
   h_disk_2_eff->GetYaxis()->SetTitle("Efficiency");
   h_disk_2_eff->GetYaxis()->SetLabelFont(42);
   h_disk_2_eff->GetYaxis()->SetLabelSize(0.035);
   h_disk_2_eff->GetYaxis()->SetTitleSize(0.035);
   h_disk_2_eff->GetYaxis()->SetTitleOffset(0);
   h_disk_2_eff->GetYaxis()->SetTitleFont(42);
   h_disk_2_eff->SetLineColor(3);
   h_disk_2_eff->SetMarkerColor(3);
   h_disk_2_eff->SetMarkerStyle(20);
   h_disk_2_eff->SetMarkerSize(1);
   h_disk_2_eff->Draw("HIST p same");

   TH1F* h_disk_3_eff  = (TH1F*)h_disk3_Stub->Clone();
   h_disk_3_eff->Divide(h_disk_3_eff, dynamic_cast<TH1F*>(h_disk3_Cluster), 1, 1);
   h_disk_3_eff->SetTitle("");
   if ( pT_eff ) h_disk_3_eff->GetXaxis()->SetTitle("p_{T} [GeV]");
   else	h_disk_3_eff->GetXaxis()->SetTitle("#eta");
   h_disk_3_eff->GetXaxis()->SetLabelFont(42);
   h_disk_3_eff->GetXaxis()->SetLabelSize(0.05);
   h_disk_3_eff->GetXaxis()->SetTitleSize(0.05);
   h_disk_3_eff->GetXaxis()->SetTitleOffset(1.3);
   h_disk_3_eff->GetXaxis()->SetTitleFont(42);
   h_disk_3_eff->GetYaxis()->SetRangeUser(0.0, 1.1);
   h_disk_3_eff->GetYaxis()->SetTitle("Efficiency");
   h_disk_3_eff->GetYaxis()->SetLabelFont(42);
   h_disk_3_eff->GetYaxis()->SetLabelSize(0.035);
   h_disk_3_eff->GetYaxis()->SetTitleSize(0.035);
   h_disk_3_eff->GetYaxis()->SetTitleOffset(0);
   h_disk_3_eff->GetYaxis()->SetTitleFont(42);
   h_disk_3_eff->SetLineColor(4);
   h_disk_3_eff->SetMarkerColor(4);
   h_disk_3_eff->SetMarkerStyle(21);
   h_disk_3_eff->SetMarkerSize(1);
   h_disk_3_eff->Draw("HIST p same");

   TH1F* h_disk_4_eff  = (TH1F*)h_disk4_Stub->Clone();
   h_disk_4_eff->Divide(h_disk_4_eff, dynamic_cast<TH1F*>(h_disk4_Cluster), 1, 1);
   h_disk_4_eff->SetTitle("");
   if ( pT_eff ) h_disk_4_eff->GetXaxis()->SetTitle("p_{T} [GeV]");
   else	h_disk_4_eff->GetXaxis()->SetTitle("#eta");
   h_disk_4_eff->GetXaxis()->SetLabelFont(42);
   h_disk_4_eff->GetXaxis()->SetLabelSize(0.05);
   h_disk_4_eff->GetXaxis()->SetTitleSize(0.05);
   h_disk_4_eff->GetXaxis()->SetTitleOffset(1.3);
   h_disk_4_eff->GetXaxis()->SetTitleFont(42);
   h_disk_4_eff->GetYaxis()->SetRangeUser(0.0, 1.1);
   h_disk_4_eff->GetYaxis()->SetTitle("Efficiency");
   h_disk_4_eff->GetYaxis()->SetLabelFont(42);
   h_disk_4_eff->GetYaxis()->SetLabelSize(0.035);
   h_disk_4_eff->GetYaxis()->SetTitleSize(0.035);
   h_disk_4_eff->GetYaxis()->SetTitleOffset(0);
   h_disk_4_eff->GetYaxis()->SetTitleFont(42);
   h_disk_4_eff->SetLineColor(1);
   h_disk_4_eff->SetMarkerColor(1);
   h_disk_4_eff->SetMarkerStyle(22);
   h_disk_4_eff->SetMarkerSize(1);
   h_disk_4_eff->Draw("HIST p same");

   TH1F* h_disk_5_eff  = (TH1F*)h_disk5_Stub->Clone();
   h_disk_5_eff->Divide(h_disk_5_eff, dynamic_cast<TH1F*>(h_disk5_Cluster), 1, 1);
   h_disk_5_eff->SetTitle("");
   if ( pT_eff ) h_disk_5_eff->GetXaxis()->SetTitle("p_{T} [GeV]");
   else	h_disk_5_eff->GetXaxis()->SetTitle("#eta");
   h_disk_5_eff->GetXaxis()->SetLabelFont(42);
   h_disk_5_eff->GetXaxis()->SetLabelSize(0.05);
   h_disk_5_eff->GetXaxis()->SetTitleSize(0.05);
   h_disk_5_eff->GetXaxis()->SetTitleOffset(1.3);
   h_disk_5_eff->GetXaxis()->SetTitleFont(42);
   h_disk_5_eff->GetYaxis()->SetRangeUser(0.0, 1.1);
   h_disk_5_eff->GetYaxis()->SetTitle("Efficiency");
   h_disk_5_eff->GetYaxis()->SetLabelFont(42);
   h_disk_5_eff->GetYaxis()->SetLabelSize(0.035);
   h_disk_5_eff->GetYaxis()->SetTitleSize(0.035);
   h_disk_5_eff->GetYaxis()->SetTitleOffset(0);
   h_disk_5_eff->GetYaxis()->SetTitleFont(42);
   h_disk_5_eff->SetLineColor(6);
   h_disk_5_eff->SetMarkerColor(6);
   h_disk_5_eff->SetMarkerStyle(23);
   h_disk_5_eff->SetMarkerSize(1);
   h_disk_5_eff->Draw("HIST p same");

/// Draw Legend
   TLegend *leg_endcap = new TLegend(0.80,0.25,0.87,0.45,NULL,"brNDC");
   leg_endcap->SetBorderSize(0);
   leg_endcap->SetTextSize(0.02);
   leg_endcap->SetLineColor(1);
   leg_endcap->SetLineStyle(1);
   leg_endcap->SetLineWidth(1);
   leg_endcap->SetFillColor(0);
   leg_endcap->SetFillStyle(1001);
   TLegendEntry *entry_endcap = leg_endcap->AddEntry("endcap_1_Stub", "Disk 1","P");
   entry_endcap->SetMarkerColor(2);
   entry_endcap->SetMarkerStyle(25);
   entry_endcap->SetMarkerSize(2);
   entry_endcap->SetTextFont(42);
   entry_endcap=leg_endcap->AddEntry("endcap_2_Stub", "Disk 2","P");
   entry_endcap->SetMarkerColor(3);
   entry_endcap->SetMarkerStyle(20);
   entry_endcap->SetMarkerSize(2);
   entry_endcap->SetTextFont(42);
   entry_endcap=leg_endcap->AddEntry("endcap_3_Stub", "Disk 3","P");
   entry_endcap->SetMarkerColor(4);
   entry_endcap->SetMarkerStyle(21);
   entry_endcap->SetMarkerSize(2);
   entry_endcap->SetTextFont(42);
   entry_endcap=leg_endcap->AddEntry("endcap_4_Stub", "Disk 4","P");
   entry_endcap->SetMarkerColor(1);
   entry_endcap->SetMarkerStyle(22);
   entry_endcap->SetMarkerSize(2);
   entry_endcap->SetTextFont(42);
   entry_endcap=leg_endcap->AddEntry("endcap_5_Stub", "Disk 5","P");
   entry_endcap->SetMarkerColor(6);
   entry_endcap->SetMarkerStyle(23);
   entry_endcap->SetMarkerSize(2);
   entry_endcap->SetTextFont(42);
   leg_endcap->Draw("HIST");

   Canvas_endcap->Modified();
   Canvas_endcap->cd();
   Canvas_endcap->SetSelected(Canvas_endcap);
   Canvas_endcap->SaveAs( (outputPath+"_disk_eff.pdf").c_str() );

}
