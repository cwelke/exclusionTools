#! /bin/bash

function makeOneCard
{
	PROCESS=$1
	inomass=$2
	nlspmass=$3
	njets=$4
	sig0=$5
	serr0=$6
	sig1=$7
	serr1=$8
	sig2=$9
	serr2=${10}

	dcName="datacards/datacard_${PROCESS}_ZMET_${inomass}_${nlspmass}.txt"

	if [ -e $dcName ];then
		rm $dcName
	fi
	touch $dcName

	if [ "$njets" -eq 2 ];then
		obs0=1187
		obs1=65
		obs2=7
		z0=336.3
		z1=28.6
		z2=7.7
		zerr0=1.26
		zerr1=1.30
		zerr2=1.47
		fs0=868
		fs1=45.9
		fs2=5.1
		fserr0=1.07
		fserr1=1.16
		fserr2=1.45
		
	elif [ "$njets" -eq 3 ];then
		obs0=490
		obs1=35
		obs2=6
		z0=124.3
		z1=12.7
		z2=3.2
		zerr0=1.27
		zerr1=1.30
		zerr2=1.56
		fs0=353.9
		fs1=26.5
		fs2=2.0
		fserr0=1.08
		fserr1=1.20
		fserr2=1.70
	fi

	echo "imax 3 number of channels"													>> $dcName
	echo "jmax 3 number of background"													>> $dcName
	echo "kmax * number of nuisance parameters (sources of systematical uncertainties)"	>> $dcName
	echo ""             								>> $dcName
	echo "bin		0		1		2"					>> $dcName
	echo "observation	$obs0		$obs1		$obs2"	>> $dcName
	echo ""												>> $dcName
	echo "bin			0	0	0	1	1	1	2	2	2"		>> $dcName
	echo "process			sig	Z	OF	sig	Z	OF	sig	Z	OF"	>> $dcName
	echo "process			0	1	2	0	1	2	0	1	2"	>> $dcName
	echo ""														>> $dcName
	echo "rate			$sig0	$z0	$fs0	$sig1	$z1	$fs1	$sig2	$z2	$fs2		events"			>> $dcName
	echo "JES		lnN	1.00	-	-	1.00	-	-	1.00	-	-		Jet Energy Scale"			>> $dcName
	echo "lumi		lnN	1.04	-	-	1.04	-	-	1.04	-	-		luminosity"					>> $dcName
	echo "efflep		lnN	1.05	-	-	1.05	-	-	1.05	-	-		lepton efficiency"		>> $dcName
	echo "Zerr		lnN	-	$zerr0	-	-	$zerr1	-	-	$zerr2	-		Z bkg syst"					>> $dcName
	echo "OFerr		lnN	-	-	$fserr0	-	-	$fserr1	-	-	$fserr2		FS BG syst"					>> $dcName
	echo "ISR		lnN	1.02	-	-	1.02	-	-	1.02	-	-		isr"						>> $dcName
	echo "FASTSIM		lnN	1.02	-	-	1.02	-	-	1.02	-	-		lep fastsim eff"		>> $dcName
	echo "SIGSTAT		lnN	$serr0	-	-	$serr1	-	-	$serr2	-	-		stat uncert on signal"	>> $dcName

}

# makeOneCard "GMSB" "130" "0" "2" "10" "0.1" "9" "0.1" "8" "0.1" 
makeOneCard "GMSB" 150 0 2 3.6 0.1 0.2 0.03 0.04 0.01 
