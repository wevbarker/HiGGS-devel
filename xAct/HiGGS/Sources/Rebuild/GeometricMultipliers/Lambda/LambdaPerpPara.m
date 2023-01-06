(*==================*)
(*  LambdaPerpPara  *)
(*==================*)

(*Defining parallel field strength multipliers*)
RLambdaPpSymb="\!\(\*SubsuperscriptBox[\(\[Lambda]\), \(\[ScriptCapitalR]\), \(\[DoubleVerticalBar]\)]\)";
DefTensor[RLambdaP[-a,-b,-c,-d],M4,{Antisymmetric[{-a,-b}],Antisymmetric[{-c,-d}]},PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPpSymb],OrthogonalTo->{V[c],V[d]}];
TLambdaPpSymb="\!\(\*SubsuperscriptBox[\(\[Lambda]\), \(\[ScriptCapitalT]\), \(\[DoubleVerticalBar]\)]\)";
DefTensor[TLambdaP[-a,-c,-d],M4,Antisymmetric[{-c,-d}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPpSymb],OrthogonalTo->{V[c],V[d]}];
TLambdaPToTLambda=MakeRule[{TLambdaP[-a,-b,-c],PPara[-b,e]PPara[-c,f]TLambda[-a,-e,-f]},MetricOn->All,ContractMetrics->True];
RLambdaPToRLambda=MakeRule[{RLambdaP[-a,-b,-c,-d],PPara[-c,e]PPara[-d,f]RLambda[-a,-b,-e,-f]},MetricOn->All,ContractMetrics->True];
StrengthLambdaPToStrengthLambda=Join[RLambdaPToRLambda,TLambdaPToTLambda];
