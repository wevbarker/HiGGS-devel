(*=================*)
(*  LambdaPiPerpSO3  *)
(*=================*)

TLambdaPiPerpSymb="\!\(\*SubsuperscriptBox[\(\[CurlyPi]\), \(\[ScriptCapitalT]\), \(\[UpTee]\)]\)";
DefTensor[TLambdaPiPerp0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPiPerpSymb,xAct`HiGGS`Private`Spin0p]];
DefTensor[TLambdaPiPerp1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPiPerpSymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]}];
DefTensor[TLambdaPiPerp1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPiPerpSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]}];
DefTensor[TLambdaPiPerp2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPiPerpSymb,xAct`HiGGS`Private`Spin2p],OrthogonalTo->{V[a],V[b]}];
RLambdaPiPerpSymb="\!\(\*SubsuperscriptBox[\(\[CurlyPi]\), \(\[ScriptCapitalR]\), \(\[UpTee]\)]\)";
DefTensor[RLambdaPiPerp0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPiPerpSymb,xAct`HiGGS`Private`Spin0p]];
DefTensor[RLambdaPiPerp0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPiPerpSymb,xAct`HiGGS`Private`Spin0m]];
DefTensor[RLambdaPiPerp1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPiPerpSymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]}];
DefTensor[RLambdaPiPerp1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPiPerpSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]}];
DefTensor[RLambdaPiPerp2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPiPerpSymb,xAct`HiGGS`Private`Spin2p],OrthogonalTo->{V[a],V[b]}];
DefTensor[RLambdaPiPerp2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPiPerpSymb,xAct`HiGGS`Private`Spin2m],OrthogonalTo->{V[a],V[b],V[c]}];
AutomaticRules[RLambdaPiPerp2m,MakeRule[{RLambdaPiPerp2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[RLambdaPiPerp2m,MakeRule[{epsilonG[a,b,c,d]RLambdaPiPerp2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[RLambdaPiPerp2p,MakeRule[{RLambdaPiPerp2p[a,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[TLambdaPiPerp2p,MakeRule[{TLambdaPiPerp2p[a,-a],0},MetricOn->All,ContractMetrics->True]];
