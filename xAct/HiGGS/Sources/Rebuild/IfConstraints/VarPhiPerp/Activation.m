(*==============*)
(*  Activation  *)
(*==============*)

DefTensor[BVarPhiPerp[-a,-c],M4];

BVarPhiPerpDefinition=(
	-2V[g]B[-k,-o]G3[o,-z]H[h,z](
		cBet1 PT1[-i,-g,-h,a,c,d]
		+cBet2 PT2[-i,-g,-h,a,c,d]
		+cBet3 PT3[-i,-g,-h,a,c,d]
	)PPara[-c,m]PPara[-d,n]TLambdaPi[-a,-m,-n]
	-2V[g]B[-k,-o]G3[o,-z]H[h,z](
		cBet1 PT1[-i,-g,-h,a,c,d]
		+cBet2 PT2[-i,-g,-h,a,c,d]
		+cBet3 PT3[-i,-g,-h,a,c,d]
	)(
		PPerp[-c,m]PPara[-d,n]TLambdaPi[-a,-m,-n]
		+PPara[-c,m]PPerp[-d,n]TLambdaPi[-a,-m,-n]
	)
);

BVarPhiPerpActivate=MakeRule[{BVarPhiPerp[-i,-k],Evaluate[BVarPhiPerpDefinition]},MetricOn->All,ContractMetrics->True];

DefTensor[AVarPhiPerp[-a,-b,-c],M4,Antisymmetric[{-a,-b}]];

AVarPhiPerpDefinition=(
	-4V[g]B[-k,-o]G3[o,-z]H[h,z](
		cAlp1 PR1[-i,-j,-g,-h,a,b,c,d]
		+cAlp2 PR2[-i,-j,-g,-h,a,b,c,d]
		+cAlp3 PR3[-i,-j,-g,-h,a,b,c,d]
		+cAlp4 PR4[-i,-j,-g,-h,a,b,c,d]
		+cAlp5 PR5[-i,-j,-g,-h,a,b,c,d]
		+cAlp6 PR6[-i,-j,-g,-h,a,b,c,d]
	)PPara[-c,m]PPara[-d,n]RLambdaPi[-a,-b,-m,-n]
	-4V[g]B[-k,-o]G3[o,-z]H[h,z](
		cAlp1 PR1[-i,-j,-g,-h,a,b,c,d]
		+cAlp2 PR2[-i,-j,-g,-h,a,b,c,d]
		+cAlp3 PR3[-i,-j,-g,-h,a,b,c,d]
		+cAlp4 PR4[-i,-j,-g,-h,a,b,c,d]
		+cAlp5 PR5[-i,-j,-g,-h,a,b,c,d]
		+cAlp6 PR6[-i,-j,-g,-h,a,b,c,d]
	)(
		PPerp[-c,m]PPara[-d,n]RLambdaPi[-a,-b,-m,-n]
		+PPara[-c,m]PPerp[-d,n]RLambdaPi[-a,-b,-m,-n]
	)
);

AVarPhiPerpActivate=MakeRule[{AVarPhiPerp[-i,-j,-k],Evaluate[AVarPhiPerpDefinition]},MetricOn->All,ContractMetrics->True];
