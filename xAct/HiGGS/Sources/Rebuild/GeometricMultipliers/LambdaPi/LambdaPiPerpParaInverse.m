(*=========================*)
(*  LambdaPiPerpParaInverse  *)
(*=========================*)

(*Defining perpendicular field strength multipliers*)
TLambdaPiPerppSymb="\!\(\*SubsuperscriptBox[\(\[CurlyPi]\), \(\[ScriptCapitalT]\), \(\[UpTee]\)]\)";
DefTensor[TLambdaPiPerp[-a,-b],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPiPerppSymb],OrthogonalTo->{V[b]}];
RLambdaPiPerppSymb="\!\(\*SubsuperscriptBox[\(\[CurlyPi]\), \(\[ScriptCapitalR]\), \(\[UpTee]\)]\)";
DefTensor[RLambdaPiPerp[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPiPerppSymb],OrthogonalTo->{V[c]}];
TLambdaPiPerpToTLambdaPi=MakeRule[{TLambdaPiPerp[-a,-b],PPara[-b,f]V[g]TLambdaPi[-a,-f,-g]},MetricOn->All,ContractMetrics->True];
RLambdaPiPerpToRLambdaPi=MakeRule[{RLambdaPiPerp[-a,-b,-c],PPara[-c,e]V[f]RLambdaPi[-a,-b,-e,-f]},MetricOn->All,ContractMetrics->True];
StrengthLambdaPiPerpToStrengthLambdaPi=Join[RLambdaPiPerpToRLambdaPi,TLambdaPiPerpToTLambdaPi];
