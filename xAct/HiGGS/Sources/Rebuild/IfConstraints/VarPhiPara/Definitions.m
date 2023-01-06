(*===============*)
(*  Definitions  *)
(*===============*)

VarPhiParaBSymb="\!\(\*SubsuperscriptBox[\(\[CurlyPhi]\), \(\[ScriptB]\), \(\[DoubleVerticalBar]\)]\)";
DefTensor[VarPhiParaB0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[VarPhiParaBSymb,xAct`HiGGS`Private`Spin0m]];
DefTensor[VarPhiParaB1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[VarPhiParaBSymb,xAct`HiGGS`Private`Spin1p]];
DefTensor[VarPhiParaB1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[VarPhiParaBSymb,xAct`HiGGS`Private`Spin1m]];
DefTensor[VarPhiParaB2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[VarPhiParaBSymb,xAct`HiGGS`Private`Spin2m]];

VarPhiParaASymb="\!\(\*SubsuperscriptBox[\(\[CurlyPhi]\), \(\[ScriptA]\), \(\[DoubleVerticalBar]\)]\)";
DefTensor[VarPhiParaA0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[VarPhiParaASymb,xAct`HiGGS`Private`Spin0p]];
DefTensor[VarPhiParaA0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[VarPhiParaASymb,xAct`HiGGS`Private`Spin0m]];
DefTensor[VarPhiParaA1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[VarPhiParaASymb,xAct`HiGGS`Private`Spin1p]];
DefTensor[VarPhiParaA1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[VarPhiParaASymb,xAct`HiGGS`Private`Spin1m]];
DefTensor[VarPhiParaA2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[VarPhiParaASymb,xAct`HiGGS`Private`Spin2p]];
DefTensor[VarPhiParaA2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[VarPhiParaASymb,xAct`HiGGS`Private`Spin2m]];
AutomaticRules[VarPhiParaA2m,MakeRule[{VarPhiParaA2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[VarPhiParaA2m,MakeRule[{epsilonG[a,b,c,d]VarPhiParaA2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];
