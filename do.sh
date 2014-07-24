#! /bin/bash

function process_card
{
	cardname=$1
# card.txt
# lands.exe
	/home/users/cwelke/CMSSW/CMSSW_5_3_2_patch4/LandS/test/lands.exe -d datacards/${cardname}.txt -M Hybrid --freq --ExpectationHints Asymptotic --scanRs 1 --freq --nToysForCLsb 10000 --nToysForCLb 5000 --seed 1234 -n $cardname -rMin 0 -rMax 100
mv ${cardname}*.root ./lands_output/.
}

function process_significance
{
	cardname=$1
# card.txt
# lands.exe
	/home/users/cwelke/CMSSW/CMSSW_5_3_2_patch4/LandS/test/lands.exe -d datacards/${cardname}.txt -M Hybrid --freq --ExpectationHints Asymptotic --scanRs 1 --freq --nToysForCLsb 10000 --nToysForCLb 5000 --seed 123 --significance 1 -n $cardname &
}


#process_significance MET100_MT200_CONTROL
# process_significance MET100_MT200_bveto_CONTROL

# #"official" data cards
# process_card datacard_Wino_DOZ_130_0
# process_card datacard_Wino_DOZ_150_0
# process_card datacard_Wino_DOZ_175_0
# process_card datacard_Wino_DOZ_200_0
# process_card datacard_Wino_DOZ_225_0
# process_card datacard_Wino_DOZ_200_0
# process_card datacard_Wino_DOZ_250_0
# process_card datacard_Wino_DOZ_275_0
# process_card datacard_Wino_DOZ_300_0
# process_card datacard_Wino_DOZ_325_0
# process_card datacard_Wino_DOZ_350_0
# process_card datacard_Wino_DOZ_375_0
# process_card datacard_Wino_DOZ_400_0
# process_card datacard_Wino_DOZ_425_0
# process_card datacard_Wino_DOZ_450_0
# process_card datacard_Wino_DOZ_475_0
# process_card datacard_Wino_DOZ_500_0

process_card datacard_GMSB_ZMET_150_0
