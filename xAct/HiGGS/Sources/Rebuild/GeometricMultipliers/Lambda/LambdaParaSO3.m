(*=================*)
(*  LambdaParaSO3  *)
(*=================*)

(*O(3) decomposition of the canonical parts of Riemann-Cartan multiplier*)
TLambdaPSymb="\!\(\*SubsuperscriptBox[\(\[Lambda]\), \(\[ScriptCapitalT]\), \(\[DoubleVerticalBar]\)]\)";
DefTensor[TLambdaP0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPSymb,xAct`HiGGS`Private`Spin0m]];
DefTensor[TLambdaP1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPSymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]}];
DefTensor[TLambdaP1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]}];
DefTensor[TLambdaP2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPSymb,xAct`HiGGS`Private`Spin2m],OrthogonalTo->{V[a],V[b],V[c]}];
RLambdaPSymb="\!\(\*SubsuperscriptBox[\(\[Lambda]\), \(\[ScriptCapitalR]\), \(\[DoubleVerticalBar]\)]\)";
DefTensor[RLambdaP0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPSymb,xAct`HiGGS`Private`Spin0p]];
DefTensor[RLambdaP0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPSymb,xAct`HiGGS`Private`Spin0m]];
DefTensor[RLambdaP1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPSymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]}];
DefTensor[RLambdaP1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]}];
DefTensor[RLambdaP2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPSymb,xAct`HiGGS`Private`Spin2p],OrthogonalTo->{V[a],V[b]}];
DefTensor[RLambdaP2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPSymb,xAct`HiGGS`Private`Spin2m],OrthogonalTo->{V[a],V[b],V[c]}];
AutomaticRules[RLambdaP2m,MakeRule[{RLambdaP2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[RLambdaP2m,MakeRule[{epsilonG[a,b,c,d]RLambdaP2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[RLambdaP2p,MakeRule[{RLambdaP2p[a,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[TLambdaP2m,MakeRule[{TLambdaP2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[TLambdaP2m,MakeRule[{epsilonG[a,b,c,d]TLambdaP2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];
