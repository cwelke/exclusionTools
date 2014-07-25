#include <fstream>
#include <iostream>
#include <string>

#include "TH1F.h"
#include "TChain.h"

using namespace std;

int getSignalYields()
{

  string njets = "2jets";
  string jetcut = "";

  TChain * T1 = new TChain("T1");
  T1->Add("~benhoob/ZMet2012/output/V00-02-16/GMSB_madgraph_baby_oldIso.root");

  TH1F * nobs = new TH1F("nobs","",1,0,1);
  nobs->Sumw2();
  // mg: 110-420
  double val_met100[32];
  double val_met200[32];
  double val_met300[32];

  double err_met100[32];
  double err_met200[32];
  double err_met300[32];

  ofstream fout(Form("signal_yields_GMSB_%s.txt",njets.c_str()));
  if( njets == "2jets" )	jetcut = "2";
  else						jetcut = "3";
  

  for( int ind = 110; ind < 430; ind += 10){
	T1->Draw("0>>nobs",Form("(mg==%i && dilmass>81 && dilmass < 101 && njets40 >=%s && pfmet > 100 && pfmet < 200 && lep1.pt()>20&&lep2.pt()>20&&(abs(abs(lep1.eta())-1.5)>0.1&&abs(abs(lep2.eta())-1.5)>0.1)&&drll>0.3&&leptype!=2)*(isrweight*weight*trgeff*vtxweight)",ind,jetcut.c_str()));
	val_met100[(ind-110)/10] = nobs->GetBinContent(1);
	err_met100[(ind-110)/10] = nobs->GetBinError(1);
	fout<<val_met100[(ind-110)/10]<<"\t";
	fout<<err_met100[(ind-110)/10]<<"\t";

	T1->Draw("0>>nobs",Form("(mg==%i && dilmass>81 && dilmass < 101 && njets40 >=%s && pfmet > 200 && pfmet < 300 && lep1.pt()>20&&lep2.pt()>20&&(abs(abs(lep1.eta())-1.5)>0.1&&abs(abs(lep2.eta())-1.5)>0.1)&&drll>0.3&&leptype!=2)*(isrweight*weight*trgeff*vtxweight)",ind,jetcut.c_str()));
	val_met200[(ind-110)/10] = nobs->GetBinContent(1);
	err_met200[(ind-110)/10] = nobs->GetBinError(1);
	fout<<val_met200[(ind-110)/10]<<"\t";
	fout<<err_met200[(ind-110)/10]<<"\t";

	T1->Draw("0>>nobs",Form("(mg==%i && dilmass>81 && dilmass < 101 && njets40 >=%s && pfmet > 300 && lep1.pt()>20&&lep2.pt()>20&&(abs(abs(lep1.eta())-1.5)>0.1&&abs(abs(lep2.eta())-1.5)>0.1)&&drll>0.3&&leptype!=2)*(isrweight*weight*trgeff*vtxweight)",ind,jetcut.c_str()));
	val_met300[(ind-110)/10] = nobs->GetBinContent(1);
	err_met300[(ind-110)/10] = nobs->GetBinError(1);
	fout<<val_met300[(ind-110)/10]<<"\t";
	fout<<err_met300[(ind-110)/10]<<"\t"<<endl;
  }

  fout.close();
}
