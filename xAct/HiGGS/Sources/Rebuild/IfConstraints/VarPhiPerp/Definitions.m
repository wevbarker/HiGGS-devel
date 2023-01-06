(*===============*)
(*  Definitions  *)
(*===============*)

VarPhiPerpBSymb="\!\(\*SubsuperscriptBox[\(\[CurlyPhi]\), \(\[ScriptB]\), \(\[UpTee]\)]\)";
DefTensor[VarPhiPerpB0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[VarPhiPerpBSymb,xAct`HiGGS`Private`Spin0p]];
DefTensor[VarPhiPerpB1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[VarPhiPerpBSymb,xAct`HiGGS`Private`Spin1p]];
DefTensor[VarPhiPerpB1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[VarPhiPerpBSymb,xAct`HiGGS`Private`Spin1m]];
DefTensor[VarPhiPerpB2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[VarPhiPerpBSymb,xAct`HiGGS`Private`Spin2p]];

VarPhiPerpASymb="\!\(\*SubsuperscriptBox[\(\[CurlyPhi]\), \(\[ScriptA]\), \(\[UpTee]\)]\)";
DefTensor[VarPhiPerpA0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[VarPhiPerpASymb,xAct`HiGGS`Private`Spin0p]];
DefTensor[VarPhiPerpA0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[VarPhiPerpASymb,xAct`HiGGS`Private`Spin0m]];
DefTensor[VarPhiPerpA1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[VarPhiPerpASymb,xAct`HiGGS`Private`Spin1p]];
DefTensor[VarPhiPerpA1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[VarPhiPerpASymb,xAct`HiGGS`Private`Spin1m]];
DefTensor[VarPhiPerpA2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[VarPhiPerpASymb,xAct`HiGGS`Private`Spin2p]];
DefTensor[VarPhiPerpA2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[VarPhiPerpASymb,xAct`HiGGS`Private`Spin2m]];
AutomaticRules[VarPhiPerpA2m,MakeRule[{VarPhiPerpA2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[VarPhiPerpA2m,MakeRule[{epsilonG[a,b,c,d]VarPhiPerpA2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];
