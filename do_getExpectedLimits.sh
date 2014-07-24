#! /bin/bash

function run_limit
{
cardname=$1

echo $cardname > limitlogs/${cardname}_log.txt
echo $cardname >> limitlogs/Summary_log.txt

# root -b -q "getExpectedLimits.C (\"$cardname\")" | grep "limit:" >> limitlogs/${cardname}_log.txt &
# root -b -q "getExpectedLimits.C (\"$cardname\")" | grep "limit:" >> limitlogs/Summary_log.txt

root -b -q "getExpectedLimits.C (\"lands_output/$cardname\")" | grep -i "obs" >> limitlogs/${cardname}_log.txt &
root -b -q "getExpectedLimits.C (\"lands_output/$cardname\")" | grep -i "obs" >> limitlogs/Summary_log.txt

echo "" >> limitlogs/Summary_log.txt

}

echo "Summary:" > limitlogs/Summary_log.txt

run_limit datacard_GMSB_ZMET_150_0

#"actual" cards
# run_limit datacard_Wino_DOZ_130_0
# run_limit datacard_Wino_DOZ_150_0
# run_limit datacard_Wino_DOZ_175_0
# run_limit datacard_Wino_DOZ_200_0
# run_limit datacard_Wino_DOZ_225_0
# run_limit datacard_Wino_DOZ_250_0
# run_limit datacard_Wino_DOZ_275_0
# run_limit datacard_Wino_DOZ_300_0
# run_limit datacard_Wino_DOZ_325_0
# run_limit datacard_Wino_DOZ_350_0
# run_limit datacard_Wino_DOZ_375_0
# run_limit datacard_Wino_DOZ_400_0
# run_limit datacard_Wino_DOZ_425_0
# run_limit datacard_Wino_DOZ_450_0
# run_limit datacard_Wino_DOZ_475_0
# run_limit datacard_Wino_DOZ_500_0
