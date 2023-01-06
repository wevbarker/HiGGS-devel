(*==================*)
(*  LambdaPiPerpPara  *)
(*==================*)

(*Defining parallel field strength multipliers*)
RLambdaPiPpSymb="\!\(\*SubsuperscriptBox[\(\[CurlyPi]\), \(\[ScriptCapitalR]\), \(\[DoubleVerticalBar]\)]\)";
DefTensor[RLambdaPiP[-a,-b,-c,-d],M4,{Antisymmetric[{-a,-b}],Antisymmetric[{-c,-d}]},PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPiPpSymb],OrthogonalTo->{V[c],V[d]}];
TLambdaPiPpSymb="\!\(\*SubsuperscriptBox[\(\[CurlyPi]\), \(\[ScriptCapitalT]\), \(\[DoubleVerticalBar]\)]\)";
DefTensor[TLambdaPiP[-a,-c,-d],M4,Antisymmetric[{-c,-d}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPiPpSymb],OrthogonalTo->{V[c],V[d]}];
TLambdaPiPToTLambdaPi=MakeRule[{TLambdaPiP[-a,-b,-c],PPara[-b,e]PPara[-c,f]TLambdaPi[-a,-e,-f]},MetricOn->All,ContractMetrics->True];
RLambdaPiPToRLambdaPi=MakeRule[{RLambdaPiP[-a,-b,-c,-d],PPara[-c,e]PPara[-d,f]RLambdaPi[-a,-b,-e,-f]},MetricOn->All,ContractMetrics->True];
StrengthLambdaPiPToStrengthLambdaPi=Join[RLambdaPiPToRLambdaPi,TLambdaPiPToTLambdaPi];
