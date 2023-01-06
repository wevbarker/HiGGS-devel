(*=================*)
(*  LambdaPiParaSO3  *)
(*=================*)

(*O(3) decomposition of the canonical parts of Riemann-Cartan multiplier*)
TLambdaPiPSymb="\!\(\*SubsuperscriptBox[\(\[CurlyPi]\), \(\[ScriptCapitalT]\), \(\[DoubleVerticalBar]\)]\)";
DefTensor[TLambdaPiP0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPiPSymb,xAct`HiGGS`Private`Spin0m]];
DefTensor[TLambdaPiP1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPiPSymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]}];
DefTensor[TLambdaPiP1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPiPSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]}];
DefTensor[TLambdaPiP2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPiPSymb,xAct`HiGGS`Private`Spin2m],OrthogonalTo->{V[a],V[b],V[c]}];
RLambdaPiPSymb="\!\(\*SubsuperscriptBox[\(\[CurlyPi]\), \(\[ScriptCapitalR]\), \(\[DoubleVerticalBar]\)]\)";
DefTensor[RLambdaPiP0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPiPSymb,xAct`HiGGS`Private`Spin0p]];
DefTensor[RLambdaPiP0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPiPSymb,xAct`HiGGS`Private`Spin0m]];
DefTensor[RLambdaPiP1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPiPSymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]}];
DefTensor[RLambdaPiP1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPiPSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]}];
DefTensor[RLambdaPiP2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPiPSymb,xAct`HiGGS`Private`Spin2p],OrthogonalTo->{V[a],V[b]}];
DefTensor[RLambdaPiP2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPiPSymb,xAct`HiGGS`Private`Spin2m],OrthogonalTo->{V[a],V[b],V[c]}];
AutomaticRules[RLambdaPiP2m,MakeRule[{RLambdaPiP2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[RLambdaPiP2m,MakeRule[{epsilonG[a,b,c,d]RLambdaPiP2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[RLambdaPiP2p,MakeRule[{RLambdaPiP2p[a,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[TLambdaPiP2m,MakeRule[{TLambdaPiP2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[TLambdaPiP2m,MakeRule[{epsilonG[a,b,c,d]TLambdaPiP2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];
