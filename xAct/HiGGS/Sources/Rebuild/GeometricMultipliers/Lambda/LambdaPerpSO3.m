(*=================*)
(*  LambdaPerpSO3  *)
(*=================*)

TLambdaPerpSymb="\!\(\*SubsuperscriptBox[\(\[Lambda]\), \(\[ScriptCapitalT]\), \(\[UpTee]\)]\)";
DefTensor[TLambdaPerp0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPerpSymb,xAct`HiGGS`Private`Spin0p]];
DefTensor[TLambdaPerp1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPerpSymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]}];
DefTensor[TLambdaPerp1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPerpSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]}];
DefTensor[TLambdaPerp2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPerpSymb,xAct`HiGGS`Private`Spin2p],OrthogonalTo->{V[a],V[b]}];
RLambdaPerpSymb="\!\(\*SubsuperscriptBox[\(\[Lambda]\), \(\[ScriptCapitalR]\), \(\[UpTee]\)]\)";
DefTensor[RLambdaPerp0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPerpSymb,xAct`HiGGS`Private`Spin0p]];
DefTensor[RLambdaPerp0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPerpSymb,xAct`HiGGS`Private`Spin0m]];
DefTensor[RLambdaPerp1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPerpSymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]}];
DefTensor[RLambdaPerp1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPerpSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]}];
DefTensor[RLambdaPerp2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPerpSymb,xAct`HiGGS`Private`Spin2p],OrthogonalTo->{V[a],V[b]}];
DefTensor[RLambdaPerp2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPerpSymb,xAct`HiGGS`Private`Spin2m],OrthogonalTo->{V[a],V[b],V[c]}];
AutomaticRules[RLambdaPerp2m,MakeRule[{RLambdaPerp2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[RLambdaPerp2m,MakeRule[{epsilonG[a,b,c,d]RLambdaPerp2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[RLambdaPerp2p,MakeRule[{RLambdaPerp2p[a,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[TLambdaPerp2p,MakeRule[{TLambdaPerp2p[a,-a],0},MetricOn->All,ContractMetrics->True]];
