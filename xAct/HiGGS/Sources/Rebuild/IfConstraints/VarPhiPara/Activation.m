(*==============*)
(*  Activation  *)
(*==============*)

DefTensor[BVarPhiPara[-a,-b,-c],M4,Antisymmetric[{-b,-c}]];

BVarPhiParaDefinition=(
	-PPara[-l,g]PPara[-k,h](
		cBet1 PT1[-i,-g,-h,a,c,d]
		+cBet2 PT2[-i,-g,-h,a,c,d]
		+cBet3 PT3[-i,-g,-h,a,c,d]
	)PPara[-c,m]PPara[-d,n]TLambdaPi[-a,-m,-n]
	-PPara[-l,g]PPara[-k,h](
		cBet1 PT1[-i,-g,-h,a,c,d]
		+cBet2 PT2[-i,-g,-h,a,c,d]
		+cBet3 PT3[-i,-g,-h,a,c,d]
	)(
		PPerp[-c,m]PPara[-d,n]TLambdaPi[-a,-m,-n]
		+PPara[-c,m]PPerp[-d,n]TLambdaPi[-a,-m,-n]
	)
);

BVarPhiParaActivate=MakeRule[{BVarPhiPara[-i,-l,-k],Evaluate[BVarPhiParaDefinition]},MetricOn->All,ContractMetrics->True];

DefTensor[AVarPhiPara[-a,-b,-c,-d],M4,{Antisymmetric[{-a,-b}],Antisymmetric[{-c,-d}]}];

AVarPhiParaDefinition=(
	-2PPara[-l,g]PPara[-k,h](
		cAlp1 PR1[-i,-j,-g,-h,a,b,c,d]
		+cAlp2 PR2[-i,-j,-g,-h,a,b,c,d]
		+cAlp3 PR3[-i,-j,-g,-h,a,b,c,d]
		+cAlp4 PR4[-i,-j,-g,-h,a,b,c,d]
		+cAlp5 PR5[-i,-j,-g,-h,a,b,c,d]
		+cAlp6 PR6[-i,-j,-g,-h,a,b,c,d]
	)PPara[-c,m]PPara[-d,n]RLambdaPi[-a,-b,-m,-n]
	-2PPara[-l,g]PPara[-k,h](
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

AVarPhiParaActivate=MakeRule[{AVarPhiPara[-i,-j,-l,-k],Evaluate[AVarPhiParaDefinition]},MetricOn->All,ContractMetrics->True];
