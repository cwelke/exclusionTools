#include <string>
#include "TSystem.h"
#include "TROOT.h"

int getExpectedLimits( std::string cardname = "" )
{

  gROOT->ProcessLine( ".L ~/CMSSW/CMSSW_5_3_2_patch4/LandS/test/fitRvsCLs.C+" );
  run(Form("%s_m2lnQ.root", cardname.c_str() ), "plot" );

  return 0;
}
