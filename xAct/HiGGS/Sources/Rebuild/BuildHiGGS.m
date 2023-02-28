(*==============*)
(*  BuildHiGGS  *)
(*==============*)

(*-------------------------------------------------------------------------------*)
(*  This file is a "fossilised notebook", I'm in the process of cleaning it up!  *)
(*-------------------------------------------------------------------------------*)

(*--------------------------------------------------------------------------------*)
(*  Cleaning progress banner: everything below this line is (implemented) legacy  *)
(*--------------------------------------------------------------------------------*)

xAct`HiGGS`Private`$PrintCellsBeforeBuildHiGGS=Flatten@Cells[SelectedNotebook[],CellStyle->{"Print"}];

xAct`HiGGS`Private`BuildRebuild@"DefManifold.m";

Begin["xAct`HiGGS`Private`"];
	SectorNames = {"B0p", "B1p", "B1m", "B2p", "A0p", "A0m", "A1p", "A1m", "A2p", "A2m"}; 
	ASectorNames = {"A0p", "A0m", "A1p", "A1m", "A2p", "A2m"}; 
	BSectorNames = {"B0p", "B0m", "B1p", "B1m", "B2p", "B2m"}; 
End[];

RSymb="\[ScriptCapitalR]";
DefTensor[R[a, b, -d, -e], M4, {Antisymmetric[{a, b}], Antisymmetric[{-d, -e}]},PrintAs->xAct`HiGGS`Private`SymbolBuild[RSymb]]; 
xAct`HiGGS`Private`DeclareOrder[R[a, b, -d, -e], 1]; 
TSymb="\[ScriptCapitalT]";
DefTensor[T[a, -b, -c], M4, Antisymmetric[{-b, -c}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TSymb]]; 
xAct`HiGGS`Private`DeclareOrder[T[a, -b, -c], 1]; 
WSymb="\[ScriptCapitalW]";
DefTensor[W[a, b, -d, -e], M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[WSymb]]; 
xAct`HiGGS`Private`DeclareOrder[W[a, b, -d, -e], 1]; 

xAct`HiGGS`Private`BuildRebuild@"GeometricMultipliers/Lambda/LambdaBasic.m";
xAct`HiGGS`Private`BuildRebuild@"GeometricMultipliers/LambdaPi/LambdaPiBasic.m";

DefTensor[R1[-i,-j,-m,-n], M4,StrongGenSet[{-i,-j,-m,-n},GenSet[Cycles[{-i,-j},{-m,-n}],Cycles[{-i,-m}],Cycles[{-j,-n}]]], PrintAs->xAct`HiGGS`Private`SymbolBuild[RSymb,xAct`HiGGS`Private`SO1]]; 
xAct`HiGGS`Private`DeclareOrder[R1[-i,-j,-m,-n], 1]; 
DefTensor[R2[-i,-j,-m,-n], M4,StrongGenSet[{-i,-j,-m,-n},GenSet[-Cycles[{-i,-m},{-j,-n}],-Cycles[{-i,-j}],-Cycles[{-m,-n}]]], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RSymb,xAct`HiGGS`Private`SO2]]; 
xAct`HiGGS`Private`DeclareOrder[R2[-i,-j,-m,-n], 1]; 
DefTensor[R3[-i,-j,-m,-n], M4,Antisymmetric[{-i,-j,-m,-n}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RSymb,xAct`HiGGS`Private`SO3]]; 
xAct`HiGGS`Private`DeclareOrder[R3[-i,-j,-m,-n], 1]; 
DefTensor[R4[-i,-j], M4,Symmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RSymb,xAct`HiGGS`Private`SO4]]; 
xAct`HiGGS`Private`DeclareOrder[R4[-i,-j], 1]; 
DefTensor[R5[-i,-j], M4,Antisymmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RSymb,xAct`HiGGS`Private`SO5]]; 
xAct`HiGGS`Private`DeclareOrder[R5[-i,-j], 1]; 
DefTensor[R6[], M4, PrintAs ->xAct`HiGGS`Private`SymbolBuild[RSymb,xAct`HiGGS`Private`SO6]]; 
xAct`HiGGS`Private`DeclareOrder[R6[], 1]; 
DefTensor[T1[-i,-j,-k], M4,Symmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[TSymb,xAct`HiGGS`Private`SO1]]; 
xAct`HiGGS`Private`DeclareOrder[T1[-i,-j,-k], 1]; 
DefTensor[T2[-i], M4, PrintAs -> xAct`HiGGS`Private`SymbolBuild[TSymb,xAct`HiGGS`Private`SO2]]; 
xAct`HiGGS`Private`DeclareOrder[T2[-i], 1]; 
DefTensor[T3[-i], M4, PrintAs ->xAct`HiGGS`Private`SymbolBuild[TSymb,xAct`HiGGS`Private`SO3]]; 
xAct`HiGGS`Private`DeclareOrder[T3[-i], 1]; 
AutomaticRules[R1,MakeRule[{R1[a,a1,b,-b],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[R1,MakeRule[{R1[a,b,a1,-b],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[R2,MakeRule[{R2[a,b,a1,-b],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[R4,MakeRule[{R4[a,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[T1,MakeRule[{T1[a,a1,-a1],0},MetricOn->All,ContractMetrics->True]];

AutomaticRules[T1,MakeRule[{T1[a,-a,-k],0},MetricOn->All,ContractMetrics->True]];

RDefinition=R3[-i,-j,-m,-n]+
(2/3)(2R1[-i,-j,-m,-n]+
R1[-i,-m,-j,-n])+
R2[-i,-j,-m,-n]+
(1/2)(G[-i,-m](R5[-j,-n]+R4[-j,-n])+
G[-j,-n](R5[-i,-m]+R4[-i,-m])-
G[-j,-m](R5[-i,-n]+R4[-i,-n])-
G[-i,-n](R5[-j,-m]+R4[-j,-m]))-
(1/12)(G[-i,-m]G[-j,-n]-G[-i,-n]G[-j,-m])R6[];

TDefinition=(2/3)(T1[-i,-j,-k]-T1[-i,-k,-j])+
(1/3)(G[-i,-j]T2[-k]-G[-i,-k]T2[-j])+
epsilonG[-i,-j,-k,-m]T3[m];

RSO13Activate=MakeRule[{R[-i,-j,-m,-n],Evaluate[RDefinition]},MetricOn->All,ContractMetrics->True];
TSO13Activate=MakeRule[{T[-i,-j,-k],Evaluate[TDefinition]},MetricOn->All,ContractMetrics->True];

StrengthSO13Activate=Join[RSO13Activate,TSO13Activate];
xAct`HiGGS`Private`ClearBuild[];


R4Activate=MakeRule[{R4[-i,-j],(1/2)(R[a,-i,-a,-j]+R[a,-j,-a,-i])-(1/4)G[-i,-j]R[a,b,-a,-b]},MetricOn->All,ContractMetrics->True];
R5Activate=MakeRule[{R5[-i,-j],(1/2)(R[a,-i,-a,-j]-R[a,-j,-a,-i])},MetricOn->All,ContractMetrics->True];
R6Activate=MakeRule[{R6[],-R[a,b,-a,-b]},MetricOn->All,ContractMetrics->True];
RActivate=Join[R4Activate,R5Activate,R6Activate];
xAct`HiGGS`Private`ClearBuild[];

(*============================*)
(*  To be removed to PSALTer  *)
(*============================*)

(* ::Input::Initialization:: *)
ASymb="\[ScriptCapitalA]";
DefTensor[A[a,c,-d],M4,Antisymmetric[{a,c}],PrintAs->xAct`HiGGS`Private`SymbolBuild[ASymb],Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[A[a,c,-d],1];
DefTensor[A1[-k,-i,-j], M4,Symmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[ASymb,xAct`HiGGS`Private`SO1]]; 
xAct`HiGGS`Private`DeclareOrder[A1[-k,-i,-j], 1]; 
DefTensor[A2[-i], M4, PrintAs -> xAct`HiGGS`Private`SymbolBuild[ASymb,xAct`HiGGS`Private`SO2]]; 
xAct`HiGGS`Private`DeclareOrder[A2[-i], 1]; 
DefTensor[A3[-i], M4, PrintAs ->xAct`HiGGS`Private`SymbolBuild[ASymb,xAct`HiGGS`Private`SO3]]; 
xAct`HiGGS`Private`DeclareOrder[A3[-i], 1]; 
AutomaticRules[A1,MakeRule[{A1[a,a1,-a1],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[A1,MakeRule[{A1[a,-a,-k],0},MetricOn->All,ContractMetrics->True]];

ADefinition=(2/3)(A1[-k,-i,-j]-A1[-j,-i,-k])+
(1/3)(G[-i,-j]A2[-k]-G[-i,-k]A2[-j])+
epsilonG[-i,-j,-k,-m]A3[m];

ASO13Activate=MakeRule[{A[-j,-k,-i],Evaluate[ADefinition]},MetricOn->All,ContractMetrics->True];


(* ::Input::Initialization:: *)
BSymb="\[ScriptB]";
FSymb="\[ScriptF]";
DefTensor[F[-i,-j],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[FSymb],Dagger->Complex];
DefTensor[F1[-i,-j], M4,Antisymmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[FSymb,xAct`HiGGS`Private`SO1]]; 
xAct`HiGGS`Private`DeclareOrder[F1[-i,-j], 1]; 
DefTensor[F2[-i,-j], M4,Symmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[FSymb,xAct`HiGGS`Private`SO2]]; 
xAct`HiGGS`Private`DeclareOrder[F2[-i,-j], 1]; 
DefTensor[F3[], M4, PrintAs ->xAct`HiGGS`Private`SymbolBuild[FSymb,xAct`HiGGS`Private`SO3]]; 
xAct`HiGGS`Private`DeclareOrder[F3[], 1]; 
AutomaticRules[F2,MakeRule[{F2[a1,-a1],0},MetricOn->All,ContractMetrics->True]];

FDefinition=F1[-i,-j]+F2[-i,-j]+(1/4)G[-i,-j]F3[];

FSO13Activate=MakeRule[{F[-i,-j],Evaluate[FDefinition]},MetricOn->All,ContractMetrics->True];

GaugeSO13Activate=Join[FSO13Activate,ASO13Activate];
xAct`HiGGS`Private`ClearBuild[];


SigmaSymb="\[Sigma]";
DefTensor[Sigma[-i,-j,-k],M4,Antisymmetric[{-j,-k}],PrintAs->xAct`HiGGS`Private`SymbolBuild[SigmaSymb],Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[Sigma[a,c,-d],1];
xAct`HiGGS`Private`ClearBuild[];


DefTensor[Sigma1[-i,-j,-k], M4,Symmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[SigmaSymb,xAct`HiGGS`Private`SO1]]; 
DefTensor[Sigma2[-i], M4, PrintAs -> xAct`HiGGS`Private`SymbolBuild[SigmaSymb,xAct`HiGGS`Private`SO2]];
DefTensor[Sigma3[-i], M4, PrintAs -> xAct`HiGGS`Private`SymbolBuild[SigmaSymb,xAct`HiGGS`Private`SO3]];

AutomaticRules[Sigma1,MakeRule[{Sigma1[a,a1,-a1],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[Sigma1,MakeRule[{Sigma1[a,-a,-a1],0},MetricOn->All,ContractMetrics->True]];

SigmaDefinition=(2/3)(Sigma1[-i,-j,-k]-Sigma1[-i,-k,-j])+
(1/3)(G[-i,-j]Sigma2[-k]-G[-i,-k]Sigma2[-j])+
epsilonG[-i,-j,-k,-m]Sigma3[m];


(* ::Input::Initialization:: *)
TauSymb="\[Tau](\[CapitalDelta]+\[ScriptCapitalK])";
DefTensor[Tau[-i,-j],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TauSymb],Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[Tau[-i,-j], 1]; 
xAct`HiGGS`Private`ClearBuild[];

xAct`HiGGS`Private`BuildRebuild@"GeometricMultipliers/Lambda/LambdaSO13.m";
xAct`HiGGS`Private`BuildRebuild@"GeometricMultipliers/LambdaPi/LambdaPiSO13.m";

(* ::Input::Initialization:: *)
DefTensor[Spin1[-i,-j,-k], M4,Symmetric[{-i,-j}], PrintAs -> "\!\(\*OverscriptBox[\(\[Sigma]\), \((1)\)]\)"]; 
xAct`HiGGS`Private`DeclareOrder[Spin1[-i,-j,-k], 1]; 
DefTensor[Spin2[-i], M4, PrintAs -> "\!\(\*OverscriptBox[\(\[Sigma]\), \((2)\)]\)"]; 
xAct`HiGGS`Private`DeclareOrder[Spin2[-i], 1]; 
DefTensor[Spin3[-i], M4, PrintAs -> "\!\(\*OverscriptBox[\(\[Sigma]\), \((3)\)]\)"]; 
xAct`HiGGS`Private`DeclareOrder[Spin3[-i], 1]; 
AutomaticRules[Spin1,MakeRule[{Spin1[a,a1,-a1],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[Spin1,MakeRule[{Spin1[a,-a,-a1],0},MetricOn->All,ContractMetrics->True]];

SpinDefinition=(2/3)(Spin1[-i,-j,-k]-Spin1[-i,-k,-j])+
(1/3)(G[-i,-j]Spin2[-k]-G[-i,-k]Spin2[-j])+
epsilonG[-i,-j,-k,-m]Spin3[m];

DefTensor[STensor[-i,-j,-k],M4,Antisymmetric[{-j,-k}],PrintAs->"\[Sigma]"];
xAct`HiGGS`Private`DeclareOrder[STensor[-i,-j,-k],1];

SpinSO13Activate=MakeRule[{STensor[-i,-j,-k],Evaluate[SpinDefinition]},MetricOn->All,ContractMetrics->True];

(*==========================*)
(*  End of PSALTer removal  *)
(*==========================*)

(* ::Input::Initialization:: *)
PpRSymb="\!\(\*SubscriptBox[OverscriptBox[\(\[ScriptCapitalP]\), \(^\)], \(\[ScriptCapitalR]\)]\)";
DefTensor[PR1[-a,-b,-c,-d,e,f,g,h],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PpRSymb,xAct`HiGGS`Private`SO1]];
DefTensor[PR2[-a,-b,-c,-d,e,f,g,h],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PpRSymb,xAct`HiGGS`Private`SO2]];
DefTensor[PR3[-i,-k,-l,-m,a,b,c,d],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PpRSymb,xAct`HiGGS`Private`SO3]];
DefTensor[PR4[-i,-k,-l,-m,a,b,c,d],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PpRSymb,xAct`HiGGS`Private`SO4]];
DefTensor[PR5[-i,-k,-l,-m,a,b,c,d],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PpRSymb,xAct`HiGGS`Private`SO5]];
DefTensor[PR6[-i,-k,-l,-m,a,b,c,d],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PpRSymb,xAct`HiGGS`Private`SO6]];

ToCanonicalTotal[x_]:=ToCanonical[Total[x]];
ToCanonicalParallel[x_]:=Module[{Monomials,Ret},
Monomials=MonomialList[x];
Ret=Total[ParallelCombine[ToCanonicalTotal,Monomials,List]];
Ret];

AutomaticRules[PR1,MakeRule[{CD[-x][PR1[-a,-b,-c,-d,e,f,g,h]],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[PR2,MakeRule[{CD[-x][PR2[-a,-b,-c,-d,e,f,g,h]],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[PR3,MakeRule[{CD[-x][PR3[-a,-b,-c,-d,e,f,g,h]],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[PR4,MakeRule[{CD[-x][PR4[-a,-b,-c,-d,e,f,g,h]],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[PR5,MakeRule[{CD[-x][PR5[-a,-b,-c,-d,e,f,g,h]],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[PR6,MakeRule[{CD[-x][PR6[-a,-b,-c,-d,e,f,g,h]],0},MetricOn->All,ContractMetrics->True]];
PWSymb="\!\(\*SubscriptBox[\(\[ScriptCapitalP]\), \(\[ScriptCapitalW]\)]\)";
DefTensor[PW[-i,-k,-l,-m,a,b,c,d],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PWSymb]];
PpTSymb="\!\(\*SubscriptBox[OverscriptBox[\(\[ScriptCapitalP]\), \(^\)], \(\[ScriptCapitalT]\)]\)";
DefTensor[PT1[-a,-b,-c,e,f,g],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PpTSymb,xAct`HiGGS`Private`SO1]];
DefTensor[PT2[-a,-b,-c,e,f,g],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PpTSymb,xAct`HiGGS`Private`SO2]];
DefTensor[PT3[-a,-b,-c,e,f,g],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PpTSymb,xAct`HiGGS`Private`SO3]];
AutomaticRules[PT1,MakeRule[{CD[-x][PT1[-a,-b,-c,e,f,g]],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[PT2,MakeRule[{CD[-x][PT2[-a,-b,-c,e,f,g]],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[PT3,MakeRule[{CD[-x][PT3[-a,-b,-c,e,f,g]],0},MetricOn->All,ContractMetrics->True]];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
xAct`HiGGS`Private`IfBuild["O13Projections",
PWActivate=MakeRule[{PW[-i,-k,-l,-m,a,b,c,d],G[a,-i]G[b,-k]G[c,-l]G[d,-m]+(1/2)(G[b,d]G[a,-i]G[c,-m]G[-k,-l]-G[b,d]G[a,-i]G[c,-l]G[-k,-m]+G[b,d]G[a,-k]G[c,-l]G[-i,-m]-G[b,d]G[a,-k]G[c,-m]G[-i,-l])+(1/6)G[a,c]G[b,d](G[-i,-l]G[-k,-m]-G[-i,-m]G[-k,-l])},MetricOn->All,ContractMetrics->True];

PR1Definition=Antisymmetrize[Antisymmetrize[Antisymmetrize[Antisymmetrize[(2/3)G[s,-i]G[r,-n](2G[p,-j]G[q,-m]+G[p,-m]G[q,-j])(1/2)(Symmetrize[PW[-s,-p,-q,-r,a,b,c,d]+PW[-s,-r,-q,-p,a,b,c,d],{-s,-q}]),{-i,-j}],{-m,-n}],{a,b}],{c,d}]/.PWActivate//ToCanonical;
PR1Activate=MakeRule[{PR1[-i,-j,-m,-n,a,b,c,d],Evaluate[PR1Definition]},MetricOn->All,ContractMetrics->True];

PR2Definition=Antisymmetrize[Antisymmetrize[Antisymmetrize[Antisymmetrize[(1/2)(PW[-i,-j,-m,-n,a,b,c,d]-PW[-m,-n,-i,-j,a,b,c,d]),{-i,-j}],{-m,-n}],{a,b}],{c,d}]/.PWActivate//ToCanonical;
PR2Activate=MakeRule[{PR2[-i,-j,-m,-n,a,b,c,d],Evaluate[PR2Definition]},MetricOn->All,ContractMetrics->True];

PR3Definition=Antisymmetrize[Antisymmetrize[Antisymmetrize[Antisymmetrize[(-1/4)(1/6)epsilonG[-i,-j,-m,-n]epsilonG[a,b,c,d],{-i,-j}],{-m,-n}],{a,b}],{c,d}]//ToCanonical;
PR3Activate=MakeRule[{PR3[-i,-j,-m,-n,a,b,c,d],Evaluate[PR3Definition]},MetricOn->All,ContractMetrics->True];

PR4Definition=Antisymmetrize[Antisymmetrize[Antisymmetrize[Antisymmetrize[(1/2)(G[-i,-m]G[x,-j]G[y,-n]+G[-j,-n]G[x,-i]G[y,-m]-G[-j,-m]G[x,-i]G[y,-n]-G[-i,-n]G[x,-j]G[y,-m])(Symmetrize[G[-x,a]G[-y,c]G[b,d],{-x,-y}]-(1/4)G[-x,-y]G[b,d]G[a,c]),{-i,-j}],{-m,-n}],{a,b}],{c,d}]//ToCanonical;
PR4Activate=MakeRule[{PR4[-i,-j,-m,-n,a,b,c,d],Evaluate[PR4Definition]},MetricOn->All,ContractMetrics->True];

PR5Definition=Antisymmetrize[Antisymmetrize[Antisymmetrize[Antisymmetrize[(1/2)(G[-i,-m]G[x,-j]G[y,-n]+G[-j,-n]G[x,-i]G[y,-m]-G[-j,-m]G[x,-i]G[y,-n]-G[-i,-n]G[x,-j]G[y,-m])Antisymmetrize[G[-x,a]G[-y,c]G[b,d],{-x,-y}],{-i,-j}],{-m,-n}],{a,b}],{c,d}]//ToCanonical;
PR5Activate=MakeRule[{PR5[-i,-j,-m,-n,a,b,c,d],Evaluate[PR5Definition]},MetricOn->All,ContractMetrics->True];

PR6Definition=Antisymmetrize[Antisymmetrize[Antisymmetrize[Antisymmetrize[-(1/6)G[b,d]G[a,c](G[-i,-j]G[-m,-n]-G[-i,-m]G[-j,-n]),{-i,-j}],{-m,-n}],{a,b}],{c,d}]//ToCanonical;
PR6Activate=MakeRule[{PR6[-i,-j,-m,-n,a,b,c,d],Evaluate[PR6Definition]},MetricOn->All,ContractMetrics->True];

PT1Definition=Antisymmetrize[Antisymmetrize[(4/3)(Symmetrize[G[-i,a]G[-j,b]G[-k,c]+(1/3)G[-k,-i]G[a,b]G[c,-j],{-i,-j}]-(1/3)G[-i,-j]G[a,b]G[c,-k]),{-j,-k}],{b,c}]//ToCanonical;
PT1Activate=MakeRule[{PT1[-i,-j,-k,a,b,c],Evaluate[PT1Definition]},MetricOn->All,ContractMetrics->True];

PT2Definition=Antisymmetrize[Antisymmetrize[(2/3)G[-i,-j]G[a,b]G[c,-k],{-j,-k}],{b,c}]//ToCanonical;
PT2Activate=MakeRule[{PT2[-i,-j,-k,a,b,c],Evaluate[PT2Definition]},MetricOn->All,ContractMetrics->True];

PT3Definition=Antisymmetrize[Antisymmetrize[(1/6)epsilonG[-i,-j,-k,-m]epsilonG[m,a,b,c],{-j,-k}],{b,c}]//ToCanonical;
PT3Activate=MakeRule[{PT3[-i,-j,-k,a,b,c],Evaluate[PT3Definition]},MetricOn->All,ContractMetrics->True];

PActivate=Join[PWActivate,PR1Activate,PR2Activate,PR3Activate,PR4Activate,PR5Activate,PR6Activate,PT1Activate,PT2Activate,PT3Activate];

DumpSave[xAct`HiGGS`Private`BinaryLocation["O13Projections"],{PActivate}];
xAct`HiGGS`Private`ClearBuild[];
];


(* ::Input::Initialization:: *)
OpenLastCache[];


(* ::Input::Initialization:: *)
xAct`HiGGS`Private`IfBuild["CheckOrthogonality",
xAct`HiGGS`Private`HiGGSPrint[BinariesToRebuild];
xAct`HiGGS`Private`HiGGSPrint[Style["checking orthogonality",Blue,16]];
For[ii=1,ii<7,ii++,For[jj=1,jj<7,jj++,If[ii!=jj,xAct`HiGGS`Private`HiGGSPrint[ToExpression["PR"<>ToString[ii]<>"[-i,-k,-l,-m,a,b,c,d]PR"<>ToString[jj]<>"[-a,-b,-c,-d,e,f,g,h]R[-e,-f,-g,-h]"]/.PActivate//ToCanonical]]]];
For[ii=1,ii<4,ii++,For[jj=1,jj<4,jj++,If[ii!=jj,xAct`HiGGS`Private`HiGGSPrint[ToExpression["PT"<>ToString[ii]<>"[-i,-j,-k,a,b,c]PT"<>ToString[jj]<>"[-a,-b,-c,e,f,g]T[-e,-f,-g]"]/.PActivate//ToCanonical]]]];

xAct`HiGGS`Private`HiGGSPrint[Style["checking inverse orthogonality",Blue,16]];

For[ii=1,ii<7,ii++,For[jj=1,jj<7,jj++,If[ii!=jj,xAct`HiGGS`Private`HiGGSPrint[ToExpression["PR"<>ToString[ii]<>"[a,b,c,d,i,j,k,l]R[-i,-j,-k,-l]PR"<>ToString[jj]<>"[-a,-b,-c,-d,e,f,g,h]R[-e,-f,-g,-h]"]/.PActivate//ToCanonical]]]]
For[ii=1,ii<4,ii++,For[jj=1,jj<4,jj++,If[ii!=jj,xAct`HiGGS`Private`HiGGSPrint[ToExpression["PT"<>ToString[ii]<>"[a,b,c,i,j,k]T[-i,-j,-k]PT"<>ToString[jj]<>"[-a,-b,-c,e,f,g]T[-e,-f,-g]"]/.PActivate//ToCanonical]]]];

xAct`HiGGS`Private`HiGGSPrint[Style["checking idempotency",Blue,16]];

For[ii=1,ii<7,ii++,xAct`HiGGS`Private`HiGGSPrint[ToExpression["(PR"<>ToString[ii]<>"[-i,-k,-l,-m,a,b,c,d]PR"<>ToString[ii]<>"[-a,-b,-c,-d,e,f,g,h]-PR"<>ToString[ii]<>"[-i,-k,-l,-m,e,f,g,h])R[-e,-f,-g,-h]"]/.PActivate//ToCanonical//FullSimplify]]
For[ii=1,ii<4,ii++,xAct`HiGGS`Private`HiGGSPrint[ToExpression["(PT"<>ToString[ii]<>"[-i,-j,-k,a,b,c]PT"<>ToString[ii]<>"[-a,-b,-c,e,f,g]-PT"<>ToString[ii]<>"[-i,-j,-k,e,f,g])T[-e,-f,-g]"]/.PActivate//ToCanonical//FullSimplify]];

xAct`HiGGS`Private`HiGGSPrint[Style["checking completeness",Blue,16]];

(PR1[-i,-k,-l,-m,a,b,c,d]+PR2[-i,-k,-l,-m,a,b,c,d]+PR3[-i,-k,-l,-m,a,b,c,d]+PR4[-i,-k,-l,-m,a,b,c,d]+PR5[-i,-k,-l,-m,a,b,c,d]+PR6[-i,-k,-l,-m,a,b,c,d])R[-a,-b,-c,-d]/.PActivate//ToCanonical//Simplify
(PT1[-i,-k,-l,a,b,c]+PT2[-i,-k,-l,a,b,c]+PT3[-i,-k,-l,a,b,c])T[-a,-b,-c]/.PActivate//ToCanonical//Simplify;

xAct`HiGGS`Private`HiGGSPrint[Style["checking invertability",Blue,16]];

For[ii=1,ii<7,ii++,xAct`HiGGS`Private`HiGGSPrint[ToExpression["(PR"<>ToString[ii]<>"[e,f,g,h,-i,-k,-l,-m]-PR"<>ToString[ii]<>"[-i,-k,-l,-m,e,f,g,h])R[-e,-f,-g,-h]"]/.PActivate//ToCanonical//FullSimplify]];
xAct`HiGGS`Private`ClearBuild[];
];


(* ::Input::Initialization:: *)
(*Define the Ricci \mathcal{R}^a_{\ b}*)
DefTensor[Rc[a,-b],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[RSymb]];
xAct`HiGGS`Private`DeclareOrder[Rc[a,-b],1];
(*Define the Ricci scalar \mathcal{R}*)
DefTensor[Rs[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[RSymb]];
xAct`HiGGS`Private`DeclareOrder[Rs[],1];
(*Define the torsion contraction \mathcal{T}^a*)
DefTensor[Tc[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TSymb]];
xAct`HiGGS`Private`DeclareOrder[Tc[-a],1];
(*Rule to expand Ricci*)
ExpandRicci=MakeRule[{Rc[a,-b],R[c,a,-c,-b]},MetricOn->All,ContractMetrics->True];
(*Rule to expand Ricci scalar*)
ExpandRicciScalar=MakeRule[{Rs[],R[c,d,-c,-d]},MetricOn->All,ContractMetrics->True];
(*Rule to expand torsion contraction*)
TorsionExpandContraction=MakeRule[{Tc[-a],T[b,-a,-b]},MetricOn->All,ContractMetrics->True];
(*Total rule to expand contracted field-strength tensors*)
ExpandContractedStrengths=Join[ExpandRicci,ExpandRicciScalar,TorsionExpandContraction];

(*Rule to expand Ricci*)
ContractRicci=MakeRule[{R[c,a,-c,-b],Rc[a,-b]},MetricOn->All,ContractMetrics->True];
(*Rule to expand Ricci scalar*)
ContractRicciScalar=MakeRule[{R[c,d,-c,-d],Rs[]},MetricOn->All,ContractMetrics->True];
(*Rule to expand torsion contraction*)
TorsionContractContraction=MakeRule[{T[b,-a,-b],Tc[-a]},MetricOn->All,ContractMetrics->True];
(*Total rule to expand contracted field-strength tensors*)
ContractExpandedStrengths=Join[ContractRicci,ContractRicciScalar,TorsionContractContraction];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
xAct`HiGGS`Private`IfBuild["ShowIrreps",
(*Irreducible decompositions*)
AutomaticRules[R,MakeRule[{R[c,a,-c,-b],Rc[a,-b]},MetricOn->All,ContractMetrics->True]];
AutomaticRules[Rc,MakeRule[{Rc[c,-c],Rs[]},MetricOn->All,ContractMetrics->True]];
AutomaticRules[T,MakeRule[{T[c,-a,-c],Tc[-a]},MetricOn->All,ContractMetrics->True]];
PR1[-i,-j,-k,-l,a,b,c,d]R[-a,-b,-c,-d]/.PActivate//ToCanonical//ContractMetric;
xAct`HiGGS`Private`HiGGSPrint[%];
PR2[-i,-j,-k,-l,a,b,c,d]R[-a,-b,-c,-d]/.PActivate//ToCanonical//ContractMetric;
xAct`HiGGS`Private`HiGGSPrint[%];
PR3[-i,-j,-k,-l,a,b,c,d]R[-a,-b,-c,-d]/.PActivate//ToCanonical//ContractMetric;
xAct`HiGGS`Private`HiGGSPrint[%];
PR4[-i,-j,-k,-l,a,b,c,d]R[-a,-b,-c,-d]/.PActivate//ToCanonical//ContractMetric;
xAct`HiGGS`Private`HiGGSPrint[%];
PR5[-i,-j,-k,-l,a,b,c,d]R[-a,-b,-c,-d]/.PActivate//ToCanonical//ContractMetric;
xAct`HiGGS`Private`HiGGSPrint[%];
PR6[-i,-j,-k,-l,a,b,c,d]R[-a,-b,-c,-d]/.PActivate//ToCanonical//ContractMetric;
xAct`HiGGS`Private`HiGGSPrint[%];
PT1[-i,-j,-k,a,b,c]T[-a,-b,-c]/.PActivate//ToCanonical//ContractMetric;
xAct`HiGGS`Private`HiGGSPrint[%];
PT2[-i,-j,-k,a,b,c]T[-a,-b,-c]/.PActivate//ToCanonical//ContractMetric;
xAct`HiGGS`Private`HiGGSPrint[%];
PT3[-i,-j,-k,a,b,c]T[-a,-b,-c]/.PActivate//ToCanonical//ContractMetric;
xAct`HiGGS`Private`HiGGSPrint[%];

tmp=PR1[-i,-j,-k,-l,a,b,c,d]R[-a,-b,-c,-d]/.PActivate/.StrengthSO13Activate//ToNewCanonical;
xAct`HiGGS`Private`HiGGSPrint[tmp];
tmp=PR2[-i,-j,-k,-l,a,b,c,d]R[-a,-b,-c,-d]/.PActivate/.StrengthSO13Activate//ToNewCanonical;
xAct`HiGGS`Private`HiGGSPrint[tmp];
tmp=PR3[-i,-j,-k,-l,a,b,c,d]R[-a,-b,-c,-d]/.PActivate/.StrengthSO13Activate//ToNewCanonical;
xAct`HiGGS`Private`HiGGSPrint[tmp];
tmp=PR4[-i,-j,-k,-l,a,b,c,d]R[-a,-b,-c,-d]/.PActivate/.StrengthSO13Activate//ToNewCanonical;
xAct`HiGGS`Private`HiGGSPrint[tmp];
tmp=PR5[-i,-j,-k,-l,a,b,c,d]R[-a,-b,-c,-d]/.PActivate/.StrengthSO13Activate//ToNewCanonical;
xAct`HiGGS`Private`HiGGSPrint[tmp];
tmp=PR6[-i,-j,-k,-l,a,b,c,d]R[-a,-b,-c,-d]/.PActivate/.StrengthSO13Activate//ToNewCanonical;
xAct`HiGGS`Private`HiGGSPrint[tmp];
tmp=PT1[-i,-j,-k,a,b,c]T[-a,-b,-c]/.PActivate/.StrengthSO13Activate//ToNewCanonical;
xAct`HiGGS`Private`HiGGSPrint[tmp];
tmp=PT2[-i,-j,-k,a,b,c]T[-a,-b,-c]/.PActivate/.StrengthSO13Activate//ToNewCanonical;
xAct`HiGGS`Private`HiGGSPrint[tmp];
tmp=PT3[-i,-j,-k,a,b,c]T[-a,-b,-c]/.PActivate/.StrengthSO13Activate//ToNewCanonical;
xAct`HiGGS`Private`HiGGSPrint[tmp];

];


(* ::Input::Initialization:: *)
(*My couplings for irrep Lorentz constraints*)
cAlpSymb="\!\(\*OverscriptBox[\(\[Alpha]\), \(_\)]\)";
DefConstantSymbol[cAlp1,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpSymb,xAct`HiGGS`Private`dSO1,"Constant"->True]];
DefConstantSymbol[cAlp2,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpSymb,xAct`HiGGS`Private`dSO2,"Constant"->True]];
DefConstantSymbol[cAlp3,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpSymb,xAct`HiGGS`Private`dSO3,"Constant"->True]];
DefConstantSymbol[cAlp4,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpSymb,xAct`HiGGS`Private`dSO4,"Constant"->True]];
DefConstantSymbol[cAlp5,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpSymb,xAct`HiGGS`Private`dSO5,"Constant"->True]];
DefConstantSymbol[cAlp6,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpSymb,xAct`HiGGS`Private`dSO6,"Constant"->True]];

cAlp={cAlp1,cAlp2,cAlp3,cAlp4,cAlp5,cAlp6};

(*My couplings for irrep Lorentz constraints*)
gAlpSymb="\!\(\*OverscriptBox[\(\[Alpha]\), \('\)]\)";
DefConstantSymbol[gAlp1,PrintAs->xAct`HiGGS`Private`SymbolBuild[gAlpSymb,xAct`HiGGS`Private`dSO1,"Constant"->True]];
DefConstantSymbol[gAlp2,PrintAs->xAct`HiGGS`Private`SymbolBuild[gAlpSymb,xAct`HiGGS`Private`dSO2,"Constant"->True]];
DefConstantSymbol[gAlp3,PrintAs->xAct`HiGGS`Private`SymbolBuild[gAlpSymb,xAct`HiGGS`Private`dSO3,"Constant"->True]];
DefConstantSymbol[gAlp4,PrintAs->xAct`HiGGS`Private`SymbolBuild[gAlpSymb,xAct`HiGGS`Private`dSO4,"Constant"->True]];
DefConstantSymbol[gAlp5,PrintAs->xAct`HiGGS`Private`SymbolBuild[gAlpSymb,xAct`HiGGS`Private`dSO5,"Constant"->True]];
DefConstantSymbol[gAlp6,PrintAs->xAct`HiGGS`Private`SymbolBuild[gAlpSymb,xAct`HiGGS`Private`dSO6,"Constant"->True]];

gAlp={gAlp1,gAlp2,gAlp3,gAlp4,gAlp5,gAlp6};

cAlpParaParaSymb="\!\(\*SuperscriptBox[OverscriptBox[\(\[Alpha]\), \(_\)], \(\(\[DoubleVerticalBar]\)\(\[DoubleVerticalBar]\)\)]\)";
DefConstantSymbol[cAlpParaPara0p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpParaParaSymb,xAct`HiGGS`Private`dSO1,"Constant"->True]];
DefConstantSymbol[cAlpParaPara0m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpParaParaSymb,xAct`HiGGS`Private`dSO2,"Constant"->True]];
DefConstantSymbol[cAlpParaPara1p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpParaParaSymb,xAct`HiGGS`Private`dSO3,"Constant"->True]];
DefConstantSymbol[cAlpParaPara1m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpParaParaSymb,xAct`HiGGS`Private`dSO4,"Constant"->True]];
DefConstantSymbol[cAlpParaPara2p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpParaParaSymb,xAct`HiGGS`Private`dSO5,"Constant"->True]];
DefConstantSymbol[cAlpParaPara2m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpParaParaSymb,xAct`HiGGS`Private`dSO6,"Constant"->True]];

cAlpParaPara={cAlpParaPara0p,cAlpParaPara0m,cAlpParaPara1p,cAlpParaPara1m,cAlpParaPara2p,cAlpParaPara2m};

cAlpPerpPerpSymb="\!\(\*SuperscriptBox[OverscriptBox[\(\[Alpha]\), \(_\)], \(\(\[UpTee]\)\(\[UpTee]\)\)]\)";
DefConstantSymbol[cAlpPerpPerp0p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpPerpPerpSymb,xAct`HiGGS`Private`dSO1,"Constant"->True]];
DefConstantSymbol[cAlpPerpPerp0m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpPerpPerpSymb,xAct`HiGGS`Private`dSO2,"Constant"->True]];
DefConstantSymbol[cAlpPerpPerp1p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpPerpPerpSymb,xAct`HiGGS`Private`dSO3,"Constant"->True]];
DefConstantSymbol[cAlpPerpPerp1m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpPerpPerpSymb,xAct`HiGGS`Private`dSO4,"Constant"->True]];
DefConstantSymbol[cAlpPerpPerp2p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpPerpPerpSymb,xAct`HiGGS`Private`dSO5,"Constant"->True]];
DefConstantSymbol[cAlpPerpPerp2m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpPerpPerpSymb,xAct`HiGGS`Private`dSO6,"Constant"->True]];

cAlpPerpPerp={cAlpPerpPerp0p,cAlpPerpPerp0m,cAlpPerpPerp1p,cAlpPerpPerp1m,cAlpPerpPerp2p,cAlpPerpPerp2m};

cAlpPerpParaSymb="\!\(\*SuperscriptBox[OverscriptBox[\(\[Alpha]\), \(_\)], \(\(\[UpTee]\)\(\[DoubleVerticalBar]\)\)]\)";
DefConstantSymbol[cAlpPerpPara0p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpPerpParaSymb,xAct`HiGGS`Private`dSO1,"Constant"->True]];
DefConstantSymbol[cAlpPerpPara0m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpPerpParaSymb,xAct`HiGGS`Private`dSO2,"Constant"->True]];
DefConstantSymbol[cAlpPerpPara1p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpPerpParaSymb,xAct`HiGGS`Private`dSO3,"Constant"->True]];
DefConstantSymbol[cAlpPerpPara1m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpPerpParaSymb,xAct`HiGGS`Private`dSO4,"Constant"->True]];
DefConstantSymbol[cAlpPerpPara2p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpPerpParaSymb,xAct`HiGGS`Private`dSO5,"Constant"->True]];
DefConstantSymbol[cAlpPerpPara2m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpPerpParaSymb,xAct`HiGGS`Private`dSO6,"Constant"->True]];

cAlpPerpPara={cAlpPerpPara0p,cAlpPerpPara0m,cAlpPerpPara1p,cAlpPerpPara1m,cAlpPerpPara2p,cAlpPerpPara2m};

cAlpParaPerpSymb="\!\(\*SuperscriptBox[OverscriptBox[\(\[Alpha]\), \(_\)], \(\(\[DoubleVerticalBar]\)\(\[UpTee]\)\)]\)";
DefConstantSymbol[cAlpParaPerp0p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpParaPerpSymb,xAct`HiGGS`Private`dSO1,"Constant"->True]];
DefConstantSymbol[cAlpParaPerp0m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpParaPerpSymb,xAct`HiGGS`Private`dSO2,"Constant"->True]];
DefConstantSymbol[cAlpParaPerp1p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpParaPerpSymb,xAct`HiGGS`Private`dSO3,"Constant"->True]];
DefConstantSymbol[cAlpParaPerp1m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpParaPerpSymb,xAct`HiGGS`Private`dSO4,"Constant"->True]];
DefConstantSymbol[cAlpParaPerp2p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpParaPerpSymb,xAct`HiGGS`Private`dSO5,"Constant"->True]];
DefConstantSymbol[cAlpParaPerp2m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cAlpParaPerpSymb,xAct`HiGGS`Private`dSO6,"Constant"->True]];

cAlpParaPerp={cAlpParaPerp0p,cAlpParaPerp0m,cAlpParaPerp1p,cAlpParaPerp1m,cAlpParaPerp2p,cAlpParaPerp2m};

cBetSymb="\!\(\*SuperscriptBox[SubscriptBox[\(\[ScriptCapitalM]\), \(Pl\)], \(2\)]\)\!\(\*OverscriptBox[\(\[Beta]\), \(_\)]\)";
DefConstantSymbol[cBet1,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetSymb,xAct`HiGGS`Private`dSO1,"Constant"->True]];
DefConstantSymbol[cBet2,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetSymb,xAct`HiGGS`Private`dSO2,"Constant"->True]];
DefConstantSymbol[cBet3,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetSymb,xAct`HiGGS`Private`dSO3,"Constant"->True]];
DefConstantSymbol[cBet4,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetSymb,xAct`HiGGS`Private`dSO4,"Constant"->True]];
DefConstantSymbol[cBet5,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetSymb,xAct`HiGGS`Private`dSO5,"Constant"->True]];
DefConstantSymbol[cBet6,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetSymb,xAct`HiGGS`Private`dSO6,"Constant"->True]];

cBet={cBet1,cBet2,cBet3};

gBetSymb="\!\(\*SuperscriptBox[SubscriptBox[\(\[ScriptCapitalM]\), \(Pl\)], \(2\)]\)\!\(\*OverscriptBox[\(\[Beta]\), \('\)]\)";
DefConstantSymbol[gBet1,PrintAs->xAct`HiGGS`Private`SymbolBuild[gBetSymb,xAct`HiGGS`Private`dSO1,"Constant"->True]];
DefConstantSymbol[gBet2,PrintAs->xAct`HiGGS`Private`SymbolBuild[gBetSymb,xAct`HiGGS`Private`dSO2,"Constant"->True]];
DefConstantSymbol[gBet3,PrintAs->xAct`HiGGS`Private`SymbolBuild[gBetSymb,xAct`HiGGS`Private`dSO3,"Constant"->True]];
DefConstantSymbol[gBet4,PrintAs->xAct`HiGGS`Private`SymbolBuild[gBetSymb,xAct`HiGGS`Private`dSO4,"Constant"->True]];
DefConstantSymbol[gBet5,PrintAs->xAct`HiGGS`Private`SymbolBuild[gBetSymb,xAct`HiGGS`Private`dSO5,"Constant"->True]];
DefConstantSymbol[gBet6,PrintAs->xAct`HiGGS`Private`SymbolBuild[gBetSymb,xAct`HiGGS`Private`dSO6,"Constant"->True]];

gBet={gBet1,gBet2,gBet3};

cBetParaPara="\!\(\*SuperscriptBox[OverscriptBox[\(\[Beta]\), \(_\)], \(\(\[DoubleVerticalBar]\)\(\[DoubleVerticalBar]\)\)]\)";
DefConstantSymbol[cBetParaPara0p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetParaPara,xAct`HiGGS`Private`dSO1,"Constant"->True]];
DefConstantSymbol[cBetParaPara0m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetParaPara,xAct`HiGGS`Private`dSO2,"Constant"->True]];
DefConstantSymbol[cBetParaPara1p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetParaPara,xAct`HiGGS`Private`dSO3,"Constant"->True]];
DefConstantSymbol[cBetParaPara1m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetParaPara,xAct`HiGGS`Private`dSO4,"Constant"->True]];
DefConstantSymbol[cBetParaPara2p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetParaPara,xAct`HiGGS`Private`dSO5,"Constant"->True]];
DefConstantSymbol[cBetParaPara2m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetParaPara,xAct`HiGGS`Private`dSO6,"Constant"->True]];

cBetParaPara={cBetParaPara0p,cBetParaPara0m,cBetParaPara1p,cBetParaPara1m,cBetParaPara2p,cBetParaPara2m};

cBetPerpPerp="\!\(\*SuperscriptBox[OverscriptBox[\(\[Beta]\), \(_\)], \(\(\[UpTee]\)\(\[UpTee]\)\)]\)";
DefConstantSymbol[cBetPerpPerp0p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetPerpPerp,xAct`HiGGS`Private`dSO1,"Constant"->True]];
DefConstantSymbol[cBetPerpPerp0m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetPerpPerp,xAct`HiGGS`Private`dSO2,"Constant"->True]];
DefConstantSymbol[cBetPerpPerp1p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetPerpPerp,xAct`HiGGS`Private`dSO3,"Constant"->True]];
DefConstantSymbol[cBetPerpPerp1m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetPerpPerp,xAct`HiGGS`Private`dSO4,"Constant"->True]];
DefConstantSymbol[cBetPerpPerp2p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetPerpPerp,xAct`HiGGS`Private`dSO5,"Constant"->True]];
DefConstantSymbol[cBetPerpPerp2m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetPerpPerp,xAct`HiGGS`Private`dSO6,"Constant"->True]];

cBetPerpPerp={cBetPerpPerp0p,cBetPerpPerp0m,cBetPerpPerp1p,cBetPerpPerp1m,cBetPerpPerp2p,cBetPerpPerp2m};

cBetPerpPara="\!\(\*SuperscriptBox[OverscriptBox[\(\[Beta]\), \(_\)], \(\(\[UpTee]\)\(\[DoubleVerticalBar]\)\)]\)";
DefConstantSymbol[cBetPerpPara0p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetPerpPara,xAct`HiGGS`Private`dSO1,"Constant"->True]];
DefConstantSymbol[cBetPerpPara0m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetPerpPara,xAct`HiGGS`Private`dSO2,"Constant"->True]];
DefConstantSymbol[cBetPerpPara1p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetPerpPara,xAct`HiGGS`Private`dSO3,"Constant"->True]];
DefConstantSymbol[cBetPerpPara1m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetPerpPara,xAct`HiGGS`Private`dSO4,"Constant"->True]];
DefConstantSymbol[cBetPerpPara2p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetPerpPara,xAct`HiGGS`Private`dSO5,"Constant"->True]];
DefConstantSymbol[cBetPerpPara2m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetPerpPara,xAct`HiGGS`Private`dSO6,"Constant"->True]];

cBetPerpPara={cBetPerpPara0p,cBetPerpPara0m,cBetPerpPara1p,cBetPerpPara1m,cBetPerpPara2p,cBetPerpPara2m};

cBetParaPerp="\!\(\*SuperscriptBox[OverscriptBox[\(\[Beta]\), \(_\)], \(\(\[DoubleVerticalBar]\)\(\[UpTee]\)\)]\)";
DefConstantSymbol[cBetParaPerp0p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetParaPerp,xAct`HiGGS`Private`dSO1,"Constant"->True]];
DefConstantSymbol[cBetParaPerp0m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetParaPerp,xAct`HiGGS`Private`dSO2,"Constant"->True]];
DefConstantSymbol[cBetParaPerp1p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetParaPerp,xAct`HiGGS`Private`dSO3,"Constant"->True]];
DefConstantSymbol[cBetParaPerp1m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetParaPerp,xAct`HiGGS`Private`dSO4,"Constant"->True]];
DefConstantSymbol[cBetParaPerp2p,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetParaPerp,xAct`HiGGS`Private`dSO5,"Constant"->True]];
DefConstantSymbol[cBetParaPerp2m,PrintAs->xAct`HiGGS`Private`SymbolBuild[cBetParaPerp,xAct`HiGGS`Private`dSO6,"Constant"->True]];

cBetParaPerp={cBetParaPerp0p,cBetParaPerp0m,cBetParaPerp1p,cBetParaPerp1m,cBetParaPerp2p,cBetParaPerp2m};
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
(*Mike's couplings for irrep Lorentz constraints*)
mAlpSymb="\[Alpha]";
mAlp0Symb="\!\(\*SuperscriptBox[SubscriptBox[\(\[ScriptCapitalM]\), \(Pl\)], \(2\)]\)\[Alpha]";
DefConstantSymbol[mAlp0,PrintAs->xAct`HiGGS`Private`SymbolBuild[mAlp0Symb,dSO0,"Constant"->True]];
DefConstantSymbol[mAlp1,PrintAs->xAct`HiGGS`Private`SymbolBuild[mAlpSymb,xAct`HiGGS`Private`dSO1,"Constant"->True]];
DefConstantSymbol[mAlp2,PrintAs->xAct`HiGGS`Private`SymbolBuild[mAlpSymb,xAct`HiGGS`Private`dSO2,"Constant"->True]];
DefConstantSymbol[mAlp3,PrintAs->xAct`HiGGS`Private`SymbolBuild[mAlpSymb,xAct`HiGGS`Private`dSO3,"Constant"->True]];
DefConstantSymbol[mAlp4,PrintAs->xAct`HiGGS`Private`SymbolBuild[mAlpSymb,xAct`HiGGS`Private`dSO4,"Constant"->True]];
DefConstantSymbol[mAlp5,PrintAs->xAct`HiGGS`Private`SymbolBuild[mAlpSymb,xAct`HiGGS`Private`dSO5,"Constant"->True]];
DefConstantSymbol[mAlp6,PrintAs->xAct`HiGGS`Private`SymbolBuild[mAlpSymb,xAct`HiGGS`Private`dSO6,"Constant"->True]];

mAlp={mAlp1,mAlp2,mAlp3,mAlp4,mAlp5,mAlp6};

(*My couplings for irrep Lorentz constraints*)
AlpSymb="\!\(\*OverscriptBox[\(\[Alpha]\), \(^\)]\)";
Alp0Symb="\!\(\*SuperscriptBox[SubscriptBox[\(\[ScriptCapitalM]\), \(Pl\)], \(2\)]\)\!\(\*OverscriptBox[\(\[Alpha]\), \(^\)]\)";
DefConstantSymbol[Alp0,PrintAs->xAct`HiGGS`Private`SymbolBuild[Alp0Symb,xAct`HiGGS`Private`dSO0,"Constant"->True]];
DefConstantSymbol[Alp1,PrintAs->xAct`HiGGS`Private`SymbolBuild[AlpSymb,xAct`HiGGS`Private`dSO1,"Constant"->True]];
DefConstantSymbol[Alp2,PrintAs->xAct`HiGGS`Private`SymbolBuild[AlpSymb,xAct`HiGGS`Private`dSO2,"Constant"->True]];
DefConstantSymbol[Alp3,PrintAs->xAct`HiGGS`Private`SymbolBuild[AlpSymb,xAct`HiGGS`Private`dSO3,"Constant"->True]];
DefConstantSymbol[Alp4,PrintAs->xAct`HiGGS`Private`SymbolBuild[AlpSymb,xAct`HiGGS`Private`dSO4,"Constant"->True]];
DefConstantSymbol[Alp5,PrintAs->xAct`HiGGS`Private`SymbolBuild[AlpSymb,xAct`HiGGS`Private`dSO5,"Constant"->True]];
DefConstantSymbol[Alp6,PrintAs->xAct`HiGGS`Private`SymbolBuild[AlpSymb,xAct`HiGGS`Private`dSO6,"Constant"->True]];

DefConstantSymbol[AlpGB,PrintAs->xAct`HiGGS`Private`SymbolBuild[AlpSymb,xAct`HiGGS`Private`dGB,"Constant"->True]];

Alp={Alp1,Alp2,Alp3,Alp4,Alp5,Alp6};

mBetSymb="\!\(\*SuperscriptBox[SubscriptBox[\(\[ScriptCapitalM]\), \(Pl\)], \(2\)]\)\[Beta]";
DefConstantSymbol[mBet1,PrintAs->xAct`HiGGS`Private`SymbolBuild[mBetSymb,xAct`HiGGS`Private`dSO1,"Constant"->True]];
DefConstantSymbol[mBet2,PrintAs->xAct`HiGGS`Private`SymbolBuild[mBetSymb,xAct`HiGGS`Private`dSO2,"Constant"->True]];
DefConstantSymbol[mBet3,PrintAs->xAct`HiGGS`Private`SymbolBuild[mBetSymb,xAct`HiGGS`Private`dSO3,"Constant"->True]];
DefConstantSymbol[mBet4,PrintAs->xAct`HiGGS`Private`SymbolBuild[mBetSymb,xAct`HiGGS`Private`dSO4,"Constant"->True]];
DefConstantSymbol[mBet5,PrintAs->xAct`HiGGS`Private`SymbolBuild[mBetSymb,xAct`HiGGS`Private`dSO5,"Constant"->True]];
DefConstantSymbol[mBet6,PrintAs->xAct`HiGGS`Private`SymbolBuild[mBetSymb,xAct`HiGGS`Private`dSO6,"Constant"->True]];

mBet={mBet1,mBet2,mBet3};

BetSymb="\!\(\*SuperscriptBox[SubscriptBox[\(\[ScriptCapitalM]\), \(Pl\)], \(2\)]\)\!\(\*OverscriptBox[\(\[Beta]\), \(^\)]\)";
DefConstantSymbol[Bet1,PrintAs->xAct`HiGGS`Private`SymbolBuild[BetSymb,xAct`HiGGS`Private`dSO1,"Constant"->True]];
DefConstantSymbol[Bet2,PrintAs->xAct`HiGGS`Private`SymbolBuild[BetSymb,xAct`HiGGS`Private`dSO2,"Constant"->True]];
DefConstantSymbol[Bet3,PrintAs->xAct`HiGGS`Private`SymbolBuild[BetSymb,xAct`HiGGS`Private`dSO3,"Constant"->True]];
DefConstantSymbol[Bet4,PrintAs->xAct`HiGGS`Private`SymbolBuild[BetSymb,xAct`HiGGS`Private`dSO4,"Constant"->True]];
DefConstantSymbol[Bet5,PrintAs->xAct`HiGGS`Private`SymbolBuild[BetSymb,xAct`HiGGS`Private`dSO5,"Constant"->True]];
DefConstantSymbol[Bet6,PrintAs->xAct`HiGGS`Private`SymbolBuild[BetSymb,xAct`HiGGS`Private`dSO6,"Constant"->True]];

Bet={Bet1,Bet2,Bet3};

xAct`HiGGS`Private`BuildRebuild@"KarananasCouplings.m";

xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
VSymb="\[ScriptN]";
DefTensor[V[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[VSymb]];
AutomaticRules[V,MakeRule[{V[-a]V[a],1}]];
NSymb="\[ScriptCapitalN]";
DefTensor[Lapse[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[NSymb]];
JiSymb="\!\(\*SuperscriptBox[\(\[ScriptCapitalJ]\), \(-1\)]\)";
DefTensor[Ji[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[JiSymb]];
JSymb="\[ScriptCapitalJ]";
DefTensor[J[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[JSymb]];
AutomaticRules[J,MakeRule[{J[]Ji[],1},MetricOn->All,ContractMetrics->True]];
CollapseJ1=MakeRule[{J[]Ji[],1},MetricOn->All,ContractMetrics->True];
CollapseJ2=MakeRule[{J[]Ji[]^2,Ji[]},MetricOn->All,ContractMetrics->True];
CollapseJ3=MakeRule[{J[]^2Ji[],J[]},MetricOn->All,ContractMetrics->True];
CollapseJ=Join[CollapseJ1,CollapseJ2,CollapseJ3];

JiToJ=MakeRule[{Ji[],1/J[]},MetricOn->All,ContractMetrics->True];

APiSymb="\!\(\*SubscriptBox[\(\[Pi]\), \(\[ScriptCapitalA]\)]\)";
DefTensor[APi[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[APiSymb]];
xAct`HiGGS`Private`DeclareOrder[APi[-a,-b,-c],1,"IsUnityWithEHTerm"->True];
APiPSymb="\!\(\*SubscriptBox[OverscriptBox[\(\[Pi]\), \(^\)], \(\[ScriptCapitalA]\)]\)";
DefTensor[APiP[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[APiPSymb],OrthogonalTo->{V[c]}];
xAct`HiGGS`Private`DeclareOrder[APiP[-a,-b,-c],1,"IsUnityWithEHTerm"->True];
BPiSymb="\!\(\*SubscriptBox[\(\[Pi]\), \(\[ScriptB]\)]\)";
DefTensor[BPi[-a,-c],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[BPiSymb]];
xAct`HiGGS`Private`DeclareOrder[BPi[-a,-c],1];
BPiPSymb="\!\(\*SubscriptBox[OverscriptBox[\(\[Pi]\), \(^\)], \(\[ScriptB]\)]\)";
DefTensor[BPiP[-a,-c],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[BPiPSymb],OrthogonalTo->{V[c]}];
xAct`HiGGS`Private`DeclareOrder[BPiP[-a,-c],1];
HSymb="\[ScriptH]";
DefTensor[H[-a,c],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[HSymb]];
DefTensor[B[a,-c],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[BSymb]];

(*this section inserted to allow perturbative expansion of the H and B fields*)
HToF=MakeRule[{H[-i,-j],G[-i,-j]+F[-i,-j]},MetricOn->All,ContractMetrics->True];
BToF=MakeRule[{B[-i,-j],G[-i,-j]-F[-i,-j]+F[-i,-m]F[m,-j]},MetricOn->All,ContractMetrics->True];
ToF=Join[HToF,BToF];

(*Rule to contract Roman indices*)
AutomaticRules[H,MakeRule[{H[-a,i]B[a,-j],G[i,-j]},MetricOn->All,ContractMetrics->True]];
(*Rule to contract Greek indices*)
AutomaticRules[H,MakeRule[{H[-a,i]B[c,-i],G[-a,c]},MetricOn->All,ContractMetrics->True]];

G3Symb=xAct`HiGGS`Private`SO3~StringJoin~"\[Gamma]";

DefTensor[G3[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[G3Symb]];
AutomaticRules[G3,MakeRule[{G3[-a,-b]G3[b,-d],G3[-a,-d]},MetricOn->All,ContractMetrics->True]];
AutomaticRules[G3,MakeRule[{G3[-a,a],3},MetricOn->All,ContractMetrics->True]];
AutomaticRules[G3,MakeRule[{B[a,-b]G3[b,-c]V[-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[G3,MakeRule[{CD[-a][G3[-c,b]],0},MetricOn->All,ContractMetrics->True]];

EpsSymb="\!\(\*SuperscriptBox[\(\[Epsilon]\), \(\[DoubleVerticalBar]\)]\)";
DefTensor[Eps[-a,-b,-c],M4,Antisymmetric[{-a,-b,-c}],OrthogonalTo->{V[a],V[b],V[c]},PrintAs->xAct`HiGGS`Private`SymbolBuild[EpsSymb]];
xAct`HiGGS`Private`DeclareOrder[CD[-z][Eps[-a,-b,-c]],1];
FoliGSymb="\!\(\*SuperscriptBox[\(\[Eta]\), \(\[DoubleVerticalBar]\)]\)";
DefTensor[FoliG[-a,-b],M4,Symmetric[{-a,-b}],OrthogonalTo->{V[a],V[b]},PrintAs->xAct`HiGGS`Private`SymbolBuild[FoliGSymb]];
xAct`HiGGS`Private`DeclareOrder[CD[-z][FoliG[-a,-b]],1];
epsilonGVToEps=MakeRule[{V[d]epsilonG[-a,-b,-c,-d],Eps[-a,-b,-c]},MetricOn->All,ContractMetrics->True];
EpsToepsilonGV=MakeRule[{Eps[-a,-b,-c],V[d]epsilonG[-a,-b,-c,-d]},MetricOn->All,ContractMetrics->True];
GToFoliG=MakeRule[{G[-a,-b],FoliG[-a,-b]+V[-a]V[-b]},MetricOn->All,ContractMetrics->True];
FoliGToG=MakeRule[{FoliG[-a,-b],G[-a,-b]-V[-a]V[-b]},MetricOn->All,ContractMetrics->True];

HCompSymb="H";
DefTensor[HComp[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[HCompSymb]];(*A dummy variable which we will use to construct Poisson brackets*)
xAct`HiGGS`Private`ClearBuild[];



(* ::Input::Initialization:: *)
PPerpSymb="\!\(\*SuperscriptBox[OverscriptBox[\(\[ScriptCapitalP]\), \(^\)], \(\[UpTee]\)]\)";
DefTensor[PPerp[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[PPerpSymb]];
PParaSymb="\!\(\*SuperscriptBox[OverscriptBox[\(\[ScriptCapitalP]\), \(^\)], \(\[DoubleVerticalBar]\)]\)";
DefTensor[PPara[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[PParaSymb]];
PPerpDefinition=V[-a]V[b];
PPerpActivate=MakeRule[{PPerp[-a,b],Evaluate[PPerpDefinition]},MetricOn->All,ContractMetrics->True];
PParaDefinition=G[-a,b]-V[-a]V[b];
PParaActivate=MakeRule[{PPara[-a,b],Evaluate[PParaDefinition]},MetricOn->All,ContractMetrics->True];
PADMActivate=Join[PPerpActivate,PParaActivate];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)

(*Rules for converting all derivatives into derivatives of translational gauge fields by chain rule*)
DefTensor[DVDB[-a,-b,c],M4];
DefTensor[DHDB[-a,b,-c,d],M4];
DefTensor[DJDB[-c,d],M4];
DefTensor[DJiDB[-c,d],M4];
DefTensor[DLapseDB[-c,d],M4];

DVDBDefinition=-V[-b]PPara[i,-a]H[-i,c]/.PADMActivate//ToCanonical;
AutomaticRules[DVDB,MakeRule[{DVDB[-a,-b,c],Evaluate[DVDBDefinition]},MetricOn->All,ContractMetrics->True]];
DHDBDefinition=-H[-c,b]H[-a,d]//ToCanonical;
AutomaticRules[DHDB,MakeRule[{DHDB[-a,b,-c,d],Evaluate[DHDBDefinition]},MetricOn->All,ContractMetrics->True]];
DJDBDefinition=J[]PPara[-c,e]H[-e,d]/.PADMActivate//ToCanonical;
AutomaticRules[DJDB,MakeRule[{DJDB[-c,d],Evaluate[DJDBDefinition]},MetricOn->All,ContractMetrics->True]];
DJiDBDefinition=-Ji[]PPara[-c,e]H[-e,d]/.PADMActivate//ToCanonical;
AutomaticRules[DJiDB,MakeRule[{DJiDB[-c,d],Evaluate[DJiDBDefinition]},MetricOn->All,ContractMetrics->True]];
(*DLapseDBDefinition=Lapse[]PPerp[-c,e]H[-e,d]/.PADMActivate//ToCanonical;*)(*this fixed, could have led to catastrophic errors: I even wrote it correctly in the paper but in HiGGS it was clearly copied from J rule and never edited..! Finally noticed because when I tried to explore theories with Einstein--Hilbert term, I would occasionally get non-ADM "X" tensor in the velocities.*)
DLapseDBDefinition=Lapse[]V[-c]V[e]H[-e,d]/.PADMActivate//ToCanonical;(*this ought to be correct*)
AutomaticRules[DLapseDB,MakeRule[{DLapseDB[-c,d],Evaluate[DLapseDBDefinition]},MetricOn->All,ContractMetrics->True]];

AutomaticRules[V,MakeRule[{CD[-a][V[-j]],Evaluate[-V[-i]PPara[-j,k]H[-k,m]CD[-a][B[i,-m]]/.PADMActivate]},MetricOn->All,ContractMetrics->True]];
AutomaticRules[H,MakeRule[{CD[-a][H[-j,n]],Evaluate[-H[-i,n]H[-j,m]CD[-a][B[i,-m]]]},MetricOn->All,ContractMetrics->True]];
AutomaticRules[J,MakeRule[{CD[-a][J[]],Evaluate[J[]H[-k,n]PPara[k,-i]CD[-a][B[i,-n]]/.PADMActivate]},MetricOn->All,ContractMetrics->True]];
AutomaticRules[Ji,MakeRule[{CD[-a][Ji[]],Evaluate[-Ji[]H[-k,n]PPara[k,-i]CD[-a][B[i,-n]]/.PADMActivate]},MetricOn->All,ContractMetrics->True]];
AutomaticRules[Lapse,MakeRule[{CD[-a][Lapse[]],Evaluate[Lapse[]H[-k,n]PPerp[k,-i]CD[-a][B[i,-n]]/.PADMActivate]},MetricOn->All,ContractMetrics->True]];

xAct`HiGGS`Private`DeclareOrder[CD[-a][B[i,-m]],1];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
G3HExpand=MakeRule[{G3[n,-m]H[-i,m],Evaluate[V[-i]V[j]G3[n,-m]H[-j,m]+PPara[-i,j]H[-j,n]/.PADMActivate]},MetricOn->All,ContractMetrics->True];
HG3BExpand=MakeRule[{H[-a,b]G3[-b,c]B[d,-c],Evaluate[PPara[-a,b]PPara[-b,d]+V[-a]V[c]H[-c,e]G3[-e,f]B[d,-f]/.PADMActivate//ToCanonical]},MetricOn->All,ContractMetrics->True];
DefTensor[X[k],M4];
AutomaticRules[X,MakeRule[{X[-a]V[a],1},MetricOn->All,ContractMetrics->True]];
HG3BExpandLazy=MakeRule[{B[d,-b]G3[b,-a]H[-e,a],Evaluate[G[d,-e]-V[-e]X[d]/.PADMActivate]},MetricOn->All,ContractMetrics->True];
UnprocessedX=MakeRule[{X[d],Evaluate[V[d]+PPara[d,-c]B[c,-b]G3[b,-e]H[-f,e]V[f]/.PADMActivate]},MetricOn->All,ContractMetrics->True];(*seems I never used this below, and I'd like to know why X didn't cause problems with previous velocities, since it commonly cropps up in brackets with the Lapse (but not always)*)
(*this still seems a problem -- must check!*)
XToV=MakeRule[{X[d],Evaluate[V[d]]},MetricOn->All,ContractMetrics->True];
HExpandedDefinition=G3[-k,j]H[-i,k]+V[-i]V[k]H[-k,j]-V[-i]G3[-k,j]V[l]H[-l,k];(*there was a sign error here, since corrected*)
HExpand=MakeRule[{H[-i,j],Evaluate[HExpandedDefinition]},MetricOn->All,ContractMetrics->True];

RiemannCartanExpand=MakeRule[{R[a,b,-d,-e],H[-d,i]H[-e,j](CD[-i][A[a,b,-j]]-CD[-j][A[a,b,-i]]+A[a,-k,-i]A[k,b,-j]-A[a,-k,-j]A[k,b,-i])},MetricOn->All,ContractMetrics->True];
TorsionExpand=MakeRule[{T[a,-b,-c],H[-b,i]H[-c,j](CD[-i][B[a,-j]]-CD[-j][B[a,-i]]+A[a,-k,-i]B[k,-j]-A[a,-k,-j]B[k,-i])},MetricOn->All,ContractMetrics->True];
ExpandStrengths=Join[RiemannCartanExpand,TorsionExpand];
ToTorsion=MakeRule[{CD[-s][B[a,-r]],Evaluate[Symmetrize[CD[-s][B[a,-r]],{-s,-r}]-Antisymmetrize[A[a,-k,-s]B[k,-r],{-s,-r}]+(1/2)B[b,-s]B[c,-r]T[a,-b,-c]]},MetricOn->All,ContractMetrics->True];
ToRiemannCartan=MakeRule[{CD[-s][A[i,j,-r]],Evaluate[Symmetrize[CD[-s][A[i,j,-r]],{-s,-r}]-Antisymmetrize[A[i,-m,-s]A[m,j,-r],{-s,-r}]+(1/2)B[k,-s]B[l,-r]R[i,j,-k,-l]]},MetricOn->All,ContractMetrics->True];
ToStrengths=Join[ToTorsion,ToRiemannCartan];

(*would be good to put parallel momenta up here also*)


(* ::Input::Initialization:: *)
FPSymb="\!\(\*OverscriptBox[\(\[ScriptF]\), \(^\)]\)";
DefTensor[FP[-a,-b],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[FPSymb],OrthogonalTo->{V[b]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[FP[-a,-b],1];
APSymb="\!\(\*SuperscriptBox[OverscriptBox[\(\[ScriptCapitalA]\), \(^\)], \(\[Flat]\)]\)";
DefTensor[AP[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[APSymb],OrthogonalTo->{V[c]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[AP[-a,-b,-c],1];
FPerpSymb="\!\(\*SuperscriptBox[\(\[ScriptF]\), \(\[UpTee]\)]\)";
DefTensor[FPerp[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[FPerpSymb],Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[FPerp[-a],1];
APerpSymb="\!\(\*SuperscriptBox[SuperscriptBox[\(\[ScriptCapitalA]\), \(\[Flat]\)], \(\[UpTee]\)]\)";
DefTensor[APerp[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[APerpSymb],Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[APerp[-a,-b],1];

FDecomposeDefinition=FP[-a,-b]+V[-b]FPerp[-a];
ADecomposeDefinition=AP[-a,-b,-c]+V[-c]APerp[-a,-b];
FDecompose=MakeRule[{F[-a,-b],Evaluate[FDecomposeDefinition]},MetricOn->All,ContractMetrics->True];
ADecompose=MakeRule[{A[-a,-b,-c],Evaluate[ADecomposeDefinition]},MetricOn->All,ContractMetrics->True];
FDecomposeD=MakeRule[{Evaluate@Dagger@F[-a,-b],Evaluate[Dagger@FDecomposeDefinition]},MetricOn->All,ContractMetrics->True];
ADecomposeD=MakeRule[{Evaluate@Dagger@A[-a,-b,-c],Evaluate[Dagger@ADecomposeDefinition]},MetricOn->All,ContractMetrics->True];
GaugeDecompose=Join[FDecompose,ADecompose,FDecomposeD,ADecomposeD];

FPToFDefinition=PPara[-b,c]F[-a,-c]/.PADMActivate;
FPerpToFDefinition=V[c]F[-a,-c];
APToADefinition=PPara[-b,c]A[-a,-e,-c]/.PADMActivate;
APerpToADefinition=V[c]A[-a,-e,-c];

FPToF=MakeRule[{FP[-a,-b],Evaluate[FPToFDefinition]},MetricOn->All,ContractMetrics->True];
FPerpToF=MakeRule[{FPerp[-a],Evaluate[FPerpToFDefinition]},MetricOn->All,ContractMetrics->True];
APToA=MakeRule[{AP[-a,-e,-b],Evaluate[APToADefinition]},MetricOn->All,ContractMetrics->True];
APerpToA=MakeRule[{APerp[-a,-e],Evaluate[APerpToADefinition]},MetricOn->All,ContractMetrics->True];
FPToFD=MakeRule[{Evaluate@Dagger@FP[-a,-b],Evaluate[Dagger@FPToFDefinition]},MetricOn->All,ContractMetrics->True];
FPerpToFD=MakeRule[{Evaluate@Dagger@FPerp[-a],Evaluate[Dagger@FPerpToFDefinition]},MetricOn->All,ContractMetrics->True];
APToAD=MakeRule[{Evaluate@Dagger@AP[-a,-e,-b],Evaluate[Dagger@APToADefinition]},MetricOn->All,ContractMetrics->True];
APerpToAD=MakeRule[{Evaluate@Dagger@APerp[-a,-e],Evaluate[Dagger@APerpToADefinition]},MetricOn->All,ContractMetrics->True];
GaugeCompose=Join[FPToF,FPerpToF,APToA,APerpToA,FPToFD,FPerpToFD,APToAD,APerpToAD];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
TauPSymb="\!\(\*SuperscriptBox[\(\[Tau]\), \(\(\[Flat]\)\(\[DoubleVerticalBar]\)\)]\)";
DefTensor[TauP[-a,-b],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TauPSymb],OrthogonalTo->{V[b]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[TauP[-a,-b],1];
SigmaPSymb="\!\(\*SuperscriptBox[\(\[Sigma]\), \(\(\[Flat]\)\(\[DoubleVerticalBar]\)\)]\)";
DefTensor[SigmaP[-c,-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[SigmaPSymb],OrthogonalTo->{V[c]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[SigmaP[-a,-b,-c],1];
TauPerpSymb="\!\(\*SuperscriptBox[\(\[Tau]\), \(\(\[Flat]\)\(\[UpTee]\)\)]\)";
DefTensor[TauPerp[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TauPerpSymb],Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[TauPerp[-a],1];
SigmaPerpSymb="\!\(\*SuperscriptBox[SuperscriptBox[\(\[Sigma]\), \(\[Flat]\)], \(\[UpTee]\)]\)";
DefTensor[SigmaPerp[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[SigmaPerpSymb],Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[SigmaPerp[-a,-b],1];

TauDecomposeDefinition=TauP[-a,-b]+V[-b]TauPerp[-a];
SigmaDecomposeDefinition=SigmaP[-c,-a,-b]+V[-c]SigmaPerp[-a,-b];
TauDecompose=MakeRule[{Tau[-a,-b],Evaluate[TauDecomposeDefinition]},MetricOn->All,ContractMetrics->True];
SigmaDecompose=MakeRule[{Sigma[-c,-a,-b],Evaluate[SigmaDecomposeDefinition]},MetricOn->All,ContractMetrics->True];
TauDecomposeD=MakeRule[{Evaluate@Dagger@Tau[-a,-b],Evaluate[Dagger@TauDecomposeDefinition]},MetricOn->All,ContractMetrics->True];
SigmaDecomposeD=MakeRule[{Evaluate@Dagger@Sigma[-c,-a,-b],Evaluate[Dagger@SigmaDecomposeDefinition]},MetricOn->All,ContractMetrics->True];
SourceDecompose=Join[TauDecompose,SigmaDecompose,TauDecomposeD,SigmaDecomposeD];

TauPToTauDefinition=PPara[-b,c]Tau[-a,-c]/.PADMActivate;
TauPerpToTauDefinition=V[c]Tau[-a,-c];
SigmaPToSigmaDefinition=PPara[-b,c]Sigma[-c,-a,-e]/.PADMActivate;
SigmaPerpToSigmaDefinition=V[c]Sigma[-c,-a,-e];

TauPToTau=MakeRule[{TauP[-a,-b],Evaluate[TauPToTauDefinition]},MetricOn->All,ContractMetrics->True];
TauPerpToTau=MakeRule[{TauPerp[-a],Evaluate[TauPerpToTauDefinition]},MetricOn->All,ContractMetrics->True];
SigmaPToSigma=MakeRule[{SigmaP[-b,-a,-e],Evaluate[SigmaPToSigmaDefinition]},MetricOn->All,ContractMetrics->True];
SigmaPerpToSigma=MakeRule[{SigmaPerp[-a,-e],Evaluate[SigmaPerpToSigmaDefinition]},MetricOn->All,ContractMetrics->True];
TauPToTauD=MakeRule[{Evaluate@Dagger@TauP[-a,-b],Evaluate[Dagger@TauPToTauDefinition]},MetricOn->All,ContractMetrics->True];
TauPerpToTauD=MakeRule[{Evaluate@Dagger@TauPerp[-a],Evaluate[Dagger@TauPerpToTauDefinition]},MetricOn->All,ContractMetrics->True];
SigmaPToSigmaD=MakeRule[{Evaluate@Dagger@SigmaP[-b,-a,-e],Evaluate[Dagger@SigmaPToSigmaDefinition]},MetricOn->All,ContractMetrics->True];
SigmaPerpToSigmaD=MakeRule[{Evaluate@Dagger@SigmaPerp[-a,-e],Evaluate[Dagger@SigmaPerpToSigmaDefinition]},MetricOn->All,ContractMetrics->True];
SourceCompose=Join[TauPToTau,TauPerpToTau,SigmaPToSigma,SigmaPerpToSigma,TauPToTauD,TauPerpToTauD,SigmaPToSigmaD,SigmaPerpToSigmaD];

SigmaSO13Activate=MakeRule[{Sigma[-z,-j,-k],B[i,-z]Evaluate[SigmaDefinition]},MetricOn->All,ContractMetrics->True];

xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
(*Defining parallel field strengths, i.e. the canonical parts*)
TPpSymb="\!\(\*SuperscriptBox[\(\[ScriptCapitalT]\), \(\[DoubleVerticalBar]\)]\)";
DefTensor[TP[-a,-b,-c],M4,Antisymmetric[{-b,-c}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TPpSymb],OrthogonalTo->{V[b],V[c]}];
xAct`HiGGS`Private`DeclareOrder[TP[-a,-b,-c],1];
RPpSymb="\!\(\*SuperscriptBox[\(\[ScriptCapitalR]\), \(\[DoubleVerticalBar]\)]\)";
DefTensor[RP[-a,-b,-c,-d],M4,{Antisymmetric[{-a,-b}],Antisymmetric[{-c,-d}]},PrintAs->xAct`HiGGS`Private`SymbolBuild[RPpSymb],OrthogonalTo->{V[c],V[d]}];
xAct`HiGGS`Private`DeclareOrder[RP[-a,-b,-c,-d],1];
TPToT=MakeRule[{TP[-a,-b,-c],PPara[-b,e]PPara[-c,f]T[-a,-e,-f]},MetricOn->All,ContractMetrics->True];
RPToR=MakeRule[{RP[-a,-b,-c,-d],PPara[-c,e]PPara[-d,f]R[-a,-b,-e,-f]},MetricOn->All,ContractMetrics->True];
StrengthPToStrength=Join[TPToT,RPToR];

xAct`HiGGS`Private`BuildRebuild@"GeometricMultipliers/Lambda/LambdaPerpPara.m";
xAct`HiGGS`Private`BuildRebuild@"GeometricMultipliers/LambdaPi/LambdaPiPerpPara.m";

(*Defining perpendicular field strengths, i.e. the non-canonical parts*)
TPerppSymb="\!\(\*SuperscriptBox[\(\[ScriptCapitalT]\), \(\[UpTee]\)]\)";
DefTensor[TPerp[-a,-b],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TPerppSymb],OrthogonalTo->{V[b]}];
xAct`HiGGS`Private`DeclareOrder[TPerp[-a,-b],1];
RPerppSymb="\!\(\*SuperscriptBox[\(\[ScriptCapitalR]\), \(\[UpTee]\)]\)";
DefTensor[RPerp[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RPerppSymb],OrthogonalTo->{V[c]}];
xAct`HiGGS`Private`DeclareOrder[RPerp[-a,-b,-c],1];
TPerpToT=MakeRule[{TPerp[-a,-b],PPara[-b,f]V[g]T[-a,-f,-g]},MetricOn->All,ContractMetrics->True];
RPerpToR=MakeRule[{RPerp[-a,-b,-c],PPara[-c,e]V[f]R[-a,-b,-e,-f]},MetricOn->All,ContractMetrics->True];
StrengthPerpToStrength=Join[TPerpToT,RPerpToR];

xAct`HiGGS`Private`BuildRebuild@"GeometricMultipliers/Lambda/LambdaPerpParaInverse.m";
xAct`HiGGS`Private`BuildRebuild@"GeometricMultipliers/LambdaPi/LambdaPiPerpParaInverse.m";

RDecomposeDefinition=RP[-a,-b,-c,-d]+2Antisymmetrize[V[-d]RPerp[-a,-b,-c],{-c,-d}]/.ExpandStrengths/.PADMActivate//ToCanonical//CollectTensors//ScreenDollarIndices//CollectTensors;
TDecomposeDefinition=TP[-a,-c,-d]+2Antisymmetrize[V[-d]TPerp[-a,-c],{-c,-d}]/.ExpandStrengths/.PADMActivate//ToCanonical//CollectTensors//ScreenDollarIndices//CollectTensors;
RDecompose=MakeRule[{R[-a,-b,-c,-d],Evaluate[RDecomposeDefinition]},MetricOn->All,ContractMetrics->True];
TDecompose=MakeRule[{T[-a,-c,-d],Evaluate[TDecomposeDefinition]},MetricOn->All,ContractMetrics->True];
StrengthDecompose=Join[RDecompose,TDecompose];

xAct`HiGGS`Private`BuildRebuild@"GeometricMultipliers/Lambda/LambdaPerpParaDecompose.m";
xAct`HiGGS`Private`BuildRebuild@"GeometricMultipliers/LambdaPi/LambdaPiPerpParaDecompose.m";

CDBCommute=MakeRule[{CD[-s][B[a,-r]],Evaluate[CD[-r][B[a,-s]]-2Antisymmetrize[A[a,-k,-s]B[k,-r],{-s,-r}]+B[b,-s]B[c,-r]T[a,-b,-c]]},MetricOn->All,ContractMetrics->True];(*Might want to write an equivalent version for Riemann Cartan curvature*)

DefTensor[DV[-a,-j],M4,OrthogonalTo->{V[j]},PrintAs->xAct`HiGGS`Private`SymbolBuild[VSymb,"Derivative"->1]];
DefTensor[DJ[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[JSymb,"Derivative"->1]];

G3VCDBToG3DV=MakeRule[{G3[-l,n]V[-k]CD[-m][B[k,-n]],-G3[-l,n]B[j,-n]A[k,-j,-m]V[-k]-G3[-l,n]B[j,-n]DV[-m,-j]},MetricOn->All,ContractMetrics->True];

G3HCDBToDJ=MakeRule[{G3[n,-s]H[-k,s]CD[-m][B[k,-n]],Ji[]DJ[-m]-V[k]H[-k,a]G3[-a,b](B[j,-b]DV[-m,-j]+V[-l]A[l,-j,-m]B[j,-b])},MetricOn->All,ContractMetrics->True];

xAct`HiGGS`Private`BuildRebuild@"CovD.m";

xAct`HiGGS`Private`BuildRebuild@"CDBToGaugeCovDB.m";


AVepsilonGToAVEps=MakeRule[{A[-e,d,-f]epsilonG[-d,-a,-b,-c]V[e],A[-e,d,-f]V[e](V[-a]Eps[-d,-b,-c]-V[-b]Eps[-d,-a,-c]+V[-c]Eps[-d,-a,-b])},MetricOn->All,ContractMetrics->True];

HEpsToHG3Eps=MakeRule[{Eps[-a,-b,c]H[-c,e],Eps[-a,-b,c]H[-c,f]G3[e,-f]},MetricOn->All,ContractMetrics->True];

epsilonGToEpsV=MakeRule[{epsilonG[-a,-b,-c,-d],-V[-a]Eps[-b,-c,-d]+V[-b]Eps[-a,-c,-d]-V[-c]Eps[-a,-b,-d]+V[-d]Eps[-a,-b,-c]},MetricOn->All,ContractMetrics->True];

DefTensor[Q[-a,-b],M4,OrthogonalTo->{V[a],V[b]}];

xAct`HiGGS`Private`DeclareOrder[Q[-a,-b],1];

AHEpsExpand=MakeRule[{A[-i,j,-m]Eps[-j,-p,-q]H[-k,m],Evaluate[Eps[-i,j,-z]Q[z,-k]Eps[-j,-p,-q]+PPerp[-i,a]PPara[-k,b]A[-a,j,-m]Eps[-j,-p,-q]H[-b,m]+PPara[-i,a]PPerp[-k,b]A[-a,j,-m]Eps[-j,-p,-q]H[-b,m]+PPerp[-i,a]PPerp[-k,b]A[-a,j,-m]Eps[-j,-p,-q]H[-b,m]/.PADMActivate]},MetricOn->All,ContractMetrics->True];

EpsEpsExpand=MakeRule[{Eps[i,a,b]Eps[-i,-c,-d],Evaluate[PPara[a,-c]PPara[b,-d]-PPara[a,-d]PPara[b,-c]/.PADMActivate]},MetricOn->All,ContractMetrics->True];

DefTensor[CDAInert[-a,-b,-c,-d],M4,Antisymmetric[{-b,-c}]];
xAct`HiGGS`Private`DeclareOrder[CDAInert[-a,-b,-c,-d],1];
CDAToCDAInert=MakeRule[{CD[-a][A[-b,-c,-d]],CDAInert[-a,-b,-c,-d]},MetricOn->All,ContractMetrics->True];
CDAInertToCDA=MakeRule[{CDAInert[-a,-b,-c,-d],CD[-a][A[-b,-c,-d]]},MetricOn->All,ContractMetrics->True];
AExpandedDefinition=PPara[-a,i]PPara[-b,j]A[-i,-j,-c]+PPerp[-a,i]PPara[-b,j]A[-i,-j,-c]-PPerp[-b,i]PPara[-a,j]A[-i,-j,-c]/.PADMActivate;
CDAExpandedDefinition=PPara[-a,i]PPara[-b,j]CDAInert[-k,-i,-j,-c]+PPerp[-a,i]PPara[-b,j]CDAInert[-k,-i,-j,-c]-PPerp[-b,i]PPara[-a,j]CDAInert[-k,-i,-j,-c]/.PADMActivate;
AToAExpanded=MakeRule[{A[-a,-b,-c],Evaluate[AExpandedDefinition]},MetricOn->All,ContractMetrics->True];
CDAToCDAExpanded=MakeRule[{CDAInert[-k,-a,-b,-c],Evaluate[CDAExpandedDefinition]},MetricOn->All,ContractMetrics->True];
AExpand=Join[AToAExpanded,CDAToCDAExpanded];
HVCDADefinition=H[-i,m]V[b]CDAInert[-k,i,-b,-c]/.PADMActivate;
HVADefinition=H[-i,m]V[b]A[i,-b,-c]/.PADMActivate;
HG3VCDAToHVCDA=MakeRule[{H[-i,j]G3[-j,m]V[b]CDAInert[-k,i,-b,-c],Evaluate[HVCDADefinition]},MetricOn->All,ContractMetrics->True];
HG3VAToHVA=MakeRule[{H[-i,j]G3[-j,m]V[b]A[i,-b,-c],Evaluate[HVADefinition]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`ClearBuild[];






DefTensor[PThreePara[-a,-b,-c,d,e,f],M4,{Antisymmetric[{-a,-b}],Antisymmetric[{d,e}]}];
PThreeParaDefinition=Antisymmetrize [Antisymmetrize[PPara[-a,d]PPara[-b,e]PPara[-c,f],{-a,-b}],{d,e}]/.PADMActivate//ToCanonical;
PThreeParaActivate=MakeRule[{PThreePara[-a,-b,-c,d,e,f],Evaluate[PThreeParaDefinition]},MetricOn->All,ContractMetrics->True];
DefTensor[PThreePerp[-a,-b,-c,d,e,f],M4,{Antisymmetric[{-a,-b}],Antisymmetric[{d,e}]}];
PThreePerpDefinition=Antisymmetrize[Antisymmetrize[(PPara[-a,d]PPerp[-b,e]+PPerp[-a,d]PPara[-b,e])PPara[-c,f],{-a,-b}],{d,e}]/.PADMActivate//ToCanonical;
PPerpActivate=MakeRule[{PThreePerp[-a,-b,-c,d,e,f],Evaluate[PThreePerpDefinition]},MetricOn->All,ContractMetrics->True];

DefTensor[PAPerp[-a,-b,d,e,f],M4];
DefTensor[PAPara[-a,-b,-c,d,e,f],M4];
DefTensor[PBPerp[-a,d,e],M4];
DefTensor[PBPara[-a,-b,d,e],M4];

PAPerpDefinition=V[d]PPara[-a,e]G[-b,f]/.PADMActivate//ToCanonical;
PAPerpActivate=MakeRule[{PAPerp[-a,-b,d,e,f],Evaluate[PAPerpDefinition]},MetricOn->All,ContractMetrics->True];
PAParaDefinition=PPara[-a,d]PPara[-b,e]G[-c,f]/.PADMActivate//ToCanonical;
PAParaActivate=MakeRule[{PAPara[-a,-b,-c,d,e,f],Evaluate[PAParaDefinition]},MetricOn->All,ContractMetrics->True];

PBPerpDefinition=V[d]G[-a,e]/.PADMActivate//ToCanonical;
PBPerpActivate=MakeRule[{PBPerp[-a,d,e],Evaluate[PBPerpDefinition]},MetricOn->All,ContractMetrics->True];
PBParaDefinition=PPara[-a,d]G[-b,e]/.PADMActivate//ToCanonical;
PBParaActivate=MakeRule[{PBPara[-a,-b,d,e],Evaluate[PBParaDefinition]},MetricOn->All,ContractMetrics->True];

PADMPiActivate=Join[PAPerpActivate,PAParaActivate,PBPerpActivate,PBParaActivate];

PASymb="\!\(\*SubscriptBox[OverscriptBox[\(\[ScriptCapitalP]\), \(\[Hacek]\)], \(\[ScriptCapitalA]\)]\)";
DefTensor[PA0p[c,d],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PASymb,Spin0p]];
DefTensor[PA1p[-a,-b,c,d],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PASymb,xAct`HiGGS`Private`Spin1p]];
DefTensor[PA2p[-a,-b,c,d],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PASymb,xAct`HiGGS`Private`Spin2p]];

PA0pDefinition=PPara[c,-k]PPara[d,-l]G[k,l]/.PADMActivate//ToCanonical;
PA1pDefinition=PPara[-a,i]PPara[-b,j]PPara[c,-k]PPara[d,-l]Antisymmetrize[G[-i,k]G[-j,l],{-i,-j}]/.PADMActivate//ToCanonical;
PA2pDefinition=PPara[-a,i]PPara[-b,j]PPara[c,-k]PPara[d,-l](Symmetrize[G[-i,k]G[-j,l],{-i,-j}]-(1/3)G[-i,-j]G[k,l])/.PADMActivate//ToCanonical;

DefTensor[PA0m[d,e,f],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PASymb,xAct`HiGGS`Private`Spin0m]];
DefTensor[PA1m[-a,d,e,f],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PASymb,xAct`HiGGS`Private`Spin1m]];
DefTensor[PA2m[-a,-b,-c,d,e,f],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PASymb,xAct`HiGGS`Private`Spin2m]];

PA0mDefinition=PPara[-i,d]PPara[-j,e]PPara[-k,f]epsilonG[i,j,k,g]V[-g]/.PADMActivate//ToCanonical;
PA1mDefinition=PPara[-i,d]PPara[-j,f]PPara[k,-a]PPara[-l,e]G[i,j]G[-k,l]/.PADMActivate//ToCanonical;
PA2mDefinition=PPara[-a,i]PPara[-b,j]PPara[-c,k]PPara[d,-l]PPara[e,-n]PPara[f,-m](3/4)((1/3)(2G[-i,l]G[-j,n]G[-k,m]-G[-j,l]G[-k,n]G[-i,m]-G[-k,l]G[-i,n]G[-j,m])-Antisymmetrize[G[-i,-k]G[-j,n]G[l,m],{-i,-j}])/.PADMActivate//ToCanonical;

PA0pActivate=MakeRule[{PA0p[c,d],Evaluate[PA0pDefinition]},MetricOn->All,ContractMetrics->True];
PA1pActivate=MakeRule[{PA1p[-a,-b,c,d],Evaluate[PA1pDefinition]},MetricOn->All,ContractMetrics->True];
PA2pActivate=MakeRule[{PA2p[-a,-b,c,d],Evaluate[PA2pDefinition]},MetricOn->All,ContractMetrics->True];
PA0mActivate=MakeRule[{PA0m[d,e,f],Evaluate[PA0mDefinition]},MetricOn->All,ContractMetrics->True];
PA1mActivate=MakeRule[{PA1m[-a,d,e,f],Evaluate[PA1mDefinition]},MetricOn->All,ContractMetrics->True];
PA2mActivate=MakeRule[{PA2m[-a,-b,-c,d,e,f],Evaluate[PA2mDefinition]},MetricOn->All,ContractMetrics->True];

PBSymb="\!\(\*SubscriptBox[OverscriptBox[\(\[ScriptCapitalP]\), \(\[Hacek]\)], \(\[ScriptB]\)]\)";
DefTensor[PB0p[c,d],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PBSymb,Spin0p]];
DefTensor[PB1p[-a,-b,c,d],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PBSymb,xAct`HiGGS`Private`Spin1p]];
DefTensor[PB2p[-a,-b,c,d],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PBSymb,xAct`HiGGS`Private`Spin2p]];
DefTensor[PB1m[-a,d],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PBSymb,xAct`HiGGS`Private`Spin1m]];

PB0pDefinition=PPara[c,-k]PPara[d,-l]G[k,l]/.PADMActivate//ToCanonical;
PB1pDefinition=PPara[-a,i]PPara[-b,j]PPara[c,-k]PPara[d,-l]Antisymmetrize[G[-i,k]G[-j,l],{-i,-j}]/.PADMActivate//ToCanonical;
PB2pDefinition=PPara[-a,i]PPara[-b,j]PPara[c,-k]PPara[d,-l](Symmetrize[G[-i,k]G[-j,l],{-i,-j}]-(1/3)G[-i,-j]G[k,l])/.PADMActivate//ToCanonical;
PB1mDefinition=PPara[d,-j]PPara[-a,i]G[-i,j]/.PADMActivate//ToCanonical;

PB0pActivate=MakeRule[{PB0p[c,d],Evaluate[PB0pDefinition]},MetricOn->All,ContractMetrics->True];
PB1pActivate=MakeRule[{PB1p[-a,-b,c,d],Evaluate[PB1pDefinition]},MetricOn->All,ContractMetrics->True];
PB2pActivate=MakeRule[{PB2p[-a,-b,c,d],Evaluate[PB2pDefinition]},MetricOn->All,ContractMetrics->True];
PB1mActivate=MakeRule[{PB1m[-a,d],Evaluate[PB1mDefinition]},MetricOn->All,ContractMetrics->True];

PO3PiActivate=Join[PA0pActivate,PA1pActivate,PA2pActivate,PA0mActivate,PA1mActivate,PA2mActivate,PB0pActivate,PB1pActivate,PB2pActivate,PB1mActivate];

APiToAPiP=MakeRule[{APi[-i,-j,k]G3[-k,a]B[l,-a],APiP[-i,-j,l]},MetricOn->All,ContractMetrics->True];
BPiToBPiP=MakeRule[{BPi[-i,k]G3[-k,a]B[l,-a],BPiP[-i,l]},MetricOn->All,ContractMetrics->True];
PiToPiP=Join[APiToAPiP,BPiToBPiP];
CDAPiToCDAPiP=MakeRule[{CD[-z][APi[-i,-j,k]]G3[-k,a]B[l,-a],CD[-z][APiP[-i,-j,l]]-APi[-i,-j,k]G3[-k,a]CD[-z][B[l,-a]]},MetricOn->All,ContractMetrics->True];
CDBPiToCDBPiP=MakeRule[{CD[-z][BPi[-i,k]]G3[-k,a]B[l,-a],CD[-z][BPiP[-i,l]]-BPi[-i,k]G3[-k,a]CD[-z][B[l,-a]]},MetricOn->All,ContractMetrics->True];
CDPiToCDPiP=Join[CDAPiToCDAPiP,CDBPiToCDBPiP];
APiToAPiPHard=MakeRule[{APi[-i,-j,k]G3[-k,a],Evaluate[APiP[-i,-j,l]PPara[-l,s]H[-s,f]G3[-f,a]/.PADMActivate]},MetricOn->All,ContractMetrics->True];
BPiToBPiPHard=MakeRule[{BPi[-i,k]G3[-k,a],Evaluate[BPiP[-i,l]PPara[-l,s]H[-s,f]G3[-f,a]/.PADMActivate]},MetricOn->All,ContractMetrics->True];
PiToPiPHard=Join[APiToAPiPHard,BPiToBPiPHard];(*PADMActivate added above two lines on 14/04*)
CDAPiToCDAPiPHard=MakeRule[{CD[-z][APi[-i,-j,k]]G3[-k,a],Evaluate[CD[-z][APiP[-i,-j,l]]PPara[-l,s]H[-s,f]G3[-f,a]+APiP[-i,-j,l]CD[-z][PPara[-l,s]H[-s,f]G3[-f,a]]/.PADMActivate]},MetricOn->All,ContractMetrics->True];
CDBPiToCDBPiPHard=MakeRule[{CD[-z][BPi[-i,k]]G3[-k,a],Evaluate[CD[-z][BPiP[-i,l]]PPara[-l,s]H[-s,f]G3[-f,a]+BPiP[-i,l]CD[-z][PPara[-l,s]H[-s,f]G3[-f,a]]/.PADMActivate]},MetricOn->All,ContractMetrics->True];
CDPiToCDPiPHard=Join[CDAPiToCDAPiPHard,CDBPiToCDBPiPHard];
APiPToAPi=MakeRule[{APiP[-i,-j,l],APi[-i,-j,k]G3[-k,a]B[l,-a]},MetricOn->All,ContractMetrics->True];
BPiPToBPi=MakeRule[{BPiP[-i,l],BPi[-i,k]G3[-k,a]B[l,-a]},MetricOn->All,ContractMetrics->True];
PiPToPi=Join[APiPToAPi,BPiPToBPi];

xAct`HiGGS`Private`BuildRebuild@"IfConstraints/ActivateGeneralO3Projections.m";

(* ::Input::Initialization:: *)
PBTSymb="\[InvisiblePrefixScriptBase]\!\(\*SubscriptBox[OverscriptBox[\(\[ScriptCapitalP]\), \(^\)], \(\[ScriptB]\)]\)";
DefTensor[PB0pT[-n,-m,a,c],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PBTSymb,xAct`HiGGS`Private`Spin0p]];
DefTensor[PB1pT[-n,-m,a,c],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PBTSymb,xAct`HiGGS`Private`Spin1p]];
DefTensor[PB2pT[-n,-m,a,c],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PBTSymb,xAct`HiGGS`Private`Spin2p]];
DefTensor[PB1mT[-n,-m,a,c],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PBTSymb,xAct`HiGGS`Private`Spin1m]];

PATSymb="\[InvisiblePrefixScriptBase]\!\(\*SubscriptBox[OverscriptBox[\(\[ScriptCapitalP]\), \(^\)], \(\[ScriptCapitalA]\)]\)";
DefTensor[PA0pT[-n,-m,-o,a,b,c],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PATSymb,xAct`HiGGS`Private`Spin0p]];
DefTensor[PA1pT[-n,-m,-o,a,b,c],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PATSymb,xAct`HiGGS`Private`Spin1p]];
DefTensor[PA2pT[-n,-m,-o,a,b,c],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PATSymb,xAct`HiGGS`Private`Spin2p]];
DefTensor[PA0mT[-n,-m,-o,a,b,c],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PATSymb,xAct`HiGGS`Private`Spin0m]];
DefTensor[PA1mT[-n,-m,-o,a,b,c],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PATSymb,xAct`HiGGS`Private`Spin1m]];
DefTensor[PA2mT[-n,-m,-o,a,b,c],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PATSymb,xAct`HiGGS`Private`Spin2m]];
xAct`HiGGS`Private`ClearBuild[];


xAct`HiGGS`Private`IfBuild["CompleteO3Projections"];
OpenLastCache[];


(* ::Input::Initialization:: *)
DefConstantSymbol[cPerpA0p,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(A0\), \(+\)], \(\[UpTee]\)]\)"];
DefConstantSymbol[cPerpA0m,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(A0\), \(-\)], \(\[UpTee]\)]\)"];
DefConstantSymbol[cPerpA1p,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(A1\), \(+\)], \(\[UpTee]\)]\)"];
DefConstantSymbol[cPerpA1m,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(A1\), \(-\)], \(\[UpTee]\)]\)"];
DefConstantSymbol[cPerpA2p,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(A2\), \(+\)], \(\[UpTee]\)]\)"];
DefConstantSymbol[cPerpA2m,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(A2\), \(-\)], \(\[UpTee]\)]\)"];

DefConstantSymbol[cPerpB0p,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(b0\), \(+\)], \(\[UpTee]\)]\)"];
DefConstantSymbol[cPerpB0m,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(b0\), \(-\)], \(\[UpTee]\)]\)"];
DefConstantSymbol[cPerpB1p,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(b1\), \(+\)], \(\[UpTee]\)]\)"];
DefConstantSymbol[cPerpB1m,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(b1\), \(-\)], \(\[UpTee]\)]\)"];
DefConstantSymbol[cPerpB2p,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(b2\), \(+\)], \(\[UpTee]\)]\)"];
DefConstantSymbol[cPerpB2m,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(b2\), \(-\)], \(\[UpTee]\)]\)"];
xAct`HiGGS`Private`ClearBuild[];

xAct`HiGGS`Private`IfBuild["ProjectionNormalisations"];
OpenLastCache[];

xAct`HiGGS`Private`IfBuild["ProjectionNormalisationsCheck"];

(* ::Input::Initialization:: *)
DefConstantSymbol[BetPerpPerp0p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(0\), \(+\)], \(\(\[UpTee]\)\(\[UpTee]\)\)]\)",$Coupling]];
DefConstantSymbol[BetPerpPerp0m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(0\), \(-\)], \(\(\[UpTee]\)\(\[UpTee]\)\)]\)",$Coupling]];
DefConstantSymbol[BetPerpPerp1p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(1\), \(+\)], \(\(\[UpTee]\)\(\[UpTee]\)\)]\)",$Coupling]];
DefConstantSymbol[BetPerpPerp1m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(1\), \(-\)], \(\(\[UpTee]\)\(\[UpTee]\)\)]\)",$Coupling]];
DefConstantSymbol[BetPerpPerp2p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(2\), \(+\)], \(\(\[UpTee]\)\(\[UpTee]\)\)]\)",$Coupling]];
DefConstantSymbol[BetPerpPerp2m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(2\), \(-\)], \(\(\[UpTee]\)\(\[UpTee]\)\)]\)",$Coupling]];

BetPerpPerp={BetPerpPerp0p,BetPerpPerp0m,BetPerpPerp1p,BetPerpPerp1m,BetPerpPerp2p,BetPerpPerp2m};

DefConstantSymbol[AlpPerpPerp0p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(0\), \(+\)], \(\(\[UpTee]\)\(\[UpTee]\)\)]\)",$Coupling]];
DefConstantSymbol[AlpPerpPerp0m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(0\), \(-\)], \(\(\[UpTee]\)\(\[UpTee]\)\)]\)",$Coupling]];
DefConstantSymbol[AlpPerpPerp1p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(1\), \(+\)], \(\(\[UpTee]\)\(\[UpTee]\)\)]\)",$Coupling]];
DefConstantSymbol[AlpPerpPerp1m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(1\), \(-\)], \(\(\[UpTee]\)\(\[UpTee]\)\)]\)",$Coupling]];
DefConstantSymbol[AlpPerpPerp2p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(2\), \(+\)], \(\(\[UpTee]\)\(\[UpTee]\)\)]\)",$Coupling]];
DefConstantSymbol[AlpPerpPerp2m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(2\), \(-\)], \(\(\[UpTee]\)\(\[UpTee]\)\)]\)",$Coupling]];

AlpPerpPerp={AlpPerpPerp0p,AlpPerpPerp0m,AlpPerpPerp1p,AlpPerpPerp1m,AlpPerpPerp2p,AlpPerpPerp2m};
xAct`HiGGS`Private`ClearBuild[];

(*
xAct`HiGGS`Private`IfBuild["TransferCouplingsPerpPerp"];
OpenLastCache[];
*)

(* ::Input::Initialization:: *)
(*Projection operators which define the O(3) decomposition of the canonical parts of field strengths*)
PTSymb="\!\(\*SubscriptBox[OverscriptBox[\(\[ScriptCapitalP]\), \(\[Hacek]\)], \(\[ScriptCapitalT]\)]\)";
DefTensor[PT0m[d,e,f],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PTSymb,xAct`HiGGS`Private`Spin0m]];
DefTensor[PT1p[-a,-b,c,d],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PTSymb,xAct`HiGGS`Private`Spin1p]];
DefTensor[PT1m[-a,d,e,f],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PTSymb,xAct`HiGGS`Private`Spin1m]];
DefTensor[PT2m[-a,-b,-c,d,e,f],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PTSymb,xAct`HiGGS`Private`Spin2m]];
PRSymb="\!\(\*SubscriptBox[OverscriptBox[\(\[ScriptCapitalP]\), \(\[Hacek]\)], \(\[ScriptCapitalR]\)]\)";
DefTensor[PR0p[e,f,g,h],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PRSymb,xAct`HiGGS`Private`Spin0p]];
DefTensor[PR0m[e,f,g],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PRSymb,xAct`HiGGS`Private`Spin0m]];
DefTensor[PR1p[-n,-m,e,f,g,h],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PRSymb,xAct`HiGGS`Private`Spin1p]];
DefTensor[PR1m[-n,e,f,g],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PRSymb,xAct`HiGGS`Private`Spin1m]];
DefTensor[PR2p[-n,-m,e,f,g,h],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PRSymb,xAct`HiGGS`Private`Spin2p]];
DefTensor[PR2m[-n,-m,-o,e,f,g],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PRSymb,xAct`HiGGS`Private`Spin2m]];
PT0mDefinition=PPara[-i,d]PPara[-j,e]PPara[-k,f]epsilonG[i,j,k,g]V[-g]/.PADMActivate//ToCanonical;
PT1pDefinition=PPara[-a,i]PPara[-b,j]PPara[c,-k]PPara[d,-l]Antisymmetrize[G[-i,k]G[-j,l],{-i,-j}]/.PADMActivate//ToCanonical;
PT1mDefinition=PPara[-i,d]PPara[-j,f]PPara[k,-a]PPara[-l,e]G[i,j]G[-k,l]/.PADMActivate//ToCanonical;
PT2mDefinition=PPara[-a,i]PPara[-b,j]PPara[-c,k]PPara[e,-l]PPara[f,-n]PPara[d,-m](3/4)((1/3)(2G[-i,l]G[-j,n]G[-k,m]-G[-j,l]G[-k,n]G[-i,m]-G[-k,l]G[-i,n]G[-j,m])-Antisymmetrize[G[-i,-k]G[-j,n]G[l,m],{-i,-j}])/.PADMActivate//ToCanonical;
PR0pDefinition=PPara[-e,-g]PPara[-f,-h]/.PADMActivate//ToCanonical;
PR0mDefinition=PPara[-i,-e]PPara[-j,-f]PPara[-k,-g]epsilonG[i,j,k,p]V[-p]/.PADMActivate//ToCanonical;
PR1pDefinition=PPara[-e,-g]Antisymmetrize[PPara[-n,-f]PPara[-m,-h],{-n,-m}]/.PADMActivate//ToCanonical;
PR1mDefinition=PPara[-e,-g]PPara[-n,-f]/.PADMActivate//ToCanonical;
PR2pDefinition=PPara[-e,-g](Symmetrize[PPara[-n,-f]PPara[-m,-h],{-n,-m}]-(1/3)PPara[-n,-m]PPara[-f,-h])/.PADMActivate//ToCanonical;
PR2mDefinition=PPara[-a,i]PPara[-b,j]PPara[-c,k]PPara[e,-l]PPara[f,-n]PPara[d,-m](3/4)((1/3)(2G[-i,l]G[-j,n]G[-k,m]-G[-j,l]G[-k,n]G[-i,m]-G[-k,l]G[-i,n]G[-j,m])-Antisymmetrize[G[-i,-k]G[-j,n]G[l,m],{-i,-j}])/.PADMActivate//ToCanonical;
PT0mActivate=MakeRule[{PT0m[d,e,f],Evaluate[PT0mDefinition]},MetricOn->All,ContractMetrics->True];
PT1pActivate=MakeRule[{PT1p[-a,-b,c,d],Evaluate[PT1pDefinition]},MetricOn->All,ContractMetrics->True];
PT1mActivate=MakeRule[{PT1m[-a,d,e,f],Evaluate[PT1mDefinition]},MetricOn->All,ContractMetrics->True];
PT2mActivate=MakeRule[{PT2m[-a,-b,-c,d,e,f],Evaluate[PT2mDefinition]},MetricOn->All,ContractMetrics->True];
PR0pActivate=MakeRule[{PR0p[-e,-f,-g,-h],Evaluate[PR0pDefinition]},MetricOn->All,ContractMetrics->True];
PR0mActivate=MakeRule[{PR0m[-e,-f,-g],Evaluate[PR0mDefinition]},MetricOn->All,ContractMetrics->True];
PR1pActivate=MakeRule[{PR1p[-n,-m,-e,-f,-g,-h],Evaluate[PR1pDefinition]},MetricOn->All,ContractMetrics->True];
PR1mActivate=MakeRule[{PR1m[-n,-e,-f,-g],Evaluate[PR1mDefinition]},MetricOn->All,ContractMetrics->True];
PR2pActivate=MakeRule[{PR2p[-n,-m,-e,-f,-g,-h],Evaluate[PR2pDefinition]},MetricOn->All,ContractMetrics->True];
PR2mActivate=MakeRule[{PR2m[-a,-b,-c,d,e,f],Evaluate[PR2mDefinition]},MetricOn->All,ContractMetrics->True];

(*These rules then expand those canonical field strength O(3) projection operators*)
PO3TActivate=Join[PT0mActivate,PT1pActivate,PT1mActivate,PT2mActivate];
PO3RActivate=Join[PR0pActivate,PR0mActivate,PR1pActivate,PR1mActivate,PR2pActivate,PR2mActivate];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
DefConstantSymbol[cParaA0p,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(A0\), \(+\)], \(\[DoubleVerticalBar]\)]\)"];
DefConstantSymbol[cParaA0m,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(A0\), \(-\)], \(\[DoubleVerticalBar]\)]\)"];
DefConstantSymbol[cParaA1p,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(A1\), \(+\)], \(\[DoubleVerticalBar]\)]\)"];
DefConstantSymbol[cParaA1m,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(A1\), \(-\)], \(\[DoubleVerticalBar]\)]\)"];
DefConstantSymbol[cParaA2p,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(A2\), \(+\)], \(\[DoubleVerticalBar]\)]\)"];
DefConstantSymbol[cParaA2m,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(A2\), \(-\)], \(\[DoubleVerticalBar]\)]\)"];

DefConstantSymbol[cParaB0p,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(b0\), \(+\)], \(\[DoubleVerticalBar]\)]\)"];
DefConstantSymbol[cParaB0m,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(b0\), \(-\)], \(\[DoubleVerticalBar]\)]\)"];
DefConstantSymbol[cParaB1p,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(b1\), \(+\)], \(\[DoubleVerticalBar]\)]\)"];
DefConstantSymbol[cParaB1m,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(b1\), \(-\)], \(\[DoubleVerticalBar]\)]\)"];
DefConstantSymbol[cParaB2p,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(b2\), \(+\)], \(\[DoubleVerticalBar]\)]\)"];
DefConstantSymbol[cParaB2m,PrintAs->"\!\(\*SubsuperscriptBox[\(c\), SuperscriptBox[\(b2\), \(-\)], \(\[DoubleVerticalBar]\)]\)"];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
DefConstantSymbol[AlpPerpPara0p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(0\), \(+\)], \(\(\[UpTee]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];
DefConstantSymbol[AlpPerpPara0m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(0\), \(-\)], \(\(\[UpTee]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];
DefConstantSymbol[AlpPerpPara1p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(1\), \(+\)], \(\(\[UpTee]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];
DefConstantSymbol[AlpPerpPara1m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(1\), \(-\)], \(\(\[UpTee]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];
DefConstantSymbol[AlpPerpPara2p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(2\), \(+\)], \(\(\[UpTee]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];
DefConstantSymbol[AlpPerpPara2m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(2\), \(-\)], \(\(\[UpTee]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];

AlpPerpPara={AlpPerpPara0p,AlpPerpPara0m,AlpPerpPara1p,AlpPerpPara1m,AlpPerpPara2p,AlpPerpPara2m};

DefConstantSymbol[BetPerpPara0p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(0\), \(+\)], \(\(\[UpTee]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];
DefConstantSymbol[BetPerpPara0m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(0\), \(-\)], \(\(\[UpTee]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];
DefConstantSymbol[BetPerpPara1p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(1\), \(+\)], \(\(\[UpTee]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];
DefConstantSymbol[BetPerpPara1m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(1\), \(-\)], \(\(\[UpTee]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];
DefConstantSymbol[BetPerpPara2p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(2\), \(+\)], \(\(\[UpTee]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];
DefConstantSymbol[BetPerpPara2m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(2\), \(-\)], \(\(\[UpTee]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];

BetPerpPara={BetPerpPara0p,BetPerpPara0m,BetPerpPara1p,BetPerpPara1m,BetPerpPara2p,BetPerpPara2m};
xAct`HiGGS`Private`ClearBuild[];

(*
xAct`HiGGS`Private`IfBuild["TransferCouplingsPerpPara"];
OpenLastCache[];
*)

(* ::Input::Initialization:: *)
DefConstantSymbol[AlpParaPerp0p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(0\), \(+\)], \(\(\[DoubleVerticalBar]\)\(\[UpTee]\)\)]\)",$Coupling]];
DefConstantSymbol[AlpParaPerp0m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(0\), \(-\)], \(\(\[DoubleVerticalBar]\)\(\[UpTee]\)\)]\)",$Coupling]];
DefConstantSymbol[AlpParaPerp1p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(1\), \(+\)], \(\(\[DoubleVerticalBar]\)\(\[UpTee]\)\)]\)",$Coupling]];
DefConstantSymbol[AlpParaPerp1m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(1\), \(-\)], \(\(\[DoubleVerticalBar]\)\(\[UpTee]\)\)]\)",$Coupling]];
DefConstantSymbol[AlpParaPerp2p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(2\), \(+\)], \(\(\[DoubleVerticalBar]\)\(\[UpTee]\)\)]\)",$Coupling]];
DefConstantSymbol[AlpParaPerp2m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(2\), \(-\)], \(\(\[DoubleVerticalBar]\)\(\[UpTee]\)\)]\)",$Coupling]];

AlpParaPerp={AlpParaPerp0p,AlpParaPerp0m,AlpParaPerp1p,AlpParaPerp1m,AlpParaPerp2p,AlpParaPerp2m};

DefConstantSymbol[BetParaPerp0p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(0\), \(+\)], \(\(\[DoubleVerticalBar]\)\(\[UpTee]\)\)]\)",$Coupling]];
DefConstantSymbol[BetParaPerp0m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(0\), \(-\)], \(\(\[DoubleVerticalBar]\)\(\[UpTee]\)\)]\)",$Coupling]];
DefConstantSymbol[BetParaPerp1p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(1\), \(+\)], \(\(\[DoubleVerticalBar]\)\(\[UpTee]\)\)]\)",$Coupling]];
DefConstantSymbol[BetParaPerp1m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(1\), \(-\)], \(\(\[DoubleVerticalBar]\)\(\[UpTee]\)\)]\)",$Coupling]];
DefConstantSymbol[BetParaPerp2p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(2\), \(+\)], \(\(\[DoubleVerticalBar]\)\(\[UpTee]\)\)]\)",$Coupling]];
DefConstantSymbol[BetParaPerp2m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(2\), \(-\)], \(\(\[DoubleVerticalBar]\)\(\[UpTee]\)\)]\)",$Coupling]];

BetParaPerp={BetParaPerp0p,BetParaPerp0m,BetParaPerp1p,BetParaPerp1m,BetParaPerp2p,BetParaPerp2m};
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
DefConstantSymbol[AlpParaPara0p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(0\), \(+\)], \(\(\[DoubleVerticalBar]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];
DefConstantSymbol[AlpParaPara0m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(0\), \(-\)], \(\(\[DoubleVerticalBar]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];
DefConstantSymbol[AlpParaPara1p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(1\), \(+\)], \(\(\[DoubleVerticalBar]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];
DefConstantSymbol[AlpParaPara1m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(1\), \(-\)], \(\(\[DoubleVerticalBar]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];
DefConstantSymbol[AlpParaPara2p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(2\), \(+\)], \(\(\[DoubleVerticalBar]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];
DefConstantSymbol[AlpParaPara2m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Alpha]\), \(^\)], SuperscriptBox[\(2\), \(-\)], \(\(\[DoubleVerticalBar]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];

AlpParaPara={AlpParaPara0p,AlpParaPara0m,AlpParaPara1p,AlpParaPara1m,AlpParaPara2p,AlpParaPara2m};

DefConstantSymbol[BetParaPara0p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(0\), \(+\)], \(\(\[DoubleVerticalBar]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];
DefConstantSymbol[BetParaPara0m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(0\), \(-\)], \(\(\[DoubleVerticalBar]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];
DefConstantSymbol[BetParaPara1p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(1\), \(+\)], \(\(\[DoubleVerticalBar]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];
DefConstantSymbol[BetParaPara1m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(1\), \(-\)], \(\(\[DoubleVerticalBar]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];
DefConstantSymbol[BetParaPara2p,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(2\), \(+\)], \(\(\[DoubleVerticalBar]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];
DefConstantSymbol[BetParaPara2m,PrintAs->Colour["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[Beta]\), \(^\)], SuperscriptBox[\(2\), \(-\)], \(\(\[DoubleVerticalBar]\)\(\[DoubleVerticalBar]\)\)]\)",$Coupling]];

BetParaPara={BetParaPara0p,BetParaPara0m,BetParaPara1p,BetParaPara1m,BetParaPara2p,BetParaPara2m};
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
AlpDetRelations={AlpParaPara0p==(Alp4+Alp6)/2,
AlpParaPara0m==(Alp2+Alp3)/2,
AlpParaPara1p==-(Alp2+Alp5)/2,
AlpParaPara1m==(Alp4+Alp5)/2,
AlpParaPara2p==(Alp1+Alp4)/2,
AlpParaPara2m==-(Alp1+Alp2)/2,
AlpPerpPara0p==-(Alp4-Alp6)/4,
AlpPerpPara0m==(Alp2-Alp3)/2,
AlpPerpPara1p==-(Alp2-Alp5)/2,
AlpPerpPara1m==(Alp4-Alp5)/2,
AlpPerpPara2p==(Alp1-Alp4)/2,
AlpPerpPara2m==-(Alp1-Alp2)/2,
AlpParaPerp0p==-(Alp4-Alp6)/2,
AlpParaPerp0m==(Alp2-Alp3)/4,
AlpParaPerp1p==(Alp2-Alp5)/4,
AlpParaPerp1m==(Alp4-Alp5)/4,
AlpParaPerp2p==(Alp1-Alp4)/4,
AlpParaPerp2m==-(Alp1-Alp2)/4,
AlpPerpPerp0p==(Alp4+Alp6)/4,
AlpPerpPerp0m==(Alp2+Alp3)/4,
AlpPerpPerp1p==(Alp2+Alp5)/4,
AlpPerpPerp1m==(Alp4+Alp5)/4,
AlpPerpPerp2p==(Alp1+Alp4)/4,
AlpPerpPerp2m==-(Alp1+Alp2)/4};

BetDetRelations={BetParaPara0p==0,
BetParaPara0m==Bet3/6,
BetParaPara1p==(2Bet1+Bet3)/3,
BetParaPara1m==(Bet1+2Bet2)/3,
BetParaPara2p==0,
BetParaPara2m==Bet1,
BetPerpPara0p==0,
BetPerpPara0m==0,
BetPerpPara1p==-(Bet1-Bet3)/3,
BetPerpPara1m==-(Bet1-Bet2)/3,
BetPerpPara2p==0,
BetPerpPara2m==0,
BetParaPerp0p==0,
BetParaPerp0m==0,
BetParaPerp1p==-(Bet1-Bet3)/3,
BetParaPerp1m==-(Bet1-Bet2)/3,
BetParaPerp2p==0,
BetParaPerp2m==0,
BetPerpPerp0p==Bet2/2,
BetPerpPerp0m==0,
BetPerpPerp1p==(Bet1+2Bet3)/6,
BetPerpPerp1m==(2Bet1+Bet2)/6,
BetPerpPerp2p==Bet1/2,
BetPerpPerp2m==0};

AlpDeterminants={AlpParaPara0p AlpPerpPerp0p-AlpParaPerp0p AlpPerpPara0p,
AlpParaPara0m AlpPerpPerp0m-AlpParaPerp0m AlpPerpPara0m,
AlpParaPara1p AlpPerpPerp1p-AlpParaPerp1p AlpPerpPara1p,
AlpParaPara1m AlpPerpPerp1m-AlpParaPerp1m AlpPerpPara1m,
AlpParaPara2p AlpPerpPerp2p-AlpParaPerp2p AlpPerpPara2p,
AlpParaPara2m AlpPerpPerp2m-AlpParaPerp2m AlpPerpPara2m};

BetDeterminants={BetParaPara0p BetPerpPerp0p-BetParaPerp0p BetPerpPara0p,
BetParaPara0m BetPerpPerp0m-BetParaPerp0m BetPerpPara0m,
BetParaPara1p BetPerpPerp1p-BetParaPerp1p BetPerpPara1p,
BetParaPara1m BetPerpPerp1m-BetParaPerp1m BetPerpPara1m,
BetParaPara2p BetPerpPerp2p-BetParaPerp2p BetPerpPara2p,
BetParaPara2m BetPerpPerp2m-BetParaPerp2m BetPerpPara2m};

ToAlp=SolveConstants[AlpDetRelations,Join[AlpPerpPara,AlpPerpPerp,AlpParaPara,AlpParaPerp]][[1]];

ToBet=SolveConstants[BetDetRelations,Join[BetPerpPara,BetPerpPerp,BetParaPara,BetParaPerp]][[1]];

cAlpDetRelations={cAlpParaPara0p==(cAlp4+cAlp6)/2,
cAlpParaPara0m==(cAlp2+cAlp3)/2,
cAlpParaPara1p==-(cAlp2+cAlp5)/2,
cAlpParaPara1m==(cAlp4+cAlp5)/2,
cAlpParaPara2p==(cAlp1+cAlp4)/2,
cAlpParaPara2m==-(cAlp1+cAlp2)/2,
cAlpPerpPara0p==-(cAlp4-cAlp6)/4,
cAlpPerpPara0m==(cAlp2-cAlp3)/2,
cAlpPerpPara1p==-(cAlp2-cAlp5)/2,
cAlpPerpPara1m==(cAlp4-cAlp5)/2,
cAlpPerpPara2p==(cAlp1-cAlp4)/2,
cAlpPerpPara2m==-(cAlp1-cAlp2)/2,
cAlpParaPerp0p==-(cAlp4-cAlp6)/2,
cAlpParaPerp0m==(cAlp2-cAlp3)/4,
cAlpParaPerp1p==(cAlp2-cAlp5)/4,
cAlpParaPerp1m==(cAlp4-cAlp5)/4,
cAlpParaPerp2p==(cAlp1-cAlp4)/4,
cAlpParaPerp2m==-(cAlp1-cAlp2)/4,
cAlpPerpPerp0p==(cAlp4+cAlp6)/4,
cAlpPerpPerp0m==(cAlp2+cAlp3)/4,
cAlpPerpPerp1p==(cAlp2+cAlp5)/4,
cAlpPerpPerp1m==(cAlp4+cAlp5)/4,
cAlpPerpPerp2p==(cAlp1+cAlp4)/4,
cAlpPerpPerp2m==-(cAlp1+cAlp2)/4};

cBetDetRelations={cBetParaPara0p==0,
cBetParaPara0m==cBet3/6,
cBetParaPara1p==(2cBet1+cBet3)/3,
cBetParaPara1m==(cBet1+2cBet2)/3,
cBetParaPara2p==0,
cBetParaPara2m==cBet1,
cBetPerpPara0p==0,
cBetPerpPara0m==0,
cBetPerpPara1p==-(cBet1-cBet3)/3,
cBetPerpPara1m==-(cBet1-cBet2)/3,
cBetPerpPara2p==0,
cBetPerpPara2m==0,
cBetParaPerp0p==0,
cBetParaPerp0m==0,
cBetParaPerp1p==-(cBet1-cBet3)/3,
cBetParaPerp1m==-(cBet1-cBet2)/3,
cBetParaPerp2p==0,
cBetParaPerp2m==0,
cBetPerpPerp0p==cBet2/2,
cBetPerpPerp0m==0,
cBetPerpPerp1p==(cBet1+2cBet3)/6,
cBetPerpPerp1m==(2cBet1+cBet2)/6,
cBetPerpPerp2p==cBet1/2,
cBetPerpPerp2m==0};

cAlpDeterminants={cAlpParaPara0p cAlpPerpPerp0p-cAlpParaPerp0p cAlpPerpPara0p,
cAlpParaPara0m cAlpPerpPerp0m-cAlpParaPerp0m cAlpPerpPara0m,
cAlpParaPara1p cAlpPerpPerp1p-cAlpParaPerp1p cAlpPerpPara1p,
cAlpParaPara1m cAlpPerpPerp1m-cAlpParaPerp1m cAlpPerpPara1m,
cAlpParaPara2p cAlpPerpPerp2p-cAlpParaPerp2p cAlpPerpPara2p,
cAlpParaPara2m cAlpPerpPerp2m-cAlpParaPerp2m cAlpPerpPara2m};

cBetDeterminants={cBetParaPara0p cBetPerpPerp0p-cBetParaPerp0p cBetPerpPara0p,
cBetParaPara0m cBetPerpPerp0m-cBetParaPerp0m cBetPerpPara0m,
cBetParaPara1p cBetPerpPerp1p-cBetParaPerp1p cBetPerpPara1p,
cBetParaPara1m cBetPerpPerp1m-cBetParaPerp1m cBetPerpPara1m,
cBetParaPara2p cBetPerpPerp2p-cBetParaPerp2p cBetPerpPara2p,
cBetParaPara2m cBetPerpPerp2m-cBetParaPerp2m cBetPerpPara2m};

TocAlp=SolveConstants[cAlpDetRelations,Join[cAlpPerpPara,cAlpPerpPerp,cAlpParaPara,cAlpParaPerp]][[1]];

TocBet=SolveConstants[cBetDetRelations,Join[cBetPerpPara,cBetPerpPerp,cBetParaPara,cBetParaPerp]][[1]];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
(*Projections to break the field strengths up into canonical and non-canonical parts*)
DefTensor[PPerpTPerp[-e,a,b],M4];
DefTensor[PPerpTPara[-e,-f,a,b],M4];
DefTensor[PPerpRPerp[-e,-f,a,b,c],M4];
DefTensor[PPerpRPara[-e,-f,-g,a,b,c],M4];
PPerpTPerpDefinition=V[a]PPara[-e,b]/.PADMActivate//ToCanonical;
PPerpTPerpActivate=MakeRule[{PPerpTPerp[-e,a,b],Evaluate[PPerpTPerpDefinition]},MetricOn->All,ContractMetrics->True];
PPerpTParaDefinition=PPara[-e,a]PPara[-f,b]/.PADMActivate//ToCanonical;
PPerpTParaActivate=MakeRule[{PPerpTPara[-e,-f,a,b],Evaluate[PPerpTParaDefinition]},MetricOn->All,ContractMetrics->True];
PPerpRPerpDefinition=V[a]PPara[-e,b]PPara[-f,c]/.PADMActivate//ToCanonical;
PPerpRPerpActivate=MakeRule[{PPerpRPerp[-e,-f,a,b,c],Evaluate[PPerpRPerpDefinition]},MetricOn->All,ContractMetrics->True];
PPerpRParaDefinition=PPara[-e,a]PPara[-f,b]PPara[-g,c]/.PADMActivate//ToCanonical;
PPerpRParaActivate=MakeRule[{PPerpRPara[-e,-f,-g,a,b,c],Evaluate[PPerpRParaDefinition]},MetricOn->All,ContractMetrics->True];
PPerpADMTActivate=Join[PPerpTPerpActivate,PPerpTParaActivate];
PPerpADMRActivate=Join[PPerpRPerpActivate,PPerpRParaActivate];

(*Projection operators which define the O(3) decomposition of the canonical parts of field strengths*)
DefTensor[PPerpT0p[e,f],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PTSymb,xAct`HiGGS`Private`Spin0p]];
DefTensor[PPerpT1p[-a,-b,e,f],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PTSymb,xAct`HiGGS`Private`Spin1p]];
DefTensor[PPerpT1m[-a,e,f],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PTSymb,xAct`HiGGS`Private`Spin1m]];
DefTensor[PPerpT2p[-a,-b,e,f],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PTSymb,xAct`HiGGS`Private`Spin2p]];

DefTensor[PPerpR0p[e,f],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PRSymb,xAct`HiGGS`Private`Spin0p]];
DefTensor[PPerpR0m[e,f,g],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PRSymb,xAct`HiGGS`Private`Spin0m]];
DefTensor[PPerpR1p[-n,-m,e,f],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PRSymb,xAct`HiGGS`Private`Spin1p]];
DefTensor[PPerpR1m[-n,e,f,g],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PRSymb,xAct`HiGGS`Private`Spin1m]];
DefTensor[PPerpR2p[-n,-m,e,f],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PRSymb,xAct`HiGGS`Private`Spin2p]];
DefTensor[PPerpR2m[-n,-m,-o,e,f,g],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PRSymb,xAct`HiGGS`Private`Spin2m]];

PPerpT0pDefinition=PPara[e,f]/.PADMActivate//ToCanonical;
PPerpT1pDefinition=Antisymmetrize[PPara[-n,e]PPara[-m,f],{-n,-m}]/.PADMActivate//ToCanonical;
PPerpT1mDefinition=PPara[-n,e]/.PADMActivate//ToCanonical;
PPerpT2pDefinition=(Symmetrize[PPara[-n,e]PPara[-m,f],{-n,-m}]-(1/3)PPara[-n,-m]PPara[e,f])/.PADMActivate//ToCanonical;

PPerpR0pDefinition=-PPara[e,f]/.PADMActivate//ToCanonical;
PPerpR0mDefinition=PPara[-i,e]PPara[-j,f]PPara[-k,g]epsilonG[i,j,k,p]V[-p]/.PADMActivate//ToCanonical;
PPerpR1pDefinition=Antisymmetrize[PPara[-n,e]PPara[-m,f],{-n,-m}]/.PADMActivate//ToCanonical;
PPerpR1mDefinition=PPara[e,g]PPara[-n,f]/.PADMActivate//ToCanonical;
PPerpR2pDefinition=(Symmetrize[PPara[-n,e]PPara[-m,f],{-n,-m}]-(1/3)PPara[-n,-m]PPara[e,f])/.PADMActivate//ToCanonical;
PPerpR2mDefinition=PPara[-a,i]PPara[-b,j]PPara[-c,k]PPara[e,-l]PPara[f,-n]PPara[d,-m](3/4)((1/3)(2G[-i,l]G[-j,n]G[-k,m]-G[-j,l]G[-k,n]G[-i,m]-G[-k,l]G[-i,n]G[-j,m])-Antisymmetrize[G[-i,-k]G[-j,n]G[l,m],{-i,-j}])/.PADMActivate//ToCanonical;

PPerpT0pActivate=MakeRule[{PPerpT0p[e,f],Evaluate[PPerpT0pDefinition]},MetricOn->All,ContractMetrics->True];
PPerpT1pActivate=MakeRule[{PPerpT1p[-n,-m,e,f],Evaluate[PPerpT1pDefinition]},MetricOn->All,ContractMetrics->True];
PPerpT1mActivate=MakeRule[{PPerpT1m[-n,e],Evaluate[PPerpT1mDefinition]},MetricOn->All,ContractMetrics->True];
PPerpT2pActivate=MakeRule[{PPerpT2p[-n,-m,e,f],Evaluate[PPerpT2pDefinition]},MetricOn->All,ContractMetrics->True];

PPerpR0pActivate=MakeRule[{PPerpR0p[e,f],Evaluate[PPerpR0pDefinition]},MetricOn->All,ContractMetrics->True];
PPerpR0mActivate=MakeRule[{PPerpR0m[e,f,g],Evaluate[PPerpR0mDefinition]},MetricOn->All,ContractMetrics->True];
PPerpR1pActivate=MakeRule[{PPerpR1p[-n,-m,e,f],Evaluate[PPerpR1pDefinition]},MetricOn->All,ContractMetrics->True];
PPerpR1mActivate=MakeRule[{PPerpR1m[-n,e,f,g],Evaluate[PPerpR1mDefinition]},MetricOn->All,ContractMetrics->True];
PPerpR2pActivate=MakeRule[{PPerpR2p[-n,-m,e,f],Evaluate[PPerpR2pDefinition]},MetricOn->All,ContractMetrics->True];
PPerpR2mActivate=MakeRule[{PPerpR2m[-a,-b,-c,e,f,d],Evaluate[PPerpR2mDefinition]},MetricOn->All,ContractMetrics->True];

(*These rules then expand those canonical field strength O(3) projection operators*)
PPerpO3TActivate=Join[PPerpT0pActivate,PPerpT1pActivate,PPerpT1mActivate,PPerpT2pActivate];
PPerpO3RActivate=Join[PPerpR0pActivate,PPerpR0mActivate,PPerpR1pActivate,PPerpR1mActivate,PPerpR2pActivate,PPerpR2mActivate];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
PhiBSymb="\!\(\*SubscriptBox[\(\[Phi]\), \(\[ScriptB]\)]\)";
DefTensor[PhiB0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PhiBSymb,xAct`HiGGS`Private`Spin0p]];
xAct`HiGGS`Private`DeclareOrder[PhiB0p[],1];
DefTensor[PhiB1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[PhiBSymb,xAct`HiGGS`Private`Spin1p]];\[InvisiblePrefixScriptBase]
xAct`HiGGS`Private`DeclareOrder[PhiB1p[-a,-b],1];
DefTensor[PhiB1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PhiBSymb,xAct`HiGGS`Private`Spin1m]];
xAct`HiGGS`Private`DeclareOrder[PhiB1m[-a],1];
DefTensor[PhiB2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[PhiBSymb,xAct`HiGGS`Private`Spin2p]];
xAct`HiGGS`Private`DeclareOrder[PhiB2p[-a,-b],1];
PhiASymb="\!\(\*SubscriptBox[\(\[Phi]\), \(\[ScriptCapitalA]\)]\)";
DefTensor[PhiA0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PhiASymb,xAct`HiGGS`Private`Spin0p]];
xAct`HiGGS`Private`DeclareOrder[PhiA0p[],1,"IsUnityWithEHTerm"->True];
DefTensor[PhiA0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PhiASymb,xAct`HiGGS`Private`Spin0m]];
xAct`HiGGS`Private`DeclareOrder[PhiA0m[],1];
DefTensor[PhiA1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[PhiASymb,xAct`HiGGS`Private`Spin1p]];
xAct`HiGGS`Private`DeclareOrder[PhiA1p[-a,-b],1];
DefTensor[PhiA1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PhiASymb,xAct`HiGGS`Private`Spin1m]];
xAct`HiGGS`Private`DeclareOrder[PhiA1m[-a],1];
DefTensor[PhiA2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[PhiASymb,xAct`HiGGS`Private`Spin2p]];
xAct`HiGGS`Private`DeclareOrder[PhiA2p[-a,-b],1];
DefTensor[PhiA2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[PhiASymb,xAct`HiGGS`Private`Spin2m]];
xAct`HiGGS`Private`DeclareOrder[PhiA2m[-a,-b,-c],1];
AutomaticRules[PhiA2m,MakeRule[{PhiA2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[PhiA2m,MakeRule[{epsilonG[a,b,c,d]PhiA2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];

DefTensor[BPhi[-a,-c],M4];
xAct`HiGGS`Private`DeclareOrder[BPhi[-a,-c],1];
BPhiDefinition=Ji[]BPi[-i,z]G3[-z,a]B[-k,-a]-
4V[g]B[-k,-o]G3[o,-z]H[h,z](Bet1 PT1[-i,-g,-h,a,c,d]+Bet2 PT2[-i,-g,-h,a,c,d]+Bet3 PT3[-i,-g,-h,a,c,d])PPara[-c,m]PPara[-d,n]T[-a,-m,-n]-
2V[g]B[-k,-o]G3[o,-z]H[h,z](cBet1 PT1[-i,-g,-h,a,c,d]+cBet2 PT2[-i,-g,-h,a,c,d]+cBet3 PT3[-i,-g,-h,a,c,d])PPara[-c,m]PPara[-d,n]TLambda[-a,-m,-n]-
2V[g]B[-k,-o]G3[o,-z]H[h,z](cBet1 PT1[-i,-g,-h,a,c,d]+cBet2 PT2[-i,-g,-h,a,c,d]+cBet3 PT3[-i,-g,-h,a,c,d])(PPerp[-c,m]PPara[-d,n]TLambda[-a,-m,-n]+PPara[-c,m]PPerp[-d,n]TLambda[-a,-m,-n]);
BPhiActivate=MakeRule[{BPhi[-i,-k],Evaluate[BPhiDefinition]},MetricOn->All,ContractMetrics->True];

DefTensor[APhi[-a,-b,-c],M4,Antisymmetric[{-a,-b}]];
xAct`HiGGS`Private`DeclareOrder[APhi[-a,-b,-c],1,"IsUnityWithEHTerm"->True];
APhiDefinition=Ji[]APi[-i,-j,z]G3[-z,a]B[-k,-a]+
2Alp0 Antisymmetrize[ V[-i]PPara[-j,-k],{-i,-j}]-
8V[g]B[-k,-o]G3[o,-z]H[h,z](Alp1 PR1[-i,-j,-g,-h,a,b,c,d]+Alp2 PR2[-i,-j,-g,-h,a,b,c,d]+Alp3 PR3[-i,-j,-g,-h,a,b,c,d]+Alp4 PR4[-i,-j,-g,-h,a,b,c,d]+Alp5 PR5[-i,-j,-g,-h,a,b,c,d]+Alp6 PR6[-i,-j,-g,-h,a,b,c,d])PPara[-c,m]PPara[-d,n]R[-a,-b,-m,-n]-4V[g]B[-k,-o]G3[o,-z]H[h,z](cAlp1 PR1[-i,-j,-g,-h,a,b,c,d]+cAlp2 PR2[-i,-j,-g,-h,a,b,c,d]+cAlp3 PR3[-i,-j,-g,-h,a,b,c,d]+cAlp4 PR4[-i,-j,-g,-h,a,b,c,d]+cAlp5 PR5[-i,-j,-g,-h,a,b,c,d]+cAlp6 PR6[-i,-j,-g,-h,a,b,c,d])PPara[-c,m]PPara[-d,n]RLambda[-a,-b,-m,-n]-
4V[g]B[-k,-o]G3[o,-z]H[h,z](cAlp1 PR1[-i,-j,-g,-h,a,b,c,d]+cAlp2 PR2[-i,-j,-g,-h,a,b,c,d]+cAlp3 PR3[-i,-j,-g,-h,a,b,c,d]+cAlp4 PR4[-i,-j,-g,-h,a,b,c,d]+cAlp5 PR5[-i,-j,-g,-h,a,b,c,d]+cAlp6 PR6[-i,-j,-g,-h,a,b,c,d])(PPerp[-c,m]PPara[-d,n]RLambda[-a,-b,-m,-n]+PPara[-c,m]PPerp[-d,n]RLambda[-a,-b,-m,-n]);
APhiActivate=MakeRule[{APhi[-i,-j,-k],Evaluate[APhiDefinition]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`ClearBuild[];

xAct`HiGGS`Private`IfBuild["CanonicalPhi"];
OpenLastCache[];

(* ::Input::Initialization:: *)
BPhiNonCanonicalDefinition=4V[g]B[-k,-o]G3[o,-z]H[h,z](Bet1 PT1[-i,-g,-h,a,c,d]+Bet2 PT2[-i,-g,-h,a,c,d]+Bet3 PT3[-i,-g,-h,a,c,d])(PPerp[-c,m]PPara[-d,n]T[-a,-m,-n]+PPara[-c,m]PPerp[-d,n]T[-a,-m,-n]);
BPhiNonCanonicalActivate=MakeRule[{BPhi[-i,-k],Evaluate[BPhiNonCanonicalDefinition]},MetricOn->All,ContractMetrics->True];

APhiNonCanonicalDefinition=8V[g]B[-k,-o]G3[o,-z]H[h,z](Alp1 PR1[-i,-j,-g,-h,a,b,c,d]+Alp2 PR2[-i,-j,-g,-h,a,b,c,d]+Alp3 PR3[-i,-j,-g,-h,a,b,c,d]+Alp4 PR4[-i,-j,-g,-h,a,b,c,d]+Alp5 PR5[-i,-j,-g,-h,a,b,c,d]+Alp6 PR6[-i,-j,-g,-h,a,b,c,d])(PPerp[-c,m]PPara[-d,n]R[-a,-b,-m,-n]+PPara[-c,m]PPerp[-d,n]R[-a,-b,-m,-n]);
APhiNonCanonicalActivate=MakeRule[{APhi[-i,-j,-k],Evaluate[APhiNonCanonicalDefinition]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`ClearBuild[];


xAct`HiGGS`Private`IfBuild["NonCanonicalPhi"];
OpenLastCache[];


(* ::Input::Initialization:: *)
ChiBSymb="\!\(\*SubscriptBox[\(\[Chi]\), \(\[ScriptB]\)]\)";
DefTensor[ChiB0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiBSymb,xAct`HiGGS`Private`Spin0p]];
xAct`HiGGS`Private`DeclareOrder[ChiB0p[],1];
DefTensor[ChiB1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiBSymb,xAct`HiGGS`Private`Spin1p]];
xAct`HiGGS`Private`DeclareOrder[ChiB1p[-a,-b],1];
DefTensor[ChiB1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiBSymb,xAct`HiGGS`Private`Spin1m]];
xAct`HiGGS`Private`DeclareOrder[ChiB1m[-a],1];
DefTensor[ChiB2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiBSymb,xAct`HiGGS`Private`Spin2p]];
xAct`HiGGS`Private`DeclareOrder[ChiB2p[-a,-b],1];
ChiASymb="\!\(\*SubscriptBox[\(\[Chi]\), \(\[ScriptCapitalA]\)]\)";
DefTensor[ChiA0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiASymb,xAct`HiGGS`Private`Spin0p]];
xAct`HiGGS`Private`DeclareOrder[ChiA0p[],1];
DefTensor[ChiA0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiASymb,xAct`HiGGS`Private`Spin0m]];
xAct`HiGGS`Private`DeclareOrder[ChiA0m[],1];
DefTensor[ChiA1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiASymb,xAct`HiGGS`Private`Spin1p]];
xAct`HiGGS`Private`DeclareOrder[ChiA1p[-a,-b],1];
DefTensor[ChiA1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiASymb,xAct`HiGGS`Private`Spin1m]];
xAct`HiGGS`Private`DeclareOrder[ChiA1m[-a],1];
DefTensor[ChiA2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiASymb,xAct`HiGGS`Private`Spin2p]];
xAct`HiGGS`Private`DeclareOrder[ChiA2p[-a,-b],1];
DefTensor[ChiA2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiASymb,xAct`HiGGS`Private`Spin2m]];
xAct`HiGGS`Private`DeclareOrder[ChiA2m[-a,-b,-c],1];
AutomaticRules[ChiA2m,MakeRule[{ChiA2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[ChiA2m,MakeRule[{epsilonG[a,b,c,d]ChiA2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
ChiPerpBSymb="\!\(\*SubsuperscriptBox[\(\[Chi]\), \(\[ScriptB]\), \(\[UpTee]\)]\)";
DefTensor[ChiPerpB0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiPerpBSymb,xAct`HiGGS`Private`Spin0p]];
xAct`HiGGS`Private`DeclareOrder[ChiPerpB0p[],1];
DefTensor[ChiPerpB1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiPerpBSymb,xAct`HiGGS`Private`Spin1p]];
xAct`HiGGS`Private`DeclareOrder[ChiPerpB1p[-a,-b],1];
DefTensor[ChiPerpB1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiPerpBSymb,xAct`HiGGS`Private`Spin1m]];
xAct`HiGGS`Private`DeclareOrder[ChiPerpB1m[-a],1];
DefTensor[ChiPerpB2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiPerpBSymb,xAct`HiGGS`Private`Spin2p]];
xAct`HiGGS`Private`DeclareOrder[ChiPerpB2p[-a,-b],1];
ChiPerpASymb="\!\(\*SubsuperscriptBox[\(\[Chi]\), \(\[ScriptCapitalA]\), \(\[UpTee]\)]\)";
DefTensor[ChiPerpA0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiPerpASymb,xAct`HiGGS`Private`Spin0p]];
xAct`HiGGS`Private`DeclareOrder[ChiPerpA0p[],1];
DefTensor[ChiPerpA0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiPerpASymb,xAct`HiGGS`Private`Spin0m]];
xAct`HiGGS`Private`DeclareOrder[ChiPerpA0m[],1];
DefTensor[ChiPerpA1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiPerpASymb,xAct`HiGGS`Private`Spin1p]];
xAct`HiGGS`Private`DeclareOrder[ChiPerpA1p[-a,-b],1];
DefTensor[ChiPerpA1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiPerpASymb,xAct`HiGGS`Private`Spin1m]];
xAct`HiGGS`Private`DeclareOrder[ChiPerpA1m[-a],1];
DefTensor[ChiPerpA2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiPerpASymb,xAct`HiGGS`Private`Spin2p]];
xAct`HiGGS`Private`DeclareOrder[ChiPerpA2p[-a,-b],1];
DefTensor[ChiPerpA2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiPerpASymb,xAct`HiGGS`Private`Spin2m]];
xAct`HiGGS`Private`DeclareOrder[ChiPerpA2m[-a,-b,-c],1];
AutomaticRules[ChiPerpA2m,MakeRule[{ChiPerpA2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[ChiPerpA2m,MakeRule[{epsilonG[a,b,c,d]ChiPerpA2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];

DefTensor[BChiPerp[-a,-c],M4];
xAct`HiGGS`Private`DeclareOrder[BChiPerp[-a,-c],1];
BChiPerpDefinition=Ji[]BPi[-i,z]G3[-z,a]B[-k,-a]-
2V[g]B[-k,-o]G3[o,-z]H[h,z](cBet1 PT1[-i,-g,-h,a,c,d]+cBet2 PT2[-i,-g,-h,a,c,d]+cBet3 PT3[-i,-g,-h,a,c,d])PPara[-c,m]PPara[-d,n]TLambda[-a,-m,-n]-
2V[g]B[-k,-o]G3[o,-z]H[h,z](cBet1 PT1[-i,-g,-h,a,c,d]+cBet2 PT2[-i,-g,-h,a,c,d]+cBet3 PT3[-i,-g,-h,a,c,d])(PPerp[-c,m]PPara[-d,n]TLambda[-a,-m,-n]+PPara[-c,m]PPerp[-d,n]TLambda[-a,-m,-n]);
BChiPerpActivate=MakeRule[{BChiPerp[-i,-k],Evaluate[BChiPerpDefinition]},MetricOn->All,ContractMetrics->True];

DefTensor[AChiPerp[-a,-b,-c],M4,Antisymmetric[{-a,-b}]];
xAct`HiGGS`Private`DeclareOrder[AChiPerp[-a,-b,-c],1];
AChiPerpDefinition=Ji[]APi[-i,-j,z]G3[-z,a]B[-k,-a]-4V[g]B[-k,-o]G3[o,-z]H[h,z](cAlp1 PR1[-i,-j,-g,-h,a,b,c,d]+cAlp2 PR2[-i,-j,-g,-h,a,b,c,d]+cAlp3 PR3[-i,-j,-g,-h,a,b,c,d]+cAlp4 PR4[-i,-j,-g,-h,a,b,c,d]+cAlp5 PR5[-i,-j,-g,-h,a,b,c,d]+cAlp6 PR6[-i,-j,-g,-h,a,b,c,d])PPara[-c,m]PPara[-d,n]RLambda[-a,-b,-m,-n]-
4V[g]B[-k,-o]G3[o,-z]H[h,z](cAlp1 PR1[-i,-j,-g,-h,a,b,c,d]+cAlp2 PR2[-i,-j,-g,-h,a,b,c,d]+cAlp3 PR3[-i,-j,-g,-h,a,b,c,d]+cAlp4 PR4[-i,-j,-g,-h,a,b,c,d]+cAlp5 PR5[-i,-j,-g,-h,a,b,c,d]+cAlp6 PR6[-i,-j,-g,-h,a,b,c,d])(PPerp[-c,m]PPara[-d,n]RLambda[-a,-b,-m,-n]+PPara[-c,m]PPerp[-d,n]RLambda[-a,-b,-m,-n]);
AChiPerpActivate=MakeRule[{AChiPerp[-i,-j,-k],Evaluate[AChiPerpDefinition]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`ClearBuild[];


xAct`HiGGS`Private`IfBuild["ChiPerp"];
OpenLastCache[];


(* ::Input::Initialization:: *)
ChiSingBSymb="\!\(\*SubsuperscriptBox[\(\[Chi]\), \(\[ScriptB]\), \(\[DoubleRightTee]\)]\)";
DefTensor[ChiSingB0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiSingBSymb,xAct`HiGGS`Private`Spin0p]];
xAct`HiGGS`Private`DeclareOrder[ChiSingB0p[],1];
DefTensor[ChiSingB1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiSingBSymb,xAct`HiGGS`Private`Spin1p]];
xAct`HiGGS`Private`DeclareOrder[ChiSingB1p[-a,-b],1];
DefTensor[ChiSingB1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiSingBSymb,xAct`HiGGS`Private`Spin1m]];
xAct`HiGGS`Private`DeclareOrder[ChiSingB1m[-a],1];
DefTensor[ChiSingB2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiSingBSymb,xAct`HiGGS`Private`Spin2p]];
xAct`HiGGS`Private`DeclareOrder[ChiSingB2p[-a,-b],1];
ChiSingASymb="\!\(\*SubsuperscriptBox[\(\[Chi]\), \(\[ScriptCapitalA]\), \(\[DoubleRightTee]\)]\)";
DefTensor[ChiSingA0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiSingASymb,xAct`HiGGS`Private`Spin0p]];
xAct`HiGGS`Private`DeclareOrder[ChiSingA0p[],1];
DefTensor[ChiSingA0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiSingASymb,xAct`HiGGS`Private`Spin0m]];
xAct`HiGGS`Private`DeclareOrder[ChiSingA0m[],1];
DefTensor[ChiSingA1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiSingASymb,xAct`HiGGS`Private`Spin1p]];
xAct`HiGGS`Private`DeclareOrder[ChiSingA1p[-a,-b],1];
DefTensor[ChiSingA1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiSingASymb,xAct`HiGGS`Private`Spin1m]];
xAct`HiGGS`Private`DeclareOrder[ChiSingA1m[-a],1];
DefTensor[ChiSingA2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiSingASymb,xAct`HiGGS`Private`Spin2p]];
xAct`HiGGS`Private`DeclareOrder[ChiSingA2p[-a,-b],1];
DefTensor[ChiSingA2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiSingASymb,xAct`HiGGS`Private`Spin2m]];
xAct`HiGGS`Private`DeclareOrder[ChiSingA2m[-a,-b,-c],1];
AutomaticRules[ChiSingA2m,MakeRule[{ChiSingA2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[ChiSingA2m,MakeRule[{epsilonG[a,b,c,d]ChiSingA2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];

DefTensor[BChiSingExtra[-a,-c],M4];
xAct`HiGGS`Private`DeclareOrder[BChiSingExtra[-a,-c],1];
BChiSingExtraDefinition=4V[g]B[-k,-o]G3[o,-z]H[h,z](cBet1 PT1[-i,-g,-h,a,c,d]+cBet2 PT2[-i,-g,-h,a,c,d]+cBet3 PT3[-i,-g,-h,a,c,d])PPara[-c,m]PPara[-d,n]T[-a,-m,-n];
BChiSingExtraActivate=MakeRule[{BChiSingExtra[-i,-k],Evaluate[BChiSingExtraDefinition]},MetricOn->All,ContractMetrics->True];

DefTensor[AChiSingExtra[-a,-b,-c],M4,Antisymmetric[{-a,-b}]];
xAct`HiGGS`Private`DeclareOrder[AChiSingExtra[-a,-b,-c],1];
AChiSingExtraDefinition=8V[g]B[-k,-o]G3[o,-z]H[h,z](cAlp1 PR1[-i,-j,-g,-h,a,b,c,d]+cAlp2 PR2[-i,-j,-g,-h,a,b,c,d]+cAlp3 PR3[-i,-j,-g,-h,a,b,c,d]+cAlp4 PR4[-i,-j,-g,-h,a,b,c,d]+cAlp5 PR5[-i,-j,-g,-h,a,b,c,d]+cAlp6 PR6[-i,-j,-g,-h,a,b,c,d])PPara[-c,m]PPara[-d,n]R[-a,-b,-m,-n];
AChiSingExtraActivate=MakeRule[{AChiSingExtra[-i,-j,-k],Evaluate[AChiSingExtraDefinition]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`ClearBuild[];


xAct`HiGGS`Private`IfBuild["ChiSing"];
OpenLastCache[];

(* ::Input::Initialization:: *)
UBSymb="\!\(\*SubscriptBox[\(\[ScriptU]\), \(\[ScriptB]\)]\)";
DefTensor[UB0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[UBSymb,xAct`HiGGS`Private`Spin0p]];
xAct`HiGGS`Private`DeclareOrder[UB0p[],1];
DefTensor[UB1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[UBSymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]}];
xAct`HiGGS`Private`DeclareOrder[UB1p[-a,-b],1];
DefTensor[UB1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[UBSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]}];
xAct`HiGGS`Private`DeclareOrder[UB1m[-a],1];
DefTensor[UB2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[UBSymb,xAct`HiGGS`Private`Spin2p],OrthogonalTo->{V[a],V[b]}];
xAct`HiGGS`Private`DeclareOrder[UB2p[-a,-b],1];
UASymb="\!\(\*SubscriptBox[\(\[ScriptU]\), \(\[ScriptCapitalA]\)]\)";
DefTensor[UA0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[UASymb,xAct`HiGGS`Private`Spin0p]];
xAct`HiGGS`Private`DeclareOrder[UA0p[],1];
DefTensor[UA0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[UASymb,xAct`HiGGS`Private`Spin0m]];
xAct`HiGGS`Private`DeclareOrder[UA0m[],1];
DefTensor[UA1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[UASymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]}];
xAct`HiGGS`Private`DeclareOrder[UA1p[-a,-b],1];
DefTensor[UA1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[UASymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]}];
xAct`HiGGS`Private`DeclareOrder[UA1m[-a],1];
DefTensor[UA2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[UASymb,xAct`HiGGS`Private`Spin2p],OrthogonalTo->{V[a],V[b]}];
xAct`HiGGS`Private`DeclareOrder[UA2p[-a,-b],1];
DefTensor[UA2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[UASymb,xAct`HiGGS`Private`Spin2m],OrthogonalTo->{V[a],V[b],V[c]}];
xAct`HiGGS`Private`DeclareOrder[UA2m[-a,-b,-c],1];
AutomaticRules[UA2m,MakeRule[{UA2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[UA2m,MakeRule[{epsilonG[a,b,c,d]UA2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[UB2p,MakeRule[{UB2p[a,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[UA2p,MakeRule[{UA2p[a,-a],0},MetricOn->All,ContractMetrics->True]];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
PiPBSymb="\!\(\*SubscriptBox[OverscriptBox[\(\[Pi]\), \(^\)], \(\[ScriptB]\)]\)";
DefTensor[PiPB0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PiPBSymb,xAct`HiGGS`Private`Spin0p]];
xAct`HiGGS`Private`DeclareOrder[PiPB0p[],1];
DefTensor[PiPB1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[PiPBSymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]}];
xAct`HiGGS`Private`DeclareOrder[PiPB1p[-a,-b],1];
DefTensor[PiPB1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PiPBSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]}];
xAct`HiGGS`Private`DeclareOrder[PiPB1m[-a],1];
DefTensor[PiPB2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[PiPBSymb,xAct`HiGGS`Private`Spin2p],OrthogonalTo->{V[a],V[b]}];
xAct`HiGGS`Private`DeclareOrder[PiPB2p[-a,-b],1];
PiPASymb="\!\(\*SubscriptBox[OverscriptBox[\(\[Pi]\), \(^\)], \(\[ScriptCapitalA]\)]\)";
DefTensor[PiPA0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PiPASymb,xAct`HiGGS`Private`Spin0p]];
xAct`HiGGS`Private`DeclareOrder[PiPA0p[],1,"IsUnityWithEHTerm"->True];
DefTensor[PiPA0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PiPASymb,xAct`HiGGS`Private`Spin0m]];
xAct`HiGGS`Private`DeclareOrder[PiPA0m[],1];
DefTensor[PiPA1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[PiPASymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]}];
xAct`HiGGS`Private`DeclareOrder[PiPA1p[-a,-b],1];
DefTensor[PiPA1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[PiPASymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]}];
xAct`HiGGS`Private`DeclareOrder[PiPA1m[-a],1];
DefTensor[PiPA2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[PiPASymb,xAct`HiGGS`Private`Spin2p],OrthogonalTo->{V[a],V[b]}];
xAct`HiGGS`Private`DeclareOrder[PiPA2p[-a,-b],1];
DefTensor[PiPA2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[PiPASymb,xAct`HiGGS`Private`Spin2m],OrthogonalTo->{V[a],V[b],V[c]}];
xAct`HiGGS`Private`DeclareOrder[PiPA2m[-a,-b,-c],1];
AutomaticRules[PiPA2m,MakeRule[{PiPA2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[PiPA2m,MakeRule[{epsilonG[a,b,c,d]PiPA2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[PiPB2p,MakeRule[{PiPB2p[a,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[PiPA2p,MakeRule[{PiPA2p[a,-a],0},MetricOn->All,ContractMetrics->True]];

PiPB0pDefinition=PB0p[e,f]PBPara[-e,-f,a,c]BPiP[-a,-c];
PiPB1pDefinition=PB1p[-n,-m,e,f]PBPara[-e,-f,a,c]BPiP[-a,-c];
PiPB2pDefinition=PB2p[-n,-m,e,f]PBPara[-e,-f,a,c]BPiP[-a,-c];
PiPB1mDefinition=PB1m[-n,f]PBPerp[-f,a,c]BPiP[-a,-c];
PiPA0pDefinition=PA0p[e,f]PAPerp[-e,-f,a,b,c]APiP[-a,-b,-c];
PiPA1pDefinition=PA1p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]APiP[-a,-b,-c];
PiPA2pDefinition=PA2p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]APiP[-a,-b,-c];
PiPA0mDefinition=PA0m[d,e,f]PAPara[-d,-e,-f,a,b,c]APiP[-a,-b,-c];
PiPA1mDefinition=PA1m[-n,d,e,f]PAPara[-d,-e,-f,a,b,c]APiP[-a,-b,-c];
PiPA2mDefinition=PA2m[-n,-m,-o,d,e,f]PAPara[-d,-e,-f,a,b,c]APiP[-a,-b,-c];

PiPB0pActivate=MakeRule[{PiPB0p[],Scalar[Evaluate[PiPB0pDefinition]]},MetricOn->All,ContractMetrics->True];
PiPB1pActivate=MakeRule[{PiPB1p[-n,-m],Evaluate[PiPB1pDefinition]},MetricOn->All,ContractMetrics->True];
PiPB1mActivate=MakeRule[{PiPB1m[-n],Evaluate[PiPB1mDefinition]},MetricOn->All,ContractMetrics->True];
PiPB2pActivate=MakeRule[{PiPB2p[-n,-m],Evaluate[PiPB2pDefinition]},MetricOn->All,ContractMetrics->True];
PiPA0pActivate=MakeRule[{PiPA0p[],Scalar[Evaluate[PiPA0pDefinition]]},MetricOn->All,ContractMetrics->True];
PiPA0mActivate=MakeRule[{PiPA0m[],Scalar[Evaluate[PiPA0mDefinition]]},MetricOn->All,ContractMetrics->True];
PiPA1pActivate=MakeRule[{PiPA1p[-n,-m],Evaluate[PiPA1pDefinition]},MetricOn->All,ContractMetrics->True];
PiPA1mActivate=MakeRule[{PiPA1m[-n],Evaluate[PiPA1mDefinition]},MetricOn->All,ContractMetrics->True];
PiPA2pActivate=MakeRule[{PiPA2p[-n,-m],Evaluate[PiPA2pDefinition]},MetricOn->All,ContractMetrics->True];
PiPA2mActivate=MakeRule[{PiPA2m[-n,-m,-o],Evaluate[PiPA2mDefinition]},MetricOn->All,ContractMetrics->True];

PiPO3Activate=Join[PiPB0pActivate,PiPB1pActivate,PiPB1mActivate,PiPB2pActivate,PiPA0pActivate,PiPA0mActivate,PiPA1pActivate,PiPA1mActivate,PiPA2pActivate,PiPA2mActivate];
xAct`HiGGS`Private`ClearBuild[];

(*===========================*)
(*  Begin remove to PSALTer  *)
(*===========================*)

(* ::Input::Initialization:: *)
DefTensor[FP0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[FPSymb,xAct`HiGGS`Private`Spin0p],Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[FP0p[],1];
DefTensor[FP1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[FPSymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[FP1p[-a,-b],1];
DefTensor[FP1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[FPSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[FP1m[-a],1];
DefTensor[FP2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[FPSymb,xAct`HiGGS`Private`Spin2p],OrthogonalTo->{V[a],V[b]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[FP2p[-a,-b],1];

DefTensor[AP0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[APSymb,xAct`HiGGS`Private`Spin0p],Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[AP0p[],1];
DefTensor[AP0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[APSymb,xAct`HiGGS`Private`Spin0m],Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[AP0m[],1];
DefTensor[AP1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[APSymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[AP1p[-a,-b],1];
DefTensor[AP1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[APSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[AP1m[-a],1];
DefTensor[AP2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[APSymb,xAct`HiGGS`Private`Spin2p],OrthogonalTo->{V[a],V[b]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[AP2p[-a,-b],1];
DefTensor[AP2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[APSymb,xAct`HiGGS`Private`Spin2m],OrthogonalTo->{V[a],V[b],V[c]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[AP2m[-a,-b,-c],1];

AutomaticRules[AP2m,MakeRule[{Evaluate@Dagger@AP2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[AP2m,MakeRule[{Evaluate@Dagger[epsilonG[a,b,c,d]AP2m[-a,-b,-c]],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[FP2p,MakeRule[{Evaluate@Dagger@FP2p[a,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[AP2p,MakeRule[{Evaluate@Dagger@AP2p[a,-a],0},MetricOn->All,ContractMetrics->True]];

Manual1=MakeRule[{Evaluate@Dagger@AP2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True];
Manual2=MakeRule[{Evaluate@Dagger[epsilonG[a,b,c,d]AP2m[-a,-b,-c]],0},MetricOn->All,ContractMetrics->True];
Manual3=MakeRule[{Evaluate@Dagger@FP2p[a,-a],0},MetricOn->All,ContractMetrics->True];
Manual4=MakeRule[{Evaluate@Dagger@AP2p[a,-a],0},MetricOn->All,ContractMetrics->True];
ManualAll=Join[Manual1,Manual2,Manual3,Manual4];

AutomaticRules[AP2m,MakeRule[{AP2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[AP2m,MakeRule[{epsilonG[a,b,c,d]AP2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[FP2p,MakeRule[{FP2p[a,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[AP2p,MakeRule[{AP2p[a,-a],0},MetricOn->All,ContractMetrics->True]];

FP0pDefinition=PB0p[e,f]PBPara[-e,-f,a,c]FP[-a,-c];
FP1pDefinition=PB1p[-n,-m,e,f]PBPara[-e,-f,a,c]FP[-a,-c];
FP2pDefinition=PB2p[-n,-m,e,f]PBPara[-e,-f,a,c]FP[-a,-c];
FP1mDefinition=PB1m[-n,f]PBPerp[-f,a,c]FP[-a,-c];
AP0pDefinition=PA0p[e,f]PAPerp[-e,-f,a,b,c]AP[-a,-b,-c];
AP1pDefinition=PA1p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]AP[-a,-b,-c];
AP2pDefinition=PA2p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]AP[-a,-b,-c];
AP0mDefinition=PA0m[d,e,f]PAPara[-d,-e,-f,a,b,c]AP[-a,-b,-c];
AP1mDefinition=PA1m[-n,d,e,f]PAPara[-d,-e,-f,a,b,c]AP[-a,-b,-c];
AP2mDefinition=PA2m[-n,-m,-o,d,e,f]PAPara[-d,-e,-f,a,b,c]AP[-a,-b,-c];

FP0pActivate=MakeRule[{FP0p[],Scalar[Evaluate[FP0pDefinition]]},MetricOn->All,ContractMetrics->True];
FP1pActivate=MakeRule[{FP1p[-n,-m],Evaluate[FP1pDefinition]},MetricOn->All,ContractMetrics->True];
FP1mActivate=MakeRule[{FP1m[-n],Evaluate[FP1mDefinition]},MetricOn->All,ContractMetrics->True];
FP2pActivate=MakeRule[{FP2p[-n,-m],Evaluate[FP2pDefinition]},MetricOn->All,ContractMetrics->True];
AP0pActivate=MakeRule[{AP0p[],Scalar[Evaluate[AP0pDefinition]]},MetricOn->All,ContractMetrics->True];
AP0mActivate=MakeRule[{AP0m[],Scalar[Evaluate[AP0mDefinition]]},MetricOn->All,ContractMetrics->True];
AP1pActivate=MakeRule[{AP1p[-n,-m],Evaluate[AP1pDefinition]},MetricOn->All,ContractMetrics->True];
AP1mActivate=MakeRule[{AP1m[-n],Evaluate[AP1mDefinition]},MetricOn->All,ContractMetrics->True];
AP2pActivate=MakeRule[{AP2p[-n,-m],Evaluate[AP2pDefinition]},MetricOn->All,ContractMetrics->True];
AP2mActivate=MakeRule[{AP2m[-n,-m,-o],Evaluate[AP2mDefinition]},MetricOn->All,ContractMetrics->True];

FP0pActivateD=MakeRule[{Evaluate@Dagger@FP0p[],Scalar[Evaluate[Dagger@FP0pDefinition]]},MetricOn->All,ContractMetrics->True];
FP1pActivateD=MakeRule[{Evaluate@Dagger@FP1p[-n,-m],Evaluate[Dagger@FP1pDefinition]},MetricOn->All,ContractMetrics->True];
FP1mActivateD=MakeRule[{Evaluate@Dagger@FP1m[-n],Evaluate[Dagger@FP1mDefinition]},MetricOn->All,ContractMetrics->True];
FP2pActivateD=MakeRule[{Evaluate@Dagger@FP2p[-n,-m],Evaluate[Dagger@FP2pDefinition]},MetricOn->All,ContractMetrics->True];
AP0pActivateD=MakeRule[{Evaluate@Dagger@AP0p[],Scalar[Evaluate[Dagger@AP0pDefinition]]},MetricOn->All,ContractMetrics->True];
AP0mActivateD=MakeRule[{Evaluate@Dagger@AP0m[],Scalar[Evaluate[Dagger@AP0mDefinition]]},MetricOn->All,ContractMetrics->True];
AP1pActivateD=MakeRule[{Evaluate@Dagger@AP1p[-n,-m],Evaluate[Dagger@AP1pDefinition]},MetricOn->All,ContractMetrics->True];
AP1mActivateD=MakeRule[{Evaluate@Dagger@AP1m[-n],Evaluate[Dagger@AP1mDefinition]},MetricOn->All,ContractMetrics->True];
AP2pActivateD=MakeRule[{Evaluate@Dagger@AP2p[-n,-m],Evaluate[Dagger@AP2pDefinition]},MetricOn->All,ContractMetrics->True];
AP2mActivateD=MakeRule[{Evaluate@Dagger@AP2m[-n,-m,-o],Evaluate[Dagger@AP2mDefinition]},MetricOn->All,ContractMetrics->True];

GaugePO3Activate=Join[FP0pActivate,FP1pActivate,FP1mActivate,FP2pActivate,AP0pActivate,AP0mActivate,AP1pActivate,AP1mActivate,AP2pActivate,AP2mActivate,FP0pActivateD,FP1pActivateD,FP1mActivateD,FP2pActivateD,AP0pActivateD,AP0mActivateD,AP1pActivateD,AP1mActivateD,AP2pActivateD,AP2mActivateD];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
DefTensor[FPerp0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[FPerpSymb,xAct`HiGGS`Private`Spin0p],Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[FP0p[],1];
DefTensor[FPerp1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[FPerpSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[FPerp1m[-a],1];

DefTensor[APerp1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[APerpSymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[APerp1p[-a,-b],1];
DefTensor[APerp1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[APerpSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[APerp1m[-a],1];

FPerp0pDefinition=V[a]FPerp[-a];
FPerp1mDefinition=PPara[-n,a]FPerp[-a];
APerp1pDefinition=PPara[-n,a]PPara[-m,b]APerp[-a,-b];
APerp1mDefinition=PPara[-n,a]V[b]APerp[-a,-b];

FPerp0pActivate=MakeRule[{FPerp0p[],Scalar[Evaluate[FPerp0pDefinition]]},MetricOn->All,ContractMetrics->True];
FPerp1mActivate=MakeRule[{FPerp1m[-n],Evaluate[FPerp1mDefinition]},MetricOn->All,ContractMetrics->True];
APerp1pActivate=MakeRule[{APerp1p[-n,-m],Evaluate[APerp1pDefinition]},MetricOn->All,ContractMetrics->True];
APerp1mActivate=MakeRule[{APerp1m[-n],Evaluate[APerp1mDefinition]},MetricOn->All,ContractMetrics->True];
FPerp0pActivateD=MakeRule[{Evaluate@Dagger@FPerp0p[],Scalar[Evaluate[Dagger@FPerp0pDefinition]]},MetricOn->All,ContractMetrics->True];
FPerp1mActivateD=MakeRule[{Evaluate@Dagger@FPerp1m[-n],Evaluate[Dagger@FPerp1mDefinition]},MetricOn->All,ContractMetrics->True];
APerp1pActivateD=MakeRule[{Evaluate@Dagger@APerp1p[-n,-m],Evaluate[Dagger@APerp1pDefinition]},MetricOn->All,ContractMetrics->True];
APerp1mActivateD=MakeRule[{Evaluate@Dagger@APerp1m[-n],Evaluate[Dagger@APerp1mDefinition]},MetricOn->All,ContractMetrics->True];

GaugePerpO3Activate=Join[FPerp0pActivate,FPerp1mActivate,APerp1pActivate,APerp1mActivate,FPerp0pActivateD,FPerp1mActivateD,APerp1pActivateD,APerp1mActivateD];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
DefTensor[TauP0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TauPSymb,xAct`HiGGS`Private`Spin0p],Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[TauP0p[],1];
DefTensor[TauP1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TauPSymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[TauP1p[-a,-b],1];
DefTensor[TauP1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TauPSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[TauP1m[-a],1];
DefTensor[TauP2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TauPSymb,xAct`HiGGS`Private`Spin2p],OrthogonalTo->{V[a],V[b]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[TauP2p[-a,-b],1];

DefTensor[SigmaP0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[SigmaPSymb,xAct`HiGGS`Private`Spin0p],Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[SigmaP0p[],1];
DefTensor[SigmaP0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[SigmaPSymb,xAct`HiGGS`Private`Spin0m],Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[SigmaP0m[],1];
DefTensor[SigmaP1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[SigmaPSymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[SigmaP1p[-a,-b],1];
DefTensor[SigmaP1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[SigmaPSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[SigmaP1m[-a],1];
DefTensor[SigmaP2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[SigmaPSymb,xAct`HiGGS`Private`Spin2p],OrthogonalTo->{V[a],V[b]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[SigmaP2p[-a,-b],1];
DefTensor[SigmaP2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[SigmaPSymb,xAct`HiGGS`Private`Spin2m],OrthogonalTo->{V[a],V[b],V[c]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[SigmaP2m[-a,-b,-c],1];

AutomaticRules[SigmaP2m,MakeRule[{Evaluate@Dagger@SigmaP2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[SigmaP2m,MakeRule[{Evaluate@Dagger[epsilonG[a,b,c,d]SigmaP2m[-a,-b,-c]],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[TauP2p,MakeRule[{Evaluate@Dagger@TauP2p[a,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[SigmaP2p,MakeRule[{Evaluate@Dagger@SigmaP2p[a,-a],0},MetricOn->All,ContractMetrics->True]];

Manual5=MakeRule[{Evaluate@Dagger@SigmaP2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True];
Manual6=MakeRule[{Evaluate@Dagger[epsilonG[a,b,c,d]SigmaP2m[-a,-b,-c]],0},MetricOn->All,ContractMetrics->True];
Manual7=MakeRule[{Evaluate@Dagger@TauP2p[a,-a],0},MetricOn->All,ContractMetrics->True];
Manual8=MakeRule[{Evaluate@Dagger@SigmaP2p[a,-a],0},MetricOn->All,ContractMetrics->True];
ManualAll=Join[ManualAll,Manual5,Manual6,Manual7,Manual8];

AutomaticRules[SigmaP2m,MakeRule[{SigmaP2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[SigmaP2m,MakeRule[{epsilonG[a,b,c,d]SigmaP2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[TauP2p,MakeRule[{TauP2p[a,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[SigmaP2p,MakeRule[{SigmaP2p[a,-a],0},MetricOn->All,ContractMetrics->True]];

TauP0pDefinition=PB0p[e,f]PBPara[-e,-f,a,c]TauP[-a,-c];
TauP1pDefinition=PB1p[-n,-m,e,f]PBPara[-e,-f,a,c]TauP[-a,-c];
TauP2pDefinition=PB2p[-n,-m,e,f]PBPara[-e,-f,a,c]TauP[-a,-c];
TauP1mDefinition=PB1m[-n,f]PBPerp[-f,a,c]TauP[-a,-c];
SigmaP0pDefinition=PA0p[e,f]PAPerp[-e,-f,a,b,c]SigmaP[-c,-a,-b];
SigmaP1pDefinition=PA1p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]SigmaP[-c,-a,-b];
SigmaP2pDefinition=PA2p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]SigmaP[-c,-a,-b];
SigmaP0mDefinition=PA0m[d,e,f]PAPara[-d,-e,-f,a,b,c]SigmaP[-c,-a,-b];
SigmaP1mDefinition=PA1m[-n,d,e,f]PAPara[-d,-e,-f,a,b,c]SigmaP[-c,-a,-b];
SigmaP2mDefinition=PA2m[-n,-m,-o,d,e,f]PAPara[-d,-e,-f,a,b,c]SigmaP[-c,-a,-b];

TauP0pActivate=MakeRule[{TauP0p[],Scalar[Evaluate[TauP0pDefinition]]},MetricOn->All,ContractMetrics->True];
TauP1pActivate=MakeRule[{TauP1p[-n,-m],Evaluate[TauP1pDefinition]},MetricOn->All,ContractMetrics->True];
TauP1mActivate=MakeRule[{TauP1m[-n],Evaluate[TauP1mDefinition]},MetricOn->All,ContractMetrics->True];
TauP2pActivate=MakeRule[{TauP2p[-n,-m],Evaluate[TauP2pDefinition]},MetricOn->All,ContractMetrics->True];
SigmaP0pActivate=MakeRule[{SigmaP0p[],Scalar[Evaluate[SigmaP0pDefinition]]},MetricOn->All,ContractMetrics->True];
SigmaP0mActivate=MakeRule[{SigmaP0m[],Scalar[Evaluate[SigmaP0mDefinition]]},MetricOn->All,ContractMetrics->True];
SigmaP1pActivate=MakeRule[{SigmaP1p[-n,-m],Evaluate[SigmaP1pDefinition]},MetricOn->All,ContractMetrics->True];
SigmaP1mActivate=MakeRule[{SigmaP1m[-n],Evaluate[SigmaP1mDefinition]},MetricOn->All,ContractMetrics->True];
SigmaP2pActivate=MakeRule[{SigmaP2p[-n,-m],Evaluate[SigmaP2pDefinition]},MetricOn->All,ContractMetrics->True];
SigmaP2mActivate=MakeRule[{SigmaP2m[-n,-m,-o],Evaluate[SigmaP2mDefinition]},MetricOn->All,ContractMetrics->True];

TauP0pActivateD=MakeRule[{Evaluate@Dagger@TauP0p[],Scalar[Evaluate[Dagger@TauP0pDefinition]]},MetricOn->All,ContractMetrics->True];
TauP1pActivateD=MakeRule[{Evaluate@Dagger@TauP1p[-n,-m],Evaluate[Dagger@TauP1pDefinition]},MetricOn->All,ContractMetrics->True];
TauP1mActivateD=MakeRule[{Evaluate@Dagger@TauP1m[-n],Evaluate[Dagger@TauP1mDefinition]},MetricOn->All,ContractMetrics->True];
TauP2pActivateD=MakeRule[{Evaluate@Dagger@TauP2p[-n,-m],Evaluate[Dagger@TauP2pDefinition]},MetricOn->All,ContractMetrics->True];
SigmaP0pActivateD=MakeRule[{Evaluate@Dagger@SigmaP0p[],Scalar[Evaluate[Dagger@SigmaP0pDefinition]]},MetricOn->All,ContractMetrics->True];
SigmaP0mActivateD=MakeRule[{Evaluate@Dagger@SigmaP0m[],Scalar[Evaluate[Dagger@SigmaP0mDefinition]]},MetricOn->All,ContractMetrics->True];
SigmaP1pActivateD=MakeRule[{Evaluate@Dagger@SigmaP1p[-n,-m],Evaluate[Dagger@SigmaP1pDefinition]},MetricOn->All,ContractMetrics->True];
SigmaP1mActivateD=MakeRule[{Evaluate@Dagger@SigmaP1m[-n],Evaluate[Dagger@SigmaP1mDefinition]},MetricOn->All,ContractMetrics->True];
SigmaP2pActivateD=MakeRule[{Evaluate@Dagger@SigmaP2p[-n,-m],Evaluate[Dagger@SigmaP2pDefinition]},MetricOn->All,ContractMetrics->True];
SigmaP2mActivateD=MakeRule[{Evaluate@Dagger@SigmaP2m[-n,-m,-o],Evaluate[Dagger@SigmaP2mDefinition]},MetricOn->All,ContractMetrics->True];

SourcePO3Activate=Join[TauP0pActivate,TauP1pActivate,TauP1mActivate,TauP2pActivate,SigmaP0pActivate,SigmaP0mActivate,SigmaP1pActivate,SigmaP1mActivate,SigmaP2pActivate,SigmaP2mActivate,TauP0pActivateD,TauP1pActivateD,TauP1mActivateD,TauP2pActivateD,SigmaP0pActivateD,SigmaP0mActivateD,SigmaP1pActivateD,SigmaP1mActivateD,SigmaP2pActivateD,SigmaP2mActivateD];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
DefTensor[TauPerp0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TauPerpSymb,xAct`HiGGS`Private`Spin0p],Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[TauP0p[],1];
DefTensor[TauPerp1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TauPerpSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[TauPerp1m[-a],1];

DefTensor[SigmaPerp1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[SigmaPerpSymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[SigmaPerp1p[-a,-b],1];
DefTensor[SigmaPerp1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[SigmaPerpSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]},Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[SigmaPerp1m[-a],1];

TauPerp0pDefinition=V[a]TauPerp[-a];
TauPerp1mDefinition=PPara[-n,a]TauPerp[-a];
SigmaPerp1pDefinition=PPara[-n,a]PPara[-m,b]SigmaPerp[-a,-b];
SigmaPerp1mDefinition=PPara[-n,a]V[b]SigmaPerp[-a,-b];

TauPerp0pActivate=MakeRule[{TauPerp0p[],Scalar[Evaluate[TauPerp0pDefinition]]},MetricOn->All,ContractMetrics->True];
TauPerp1mActivate=MakeRule[{TauPerp1m[-n],Evaluate[TauPerp1mDefinition]},MetricOn->All,ContractMetrics->True];
SigmaPerp1pActivate=MakeRule[{SigmaPerp1p[-n,-m],Evaluate[SigmaPerp1pDefinition]},MetricOn->All,ContractMetrics->True];
SigmaPerp1mActivate=MakeRule[{SigmaPerp1m[-n],Evaluate[SigmaPerp1mDefinition]},MetricOn->All,ContractMetrics->True];

TauPerp0pActivateD=MakeRule[{Evaluate@Dagger@TauPerp0p[],Scalar[Evaluate[Dagger@TauPerp0pDefinition]]},MetricOn->All,ContractMetrics->True];
TauPerp1mActivateD=MakeRule[{Evaluate@Dagger@TauPerp1m[-n],Evaluate[Dagger@TauPerp1mDefinition]},MetricOn->All,ContractMetrics->True];
SigmaPerp1pActivateD=MakeRule[{Evaluate@Dagger@SigmaPerp1p[-n,-m],Evaluate[Dagger@SigmaPerp1pDefinition]},MetricOn->All,ContractMetrics->True];
SigmaPerp1mActivateD=MakeRule[{Evaluate@Dagger@SigmaPerp1m[-n],Evaluate[Dagger@SigmaPerp1mDefinition]},MetricOn->All,ContractMetrics->True];

SourcePerpO3Activate=Join[TauPerp0pActivate,TauPerp1mActivate,SigmaPerp1pActivate,SigmaPerp1mActivate,TauPerp0pActivateD,TauPerp1mActivateD,SigmaPerp1pActivateD,SigmaPerp1mActivateD];
xAct`HiGGS`Private`ClearBuild[];

(*=========================*)
(*  End remove to PSALTer  *)
(*=========================*)

(* ::Input::Initialization:: *)
(*O(3) decomposition of the canonical parts of field strengths*)
TPSymb="\!\(\*SuperscriptBox[\(\[ScriptCapitalT]\), \(\[DoubleVerticalBar]\)]\)";
DefTensor[TP0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TPSymb,xAct`HiGGS`Private`Spin0m]];
xAct`HiGGS`Private`DeclareOrder[TP0m[],1];
DefTensor[TP1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TPSymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]}];
xAct`HiGGS`Private`DeclareOrder[TP1p[-a,-b],1];
DefTensor[TP1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TPSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]}];
xAct`HiGGS`Private`DeclareOrder[TP1m[-a],1];
DefTensor[TP2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TPSymb,xAct`HiGGS`Private`Spin2m],OrthogonalTo->{V[a],V[b],V[c]}];
xAct`HiGGS`Private`DeclareOrder[TP2m[-a,-b,-c],1];
RPSymb="\!\(\*SuperscriptBox[\(\[ScriptCapitalR]\), \(\[DoubleVerticalBar]\)]\)";
DefTensor[RP0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[RPSymb,xAct`HiGGS`Private`Spin0p]];
xAct`HiGGS`Private`DeclareOrder[RP0p[],1];
DefTensor[RP0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[RPSymb,xAct`HiGGS`Private`Spin0m]];
xAct`HiGGS`Private`DeclareOrder[RP0m[],1];
DefTensor[RP1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RPSymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]}];
xAct`HiGGS`Private`DeclareOrder[RP1p[-a,-b],1];
DefTensor[RP1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[RPSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]}];
xAct`HiGGS`Private`DeclareOrder[RP1m[-a],1];
DefTensor[RP2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RPSymb,xAct`HiGGS`Private`Spin2p],OrthogonalTo->{V[a],V[b]}];
xAct`HiGGS`Private`DeclareOrder[RP2p[-a,-b],1];
DefTensor[RP2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RPSymb,xAct`HiGGS`Private`Spin2m],OrthogonalTo->{V[a],V[b],V[c]}];
xAct`HiGGS`Private`DeclareOrder[RP2m[-a,-b,-c],1];
AutomaticRules[TP2m,MakeRule[{TP2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[TP2m,MakeRule[{epsilonG[a,b,c,d]TP2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[TP2m,MakeRule[{Eps[a,b,c]TP2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[RP2m,MakeRule[{RP2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[RP2m,MakeRule[{epsilonG[a,b,c,d]RP2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[RP2p,MakeRule[{RP2p[a,-a],0},MetricOn->All,ContractMetrics->True]];
xAct`HiGGS`Private`ClearBuild[];

(*Projections to break the field strengths up into canonical and non-canonical parts*)
DefTensor[PTPerp[-e,-f,a,b,c],M4];
DefTensor[PTPara[-e,-f,-g,a,b,c],M4];
DefTensor[PRPerp[-e,-f,-g,a,b,c,d],M4];
DefTensor[PRPara[-e,-f,-g,-h,a,b,c,d],M4];
PTPerpDefinition=V[a]PPara[-e,b]PPara[-f,c]/.PADMActivate//ToCanonical;
PTPerpActivate=MakeRule[{PTPerp[-e,-f,a,b,c],Evaluate[PTPerpDefinition]},MetricOn->All,ContractMetrics->True];
PTParaDefinition=PPara[-e,a]PPara[-f,b]PPara[-g,c]/.PADMActivate//ToCanonical;
PTParaActivate=MakeRule[{PTPara[-e,-f,-g,a,b,c],Evaluate[PTParaDefinition]},MetricOn->All,ContractMetrics->True];
PRPerpDefinition=V[a]PPara[-e,b]PPara[-f,c]PPara[-g,d]/.PADMActivate//ToCanonical;
PRPerpActivate=MakeRule[{PRPerp[-e,-f,-g,a,b,c,d],Evaluate[PRPerpDefinition]},MetricOn->All,ContractMetrics->True];
PRParaDefinition=PPara[-e,a]PPara[-f,b]PPara[-g,c]PPara[-h,d]/.PADMActivate//ToCanonical;
PRParaActivate=MakeRule[{PRPara[-e,-f,-g,-h,a,b,c,d],Evaluate[PRParaDefinition]},MetricOn->All,ContractMetrics->True];
PADMTActivate=Join[PTPerpActivate,PTParaActivate];
PADMRActivate=Join[PRPerpActivate,PRParaActivate];
xAct`HiGGS`Private`ClearBuild[];

xAct`HiGGS`Private`BuildRebuild@"IfConstraints/VarPhiPerp/Definitions.m";
xAct`HiGGS`Private`BuildRebuild@"IfConstraints/VarPhiPerp/Activation.m";
xAct`HiGGS`Private`IfBuild["IfConstraints/VarPhiPerp/Rules"];
OpenLastCache[];

xAct`HiGGS`Private`BuildRebuild@"IfConstraints/VarPhiPara/Definitions.m";
xAct`HiGGS`Private`BuildRebuild@"IfConstraints/VarPhiPara/Activation.m";
xAct`HiGGS`Private`IfBuild["IfConstraints/VarPhiPara/Rules"];
OpenLastCache[];

xAct`HiGGS`Private`BuildRebuild@"GeometricMultipliers/Lambda/LambdaParaSO3.m";
xAct`HiGGS`Private`BuildRebuild@"GeometricMultipliers/LambdaPi/LambdaPiParaSO3.m";

(* ::Input::Initialization:: *)
(*O(3) decomposition of the non-canonical parts of field strengths*)
TPerpSymb="\!\(\*SuperscriptBox[\(\[ScriptCapitalT]\), \(\[UpTee]\)]\)";
DefTensor[TPerp0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TPerpSymb,xAct`HiGGS`Private`Spin0p]];
xAct`HiGGS`Private`DeclareOrder[TPerp0p[],1];
DefTensor[TPerp1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TPerpSymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]}];
xAct`HiGGS`Private`DeclareOrder[TPerp1p[-a,-b],1];
DefTensor[TPerp1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TPerpSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]}];
xAct`HiGGS`Private`DeclareOrder[TPerp1m[-a],1];
DefTensor[TPerp2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TPerpSymb,xAct`HiGGS`Private`Spin2p],OrthogonalTo->{V[a],V[b]}];
xAct`HiGGS`Private`DeclareOrder[TPerp2p[-a,-b],1];
RPerpSymb="\!\(\*SuperscriptBox[\(\[ScriptCapitalR]\), \(\[UpTee]\)]\)";
DefTensor[RPerp0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[RPerpSymb,xAct`HiGGS`Private`Spin0p]];
xAct`HiGGS`Private`DeclareOrder[RPerp0p[],1];
DefTensor[RPerp0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[RPerpSymb,xAct`HiGGS`Private`Spin0m]];
xAct`HiGGS`Private`DeclareOrder[RPerp0m[],1];
DefTensor[RPerp1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RPerpSymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]}];
xAct`HiGGS`Private`DeclareOrder[RPerp1p[-a,-b],1];
DefTensor[RPerp1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[RPerpSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]}];
xAct`HiGGS`Private`DeclareOrder[RPerp1m[-a],1];
DefTensor[RPerp2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RPerpSymb,xAct`HiGGS`Private`Spin2p],OrthogonalTo->{V[a],V[b]}];
xAct`HiGGS`Private`DeclareOrder[RPerp2p[-a,-b],1];
DefTensor[RPerp2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RPerpSymb,xAct`HiGGS`Private`Spin2m],OrthogonalTo->{V[a],V[b],V[c]}];
xAct`HiGGS`Private`DeclareOrder[RPerp2m[-a,-b,-c],1];
AutomaticRules[TPerp2p,MakeRule[{TPerp2p[a,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[RPerp2m,MakeRule[{RPerp2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[RPerp2m,MakeRule[{epsilonG[a,b,c,d]RPerp2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[RPerp2p,MakeRule[{RPerp2p[a,-a],0},MetricOn->All,ContractMetrics->True]];
xAct`HiGGS`Private`ClearBuild[];

xAct`HiGGS`Private`BuildRebuild@"GeometricMultipliers/Lambda/LambdaPerpSO3.m";
xAct`HiGGS`Private`BuildRebuild@"GeometricMultipliers/LambdaPi/LambdaPiPerpSO3.m";

(* ::Input::Initialization:: *)
(*These rules then expand the O(3) parts in terms of the canonical parts*)
TP0mDefinition=PT0m[e,f,g]PTPara[-e,-f,-g,a,b,c]TP[-a,-b,-c]/.PO3TActivate/.PADMTActivate//ToCanonical;
TP1pDefinition=PT1p[-n,-m,e,f]PTPerp[-e,-f,a,b,c]TP[-a,-b,-c]/.PO3TActivate/.PADMTActivate//ToCanonical;
TP1mDefinition=PT1m[-n,e,f,g]PTPara[-e,-f,-g,a,b,c]TP[-a,-b,-c]/.PO3TActivate/.PADMTActivate//ToCanonical;
TP2mDefinition=PT2m[-n,-m,-o,e,f,g]PTPara[-e,-f,-g,a,b,c]TP[-a,-b,-c]/.PO3TActivate/.PADMTActivate//ToCanonical;

RP0pDefinition=PR0p[e,f,g,h]PRPara[-e,-f,-g,-h,a,b,c,d]RP[-a,-b,-c,-d]/.PO3RActivate/.PADMRActivate//ToCanonical;
RP0mDefinition=PR0m[e,f,g]PRPerp[-e,-f,-g,a,b,c,d]RP[-a,-b,-c,-d]/.PO3RActivate/.PADMRActivate//ToCanonical;
RP1pDefinition=PR1p[-n,-m,e,f,g,h]PRPara[-e,-f,-g,-h,a,b,c,d]RP[-a,-b,-c,-d]/.PO3RActivate/.PADMRActivate//ToCanonical;
RP1mDefinition=PR1m[-n,e,f,g]PRPerp[-e,-f,-g,a,b,c,d]RP[-a,-b,-c,-d]/.PO3RActivate/.PADMRActivate//ToCanonical;
RP2pDefinition=PR2p[-n,-m,e,f,g,h]PRPara[-e,-f,-g,-h,a,b,c,d]RP[-a,-b,-c,-d]/.PO3RActivate/.PADMRActivate//ToCanonical;
RP2mDefinition=PR2m[-n,-m,-o,e,f,g]PRPerp[-e,-f,-g,a,b,c,d]RP[-a,-b,-c,-d]/.PO3RActivate/.PADMRActivate//ToCanonical;

TP0mActivate=MakeRule[{TP0m[],Scalar[Evaluate[TP0mDefinition]]},MetricOn->All,ContractMetrics->True];
TP1pActivate=MakeRule[{TP1p[-n,-m],Evaluate[TP1pDefinition]},MetricOn->All,ContractMetrics->True];
TP1mActivate=MakeRule[{TP1m[-n],Evaluate[TP1mDefinition]},MetricOn->All,ContractMetrics->True];
TP2mActivate=MakeRule[{TP2m[-n,-m,-o],Evaluate[TP2mDefinition]},MetricOn->All,ContractMetrics->True];

RP0pActivate=MakeRule[{RP0p[],Scalar[Evaluate[RP0pDefinition]]},MetricOn->All,ContractMetrics->True];
RP0mActivate=MakeRule[{RP0m[],Scalar[Evaluate[RP0mDefinition]]},MetricOn->All,ContractMetrics->True];
RP1pActivate=MakeRule[{RP1p[-n,-m],Evaluate[RP1pDefinition]},MetricOn->All,ContractMetrics->True];
RP1mActivate=MakeRule[{RP1m[-n],Evaluate[RP1mDefinition]},MetricOn->All,ContractMetrics->True];
RP2pActivate=MakeRule[{RP2p[-n,-m],Evaluate[RP2pDefinition]},MetricOn->All,ContractMetrics->True];
RP2mActivate=MakeRule[{RP2m[-n,-m,-o],Evaluate[RP2mDefinition]},MetricOn->All,ContractMetrics->True];

TPO3Activate=Join[TP0mActivate,TP1pActivate,TP1mActivate,TP2mActivate];
RPO3Activate=Join[RP0pActivate,RP0mActivate,RP1pActivate,RP1mActivate,RP2pActivate,RP2mActivate];

TPDefinition= V[-a]TP1p[-b,-c]+
-(1/6) PT0m[-a,-b,-c]TP0m[]+
 Antisymmetrize[-PPara[-a,-b]TP1m[-c],{-b,-c}]+
(4/3) TP2m[-b,-c,-a]/.PO3TActivate/.PADMActivate//ToCanonical;

DefTensor[RPPara[-a,-b,-c,-d],M4,{Antisymmetric[{-a,-b}],Antisymmetric[{-c,-d}]},OrthogonalTo->{V[a],V[b],V[c],V[d]}];
xAct`HiGGS`Private`DeclareOrder[RPPara[-a,-b,-c,-d],1];
DefTensor[RPPerp[-a,-b,-c],M4,Antisymmetric[{-b,-c}],OrthogonalTo->{V[a],V[b],V[c]}];
xAct`HiGGS`Private`DeclareOrder[RPPerp[-a,-b,-c],1];

RPParaDefinition=-(1/6)(PPara[-a,-d]PPara[-b,-c]-PPara[-a,-c]PPara[-b,-d])RP0p[]-
(PPara[-b,-d]RP1p[-a,-c]-PPara[-b,-c]RP1p[-a,-d]-PPara[-a,-d]RP1p[-b,-c]+PPara[-a,-c]RP1p[-b,-d])+
(PPara[-b,-d]RP2p[-a,-c]-PPara[-b,-c]RP2p[-a,-d]-PPara[-a,-d]RP2p[-b,-c]+PPara[-a,-c]RP2p[-b,-d]);
RPPerpDefinition=-(1/6) PR0m[-a,-b,-c]RP0m[]+ Antisymmetrize[-PPara[-a,-b]RP1m[-c],{-b,-c}]+(4/3) RP2m[-b,-c,-a];

RPParaActivate=MakeRule[{RPPara[-a,-b,-c,-d],Evaluate[RPParaDefinition]},MetricOn->All,ContractMetrics->True];
RPPerpActivate=MakeRule[{RPPerp[-a,-b,-c],Evaluate[RPPerpDefinition]},MetricOn->All,ContractMetrics->True];
RPParaPerpActivate=Join[RPParaActivate,RPPerpActivate];

RPDefinition= RPPara[-a,-b,-c,-d]+2Antisymmetrize[V[-a]RPPerp[-b,-c,-d],{-a,-b}]/.RPParaPerpActivate/.PO3RActivate/.PADMActivate//ToCanonical;

TPDefinition=TPDefinition//CollectTensors//ScreenDollarIndices//CollectTensors;
(*TPDefinition=TPDefinition/.TPO3Activate//CollectTensors//ScreenDollarIndices//CollectTensors;*)(*removed 19/04*)
RPDefinition=RPDefinition//CollectTensors//ScreenDollarIndices//CollectTensors;

TPActivate=MakeRule[{TP[-a,-b,-c],Evaluate[TPDefinition]},MetricOn->All,ContractMetrics->True];
RPActivate=MakeRule[{RP[-a,-b,-c,-d],Evaluate[RPDefinition]},MetricOn->All,ContractMetrics->True];
StrengthPToStrengthPO3=Join[TPActivate,RPActivate];
xAct`HiGGS`Private`ClearBuild[];

xAct`HiGGS`Private`BuildRebuild@"GeometricMultipliers/Lambda/LambdaSO3.m";
xAct`HiGGS`Private`BuildRebuild@"GeometricMultipliers/LambdaPi/LambdaPiSO3.m";

(* ::Input::Initialization:: *)
(*These rules then expand the O(3) parts in terms of the canonical parts*)
TPerp0pDefinition=PPerpT0p[e,f]PPerpTPara[-e,-f,a,b]TPerp[-a,-b]/.PPerpO3TActivate/.PPerpADMTActivate//ToCanonical;
TPerp1pDefinition=PPerpT1p[-n,-m,e,f]PPerpTPara[-e,-f,a,b]TPerp[-a,-b]/.PPerpO3TActivate/.PPerpADMTActivate//ToCanonical;
TPerp1mDefinition=PPerpT1m[-n,e]PPerpTPerp[-e,a,b]TPerp[-a,-b]/.PPerpO3TActivate/.PPerpADMTActivate//ToCanonical;
TPerp2pDefinition=PPerpT2p[-n,-m,e,f]PPerpTPara[-e,-f,a,b]TPerp[-a,-b]/.PPerpO3TActivate/.PPerpADMTActivate//ToCanonical;

RPerp0pDefinition=PPerpR0p[e,f]PPerpRPerp[-e,-f,a,b,c]RPerp[-a,-b,-c]/.PPerpO3RActivate/.PPerpADMRActivate//ToCanonical;
RPerp0mDefinition=PPerpR0m[e,f,g]PPerpRPara[-e,-f,-g,a,b,c]RPerp[-a,-b,-c]/.PPerpO3RActivate/.PPerpADMRActivate//ToCanonical;
RPerp1pDefinition=PPerpR1p[-n,-m,e,f]PPerpRPerp[-e,-f,a,b,c]RPerp[-a,-b,-c]/.PPerpO3RActivate/.PPerpADMRActivate//ToCanonical;
RPerp1mDefinition=PPerpR1m[-n,e,f,g]PPerpRPara[-e,-f,-g,a,b,c]RPerp[-a,-b,-c]/.PPerpO3RActivate/.PPerpADMRActivate//ToCanonical;
RPerp2pDefinition=PPerpR2p[-n,-m,e,f]PPerpRPerp[-e,-f,a,b,c]RPerp[-a,-b,-c]/.PPerpO3RActivate/.PPerpADMRActivate//ToCanonical;
RPerp2mDefinition=PPerpR2m[-n,-m,-o,e,f,g]PPerpRPara[-e,-f,-g,a,b,c]RPerp[-a,-b,-c]/.PPerpO3RActivate/.PPerpADMRActivate//ToCanonical;

TPerp0pActivate=MakeRule[{TPerp0p[],Scalar[Evaluate[TPerp0pDefinition]]},MetricOn->All,ContractMetrics->True];
TPerp1pActivate=MakeRule[{TPerp1p[-n,-m],Evaluate[TPerp1pDefinition]},MetricOn->All,ContractMetrics->True];
TPerp1mActivate=MakeRule[{TPerp1m[-n],Evaluate[TPerp1mDefinition]},MetricOn->All,ContractMetrics->True];
TPerp2pActivate=MakeRule[{TPerp2p[-n,-m],Evaluate[TPerp2pDefinition]},MetricOn->All,ContractMetrics->True];

RPerp0pActivate=MakeRule[{RPerp0p[],Scalar[Evaluate[RPerp0pDefinition]]},MetricOn->All,ContractMetrics->True];
RPerp0mActivate=MakeRule[{RPerp0m[],Scalar[Evaluate[RPerp0mDefinition]]},MetricOn->All,ContractMetrics->True];
RPerp1pActivate=MakeRule[{RPerp1p[-n,-m],Evaluate[RPerp1pDefinition]},MetricOn->All,ContractMetrics->True];
RPerp1mActivate=MakeRule[{RPerp1m[-n],Evaluate[RPerp1mDefinition]},MetricOn->All,ContractMetrics->True];
RPerp2pActivate=MakeRule[{RPerp2p[-n,-m],Evaluate[RPerp2pDefinition]},MetricOn->All,ContractMetrics->True];
RPerp2mActivate=MakeRule[{RPerp2m[-n,-m,-o],Evaluate[RPerp2mDefinition]},MetricOn->All,ContractMetrics->True];

TPerpO3Activate=Join[TPerp0pActivate,TPerp1pActivate,TPerp1mActivate,TPerp2pActivate];
RPerpO3Activate=Join[RPerp0pActivate,RPerp0mActivate,RPerp1pActivate,RPerp1mActivate,RPerp2pActivate,RPerp2mActivate];

TPerpDefinition= V[-a]TPerp1m[-b]+
TPerp1p[-a,-b]+
TPerp2p[-a,-b]+
(1/3)PPara[-a,-b]TPerp0p[]/.PPerpO3TActivate/.PADMActivate//ToCanonical;

DefTensor[RPerpPerp[-a,-b],M4,OrthogonalTo->{V[a],V[b]}];
xAct`HiGGS`Private`DeclareOrder[RPerpPerp[-a,-b],1];
DefTensor[RPerpPara[-a,-b,-c],M4,Antisymmetric[{-a,-b}],OrthogonalTo->{V[a],V[b],V[c]}];
xAct`HiGGS`Private`DeclareOrder[RPerpPara[-a,-b,-c],1];

RPerpPerpDefinition=RPerp1p[-a,-b]+
RPerp2p[-a,-b]-
(1/3)PPara[-a,-b]RPerp0p[]/.PPerpO3RActivate/.PADMActivate//ToCanonical;
RPerpParaDefinition=-(1/6) PR0m[-a,-b,-c]RPerp0m[]-Antisymmetrize[-PPara[-c,-a]RPerp1m[-b],{-a,-b}]+(4/3) RPerp2m[-a,-b,-c]/.PPerpO3RActivate/.PADMActivate//ToCanonical;

RPerpPerpActivate=MakeRule[{RPerpPerp[-a,-b],Evaluate[RPerpPerpDefinition]},MetricOn->All,ContractMetrics->True];
RPerpParaActivate=MakeRule[{RPerpPara[-a,-b,-c],Evaluate[RPerpParaDefinition]},MetricOn->All,ContractMetrics->True];
RPerpParaPerpActivate=Join[RPerpParaActivate,RPerpPerpActivate];

RPerpDefinition= RPerpPara[-a,-b,-c]+2Antisymmetrize[V[-a]RPerpPerp[-b,-c],{-a,-b}]/.RPerpParaPerpActivate/.PO3RActivate/.PADMActivate//ToCanonical;

TPerpDefinition=TPerpDefinition//CollectTensors//ScreenDollarIndices//CollectTensors;
RPerpDefinition=RPerpDefinition//CollectTensors//ScreenDollarIndices//CollectTensors;

TPerpActivate=MakeRule[{TPerp[-a,-b],Evaluate[TPerpDefinition]},MetricOn->All,ContractMetrics->True];
RPerpActivate=MakeRule[{RPerp[-a,-b,-c],Evaluate[RPerpDefinition]},MetricOn->All,ContractMetrics->True];
StrengthPerpToStrengthPerpO3=Join[TPerpActivate,RPerpActivate];
xAct`HiGGS`Private`ClearBuild[];

xAct`HiGGS`Private`BuildRebuild@"GeometricMultipliers/Lambda/LambdaSO3Inverse.m";
xAct`HiGGS`Private`BuildRebuild@"GeometricMultipliers/LambdaPi/LambdaPiSO3Inverse.m";

xAct`HiGGS`Private`BuildRebuild@"GeometricMultipliers/LambdaPi/LambdaPiToShell.m";

xAct`HiGGS`Private`IfBuild["PiPToPiPO3"];
OpenLastCache[];

(*=========================*)
(*  Begin move to PSALTer  *)
(*=========================*)

(* ::Input::Initialization:: *)
FPDefinition=((1/3)PPara[-n,-m]FP0p[]+
  FP1p[-n,-m]+
  FP2p[-n,-m]+
 V[-n]FP1m[-m])/.PO3PiActivate/.PADMActivate//ToNewCanonical;

APDefinition=(Antisymmetrize[ 2Antisymmetrize[V[-n](1/3)PPara[-m,-o]AP0p[],{-n,-m}]+
 2Antisymmetrize[V[-n]AP1p[-m,-o],{-n,-m}]+
 2Antisymmetrize[V[-n]AP2p[-m,-o],{-n,-m}]+
 (-1/6)PA0m[-n,-m,-o]AP0m[]+
 Antisymmetrize[-PPara[-m,-o]AP1m[-n],{-m,-n}]+
(4/3)AP2m[-n,-m,-o],{-n,-m}])/.PO3PiActivate/.PADMActivate//ToNewCanonical;

FPActivate=MakeRule[{FP[-n,-m],Evaluate[FPDefinition]},MetricOn->All,ContractMetrics->True];
APActivate=MakeRule[{AP[-n,-m,-o],Evaluate[APDefinition]},MetricOn->All,ContractMetrics->True];
FPActivateD=MakeRule[{Evaluate@Dagger@FP[-n,-m],Evaluate[Dagger@FPDefinition]},MetricOn->All,ContractMetrics->True];
APActivateD=MakeRule[{Evaluate@Dagger@AP[-n,-m,-o],Evaluate[Dagger@APDefinition]},MetricOn->All,ContractMetrics->True];
GaugePToGaugePO3=Join[FPActivate,APActivate,FPActivateD,APActivateD];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
FPerpDefinition=FPerp0p[]V[-n]+FPerp1m[-n];

APerpDefinition=APerp1p[-n,-m]+ 2Antisymmetrize[V[-m]APerp1m[-n],{-n,-m}];

FPerpActivate=MakeRule[{FPerp[-n],Evaluate[FPerpDefinition]},MetricOn->All,ContractMetrics->True];
APerpActivate=MakeRule[{APerp[-n,-m],Evaluate[APerpDefinition]},MetricOn->All,ContractMetrics->True];
FPerpActivateD=MakeRule[{Evaluate@Dagger@FPerp[-n],Evaluate[Dagger@FPerpDefinition]},MetricOn->All,ContractMetrics->True];
APerpActivateD=MakeRule[{Evaluate@Dagger@APerp[-n,-m],Evaluate[Dagger@APerpDefinition]},MetricOn->All,ContractMetrics->True];
GaugePerpToGaugePO3=Join[FPerpActivate,APerpActivate,FPerpActivateD,APerpActivateD];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
TauPDefinition=((1/3)PPara[-n,-m]TauP0p[]+
  TauP1p[-n,-m]+
  TauP2p[-n,-m]+
 V[-n]TauP1m[-m])/.PO3PiActivate/.PADMActivate//ToNewCanonical;

SigmaPDefinition=(Antisymmetrize[ 2Antisymmetrize[V[-n](1/3)PPara[-m,-o]SigmaP0p[],{-n,-m}]+
 2Antisymmetrize[V[-n]SigmaP1p[-m,-o],{-n,-m}]+
 2Antisymmetrize[V[-n]SigmaP2p[-m,-o],{-n,-m}]+
 (-1/6)PA0m[-n,-m,-o]SigmaP0m[]+
 Antisymmetrize[-PPara[-m,-o]SigmaP1m[-n],{-m,-n}]+
(4/3)SigmaP2m[-n,-m,-o],{-n,-m}])/.PO3PiActivate/.PADMActivate//ToNewCanonical;

TauPActivate=MakeRule[{TauP[-n,-m],Evaluate[TauPDefinition]},MetricOn->All,ContractMetrics->True];
SigmaPActivate=MakeRule[{SigmaP[-o,-n,-m],Evaluate[SigmaPDefinition]},MetricOn->All,ContractMetrics->True];

TauPActivateD=MakeRule[{Evaluate@Dagger@TauP[-n,-m],Evaluate[Dagger@TauPDefinition]},MetricOn->All,ContractMetrics->True];
SigmaPActivateD=MakeRule[{Evaluate@Dagger@SigmaP[-o,-n,-m],Evaluate[Dagger@SigmaPDefinition]},MetricOn->All,ContractMetrics->True];
(*remember change of order in indices due to Blagojevic*)
SourcePToGaugePO3=Join[TauPActivate,SigmaPActivate];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
TauPerpDefinition=TauPerp0p[]V[-n]+TauPerp1m[-n];

SigmaPerpDefinition=SigmaPerp1p[-n,-m]+ 2Antisymmetrize[V[-m]SigmaPerp1m[-n],{-n,-m}];

TauPerpActivate=MakeRule[{TauPerp[-n],Evaluate[TauPerpDefinition]},MetricOn->All,ContractMetrics->True];
SigmaPerpActivate=MakeRule[{SigmaPerp[-n,-m],Evaluate[SigmaPerpDefinition]},MetricOn->All,ContractMetrics->True];

TauPerpActivateD=MakeRule[{Evaluate@Dagger@TauPerp[-n],Evaluate[Dagger@TauPerpDefinition]},MetricOn->All,ContractMetrics->True];
SigmaPerpActivateD=MakeRule[{Evaluate@Dagger@SigmaPerp[-n,-m],Evaluate[Dagger@SigmaPerpDefinition]},MetricOn->All,ContractMetrics->True];
SourcePerpToGaugePO3=Join[TauPerpActivate,SigmaPerpActivate,TauPerpActivateD,SigmaPerpActivateD];
xAct`HiGGS`Private`ClearBuild[];

(*=======================*)
(*  End move to PSALTer  *)
(*=======================*)

(* ::Input::Initialization:: *)
ChiParaBSymb="\!\(\*SubsuperscriptBox[\(\[Chi]\), \(\[ScriptB]\), \(\[DoubleVerticalBar]\)]\)";
DefTensor[ChiParaB0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiParaBSymb,xAct`HiGGS`Private`Spin0m]];
xAct`HiGGS`Private`DeclareOrder[ChiParaB0m[],1];
DefTensor[ChiParaB1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiParaBSymb,xAct`HiGGS`Private`Spin1p]];
xAct`HiGGS`Private`DeclareOrder[ChiParaB1p[-a,-b],1];
DefTensor[ChiParaB1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiParaBSymb,xAct`HiGGS`Private`Spin1m]];
xAct`HiGGS`Private`DeclareOrder[ChiParaB1m[-a],1];
DefTensor[ChiParaB2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiParaBSymb,xAct`HiGGS`Private`Spin2m]];
xAct`HiGGS`Private`DeclareOrder[ChiParaB2m[-a,-b,-c],1];
ChiParaASymb="\!\(\*SubsuperscriptBox[\(\[Chi]\), \(\[ScriptCapitalA]\), \(\[DoubleVerticalBar]\)]\)";
DefTensor[ChiParaA0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiParaASymb,xAct`HiGGS`Private`Spin0p]];
xAct`HiGGS`Private`DeclareOrder[ChiParaA0p[],1];
DefTensor[ChiParaA0m[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiParaASymb,xAct`HiGGS`Private`Spin0m]];
xAct`HiGGS`Private`DeclareOrder[ChiParaA0m[],1];
DefTensor[ChiParaA1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiParaASymb,xAct`HiGGS`Private`Spin1p]];
xAct`HiGGS`Private`DeclareOrder[ChiParaA1p[-a,-b],1];
DefTensor[ChiParaA1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiParaASymb,xAct`HiGGS`Private`Spin1m]];
xAct`HiGGS`Private`DeclareOrder[ChiParaA1m[-a],1];
DefTensor[ChiParaA2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiParaASymb,xAct`HiGGS`Private`Spin2p]];
xAct`HiGGS`Private`DeclareOrder[ChiParaA2p[-a,-b],1];
DefTensor[ChiParaA2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[ChiParaASymb,xAct`HiGGS`Private`Spin2m]];
xAct`HiGGS`Private`DeclareOrder[ChiParaA2m[-a,-b,-c],1];
AutomaticRules[ChiParaB2m,MakeRule[{ChiParaB2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[ChiParaB2m,MakeRule[{epsilonG[a,b,c,d]ChiParaB2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[ChiParaA2m,MakeRule[{ChiParaA2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[ChiParaA2m,MakeRule[{epsilonG[a,b,c,d]ChiParaA2m[-a,-b,-c],0},MetricOn->All,ContractMetrics->True]];

ChiParaB0mDefinition=TP0m[]/.PADMActivate//ToCanonical;
ChiParaB1pDefinition=TP1p[-i,-j]/.PADMActivate//ToCanonical;
ChiParaB1mDefinition=TP1m[-i]/.PADMActivate//ToCanonical;
ChiParaB2mDefinition=TP2m[-i,-j,-k]/.PADMActivate//ToCanonical;
ChiParaA0pDefinition=RP0p[]/.PADMActivate//ToCanonical;
ChiParaA0mDefinition=RP0m[]/.PADMActivate//ToCanonical;
ChiParaA1pDefinition=RP1p[-i,-j]/.PADMActivate//ToCanonical;
ChiParaA1mDefinition=RP1m[-i]/.PADMActivate//ToCanonical;
ChiParaA2pDefinition=RP2p[-i,-j]/.PADMActivate//ToCanonical;
ChiParaA2mDefinition=RP2m[-i,-j,-k]/.PADMActivate//ToCanonical;

ChiParaB0mActivate=MakeRule[{ChiParaB0m[],Evaluate[ChiParaB0mDefinition]},MetricOn->All,ContractMetrics->True];
ChiParaB1pActivate=MakeRule[{ChiParaB1p[-i,-j],Evaluate[ChiParaB1pDefinition]},MetricOn->All,ContractMetrics->True];
ChiParaB1mActivate=MakeRule[{ChiParaB1m[-i],Evaluate[ChiParaB1mDefinition]},MetricOn->All,ContractMetrics->True];
ChiParaB2mActivate=MakeRule[{ChiParaB2m[-i,-j,-k],Evaluate[ChiParaB2mDefinition]},MetricOn->All,ContractMetrics->True];
ChiParaA0pActivate=MakeRule[{ChiParaA0p[],Evaluate[ChiParaA0pDefinition]},MetricOn->All,ContractMetrics->True];
ChiParaA0mActivate=MakeRule[{ChiParaA0m[],Evaluate[ChiParaA0mDefinition]},MetricOn->All,ContractMetrics->True];
ChiParaA1pActivate=MakeRule[{ChiParaA1p[-i,-j],Evaluate[ChiParaA1pDefinition]},MetricOn->All,ContractMetrics->True];
ChiParaA1mActivate=MakeRule[{ChiParaA1m[-i],Evaluate[ChiParaA1mDefinition]},MetricOn->All,ContractMetrics->True];
ChiParaA2pActivate=MakeRule[{ChiParaA2p[-i,-j],Evaluate[ChiParaA2pDefinition]},MetricOn->All,ContractMetrics->True];
ChiParaA2mActivate=MakeRule[{ChiParaA2m[-i,-j,-k],Evaluate[ChiParaA2mDefinition]},MetricOn->All,ContractMetrics->True];

ChiParaActivate=Join[ChiParaB0mActivate,ChiParaB1pActivate,ChiParaB1mActivate,ChiParaB2mActivate,ChiParaA0pActivate,ChiParaA0mActivate,ChiParaA1pActivate,ChiParaA1mActivate,ChiParaA2pActivate,ChiParaA2mActivate];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
SuperHamiltonianSymb="\!\(\*SubscriptBox[\(\[ScriptCapitalH]\), \(\[ScriptB]\)]\)";
DefTensor[SuperHamiltonian0p[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[SuperHamiltonianSymb,xAct`HiGGS`Private`Spin0p]];
xAct`HiGGS`Private`DeclareOrder[SuperHamiltonian0p[],1];
LinearSuperMomentumSymb="\!\(\*SubscriptBox[\(\[ScriptCapitalH]\), \(\[ScriptB]\)]\)";
DefTensor[LinearSuperMomentum1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[LinearSuperMomentumSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]}];
xAct`HiGGS`Private`DeclareOrder[LinearSuperMomentum1m[-a],1];
RotationalSuperMomentumSymb="\!\(\*SubscriptBox[\(\[ScriptCapitalH]\), \(\[ScriptCapitalA]\)]\)";
DefTensor[RotationalSuperMomentum1m[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[RotationalSuperMomentumSymb,xAct`HiGGS`Private`Spin1m],OrthogonalTo->{V[a]}];
xAct`HiGGS`Private`DeclareOrder[RotationalSuperMomentum1m[-a],1];
DefTensor[RotationalSuperMomentum1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RotationalSuperMomentumSymb,xAct`HiGGS`Private`Spin1p],OrthogonalTo->{V[a],V[b]}];
xAct`HiGGS`Private`DeclareOrder[RotationalSuperMomentum1p[-a,-b],1];
xAct`HiGGS`Private`ClearBuild[];

xAct`HiGGS`Private`BuildRebuild@"Smearing.m";

xAct`HiGGS`Private`BuildRebuild@"Induced.m";

xAct`HiGGS`Private`BuildRebuild@"ComputeShellFreedoms.m";

xAct`HiGGS`Private`BuildRebuild@"DefFieldStrengthShell.m";

(* ::Input::Initialization:: *)
DefTensor[PerpBComplement[-i,-k],M4];
DefTensor[OrigBComplement[-i,-k],M4];
DefTensor[SingBComplement[-i,-k],M4];
DefTensor[PerpAComplement[-i,-j,-k],M4,Antisymmetric[{-i,-j}]];
DefTensor[OrigAComplement[-i,-j,-k],M4,Antisymmetric[{-i,-j}]];
DefTensor[SingAComplement[-i,-j,-k],M4,Antisymmetric[{-i,-j}]];
xAct`HiGGS`Private`ClearBuild[];

xAct`HiGGS`Private`IfBuild["GeneralComplements"];
OpenLastCache[];

xAct`HiGGS`Private`IfBuild["CDPiPToCDPiPO3"];
OpenLastCache[];

xAct`HiGGS`Private`IfBuild["NesterFormIfConstraints"];
OpenLastCache[];

xAct`HiGGS`Private`IfBuild["NesterFormIfConstraintsVarPhi"];
OpenLastCache[];

xAct`HiGGS`Private`BuildRebuild@"PoissonBracket.m";

xAct`HiGGS`Private`BuildRebuild@"InternalIndices.m";
