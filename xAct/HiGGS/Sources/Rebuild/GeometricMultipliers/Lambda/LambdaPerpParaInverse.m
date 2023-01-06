(*=========================*)
(*  LambdaPerpParaInverse  *)
(*=========================*)

(*Defining perpendicular field strength multipliers*)
TLambdaPerppSymb="\!\(\*SubsuperscriptBox[\(\[Lambda]\), \(\[ScriptCapitalT]\), \(\[UpTee]\)]\)";
DefTensor[TLambdaPerp[-a,-b],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPerppSymb],OrthogonalTo->{V[b]}];
RLambdaPerppSymb="\!\(\*SubsuperscriptBox[\(\[Lambda]\), \(\[ScriptCapitalR]\), \(\[UpTee]\)]\)";
DefTensor[RLambdaPerp[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPerppSymb],OrthogonalTo->{V[c]}];
TLambdaPerpToTLambda=MakeRule[{TLambdaPerp[-a,-b],PPara[-b,f]V[g]TLambda[-a,-f,-g]},MetricOn->All,ContractMetrics->True];
RLambdaPerpToRLambda=MakeRule[{RLambdaPerp[-a,-b,-c],PPara[-c,e]V[f]RLambda[-a,-b,-e,-f]},MetricOn->All,ContractMetrics->True];
StrengthLambdaPerpToStrengthLambda=Join[RLambdaPerpToRLambda,TLambdaPerpToTLambda];
