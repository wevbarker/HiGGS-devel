(*========*)
(*  Main  *)
(*========*)

xAct`HiGGS`Private`$PrintCellsBeforeBuildHiGGS=Flatten@Cells[SelectedNotebook[],CellStyle->{"Print"}];

xAct`HiGGS`Private`BuildGlobally@"DefManifold.m";

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
RLambdaSymb="\!\(\*SubscriptBox[\(\[Lambda]\), \(\[ScriptCapitalR]\)]\)"
DefTensor[RLambda[a, b, -d, -e], M4, {Antisymmetric[{a, b}], Antisymmetric[{-d, -e}]},PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaSymb]]; 
xAct`HiGGS`Private`DeclareOrder[RLambda[a, b, -d, -e], 1]; 
TLambdaSymb="\!\(\*SubscriptBox[\(\[Lambda]\), \(\[ScriptCapitalT]\)]\)";
DefTensor[TLambda[a, -d, -e], M4, Antisymmetric[{-d, -e}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaSymb]]; 
xAct`HiGGS`Private`DeclareOrder[TLambda[a, -d, -e], 1];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
(*
(*This is where we get the notation for generating sets of permutations from, not the documentation!*)
xAct`HiGGS`Private`HiGGSPrint[RiemannSymmetry[{-i,-j,-m,-n}]];
*)
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


(*
(1/2)(R[a,-i,-a,-j]+R[a,-j,-a,-i])-(1/4)G[-i,-j]R[a,b,-a,-b]/.StrengthSO13Activate/.StrengthLambdaSO13Activate;
%//ToNewCanonical;
%//ToCanonical;
*)
R4Activate=MakeRule[{R4[-i,-j],(1/2)(R[a,-i,-a,-j]+R[a,-j,-a,-i])-(1/4)G[-i,-j]R[a,b,-a,-b]},MetricOn->All,ContractMetrics->True];
(*
(1/2)(R[a,-i,-a,-j]-R[a,-j,-a,-i])/.StrengthSO13Activate/.StrengthLambdaSO13Activate;
%//ToNewCanonical;
%//ToCanonical;
*)
R5Activate=MakeRule[{R5[-i,-j],(1/2)(R[a,-i,-a,-j]-R[a,-j,-a,-i])},MetricOn->All,ContractMetrics->True];
(*
-R[a,b,-a,-b]/.StrengthSO13Activate/.StrengthLambdaSO13Activate;
%//ToNewCanonical;
%//ToCanonical;
*)
R6Activate=MakeRule[{R6[],-R[a,b,-a,-b]},MetricOn->All,ContractMetrics->True];
RActivate=Join[R4Activate,R5Activate,R6Activate];
xAct`HiGGS`Private`ClearBuild[];


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
TauSymb="\[Tau]";
DefTensor[Tau[-i,-j],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TauSymb],Dagger->Complex];
xAct`HiGGS`Private`DeclareOrder[Tau[-i,-j], 1]; 
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
DefTensor[RLambda1[-i,-j,-m,-n], M4,StrongGenSet[{-i,-j,-m,-n},GenSet[Cycles[{-i,-j},{-m,-n}],Cycles[{-i,-m}],Cycles[{-j,-n}]]], PrintAs ->xAct`HiGGS`Private`SymbolBuild[RLambdaSymb,xAct`HiGGS`Private`SO1]]; 
xAct`HiGGS`Private`DeclareOrder[RLambda1[-i,-j,-m,-n], 1]; 
DefTensor[RLambda2[-i,-j,-m,-n], M4,StrongGenSet[{-i,-j,-m,-n},GenSet[-Cycles[{-i,-m},{-j,-n}],-Cycles[{-i,-j}],-Cycles[{-m,-n}]]], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RLambdaSymb,xAct`HiGGS`Private`SO2]]; 
xAct`HiGGS`Private`DeclareOrder[RLambda2[-i,-j,-m,-n], 1]; 
DefTensor[RLambda3[-i,-j,-m,-n], M4,Antisymmetric[{-i,-j,-m,-n}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RLambdaSymb,xAct`HiGGS`Private`SO3]]; 
xAct`HiGGS`Private`DeclareOrder[RLambda3[-i,-j,-m,-n], 1]; 
DefTensor[RLambda4[-i,-j], M4,Symmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RLambdaSymb,xAct`HiGGS`Private`SO4]]; 
xAct`HiGGS`Private`DeclareOrder[RLambda4[-i,-j], 1]; 
DefTensor[RLambda5[-i,-j], M4,Antisymmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RLambdaSymb,xAct`HiGGS`Private`SO5]]; 
xAct`HiGGS`Private`DeclareOrder[RLambda5[-i,-j], 1]; 
DefTensor[RLambda6[], M4, PrintAs -> xAct`HiGGS`Private`SymbolBuild[RLambdaSymb,xAct`HiGGS`Private`SO6]]; 
xAct`HiGGS`Private`DeclareOrder[RLambda6[], 1]; 
DefTensor[TLambda1[-i,-j,-k], M4,Symmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[TLambdaSymb,xAct`HiGGS`Private`SO1]]; 
xAct`HiGGS`Private`DeclareOrder[TLambda1[-i,-j,-k], 1]; 
DefTensor[TLambda2[-i], M4, PrintAs -> xAct`HiGGS`Private`SymbolBuild[TLambdaSymb,xAct`HiGGS`Private`SO2]]; 
xAct`HiGGS`Private`DeclareOrder[TLambda2[-i], 1]; 
DefTensor[TLambda3[-i], M4, PrintAs -> xAct`HiGGS`Private`SymbolBuild[TLambdaSymb,xAct`HiGGS`Private`SO3]]; 
xAct`HiGGS`Private`DeclareOrder[TLambda3[-i], 1]; 
AutomaticRules[RLambda1,MakeRule[{RLambda1[a,a1,b,-b],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[RLambda1,MakeRule[{RLambda1[a,b,a1,-b],0},MetricOn->All,ContractMetrics->True]];
(*AutomaticRules[RLambda1,MakeRule[{RLambda1[a,-a,a1,-a1],0},MetricOn\[Rule]All,ContractMetrics\[Rule]True]];*)(*redundant*)
(*AutomaticRules[RLambda1,MakeRule[{RLambda1[a,a1,-a,-a1],0},MetricOn\[Rule]All,ContractMetrics\[Rule]True]];*)(*redundant*)
AutomaticRules[RLambda2,MakeRule[{RLambda2[a,b,a1,-b],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[RLambda4,MakeRule[{RLambda4[a,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[TLambda1,MakeRule[{TLambda1[a,a1,-a1],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[TLambda1,MakeRule[{TLambda1[a,-a,-a1],0},MetricOn->All,ContractMetrics->True]];

RLambdaDefinition=RLambda3[-i,-j,-m,-n]+
(2/3)(2RLambda1[-i,-j,-m,-n]+
RLambda1[-i,-m,-j,-n])+
RLambda2[-i,-j,-m,-n]+
(1/2)(G[-i,-m](RLambda5[-j,-n]+RLambda4[-j,-n])+
G[-j,-n](RLambda5[-i,-m]+RLambda4[-i,-m])-
G[-j,-m](RLambda5[-i,-n]+RLambda4[-i,-n])-
G[-i,-n](RLambda5[-j,-m]+RLambda4[-j,-m]))-
(1/12)(G[-i,-m]G[-j,-n]-G[-i,-n]G[-j,-m])RLambda6[];

TLambdaDefinition=(2/3)(TLambda1[-i,-j,-k]-TLambda1[-i,-k,-j])+
(1/3)(G[-i,-j]TLambda2[-k]-G[-i,-k]TLambda2[-j])+
epsilonG[-i,-j,-k,-m]TLambda3[m];

RLambdaSO13Activate=MakeRule[{RLambda[-i,-j,-m,-n],Evaluate[RLambdaDefinition]},MetricOn->All,ContractMetrics->True];
TLambdaSO13Activate=MakeRule[{TLambda[-i,-j,-k],Evaluate[TLambdaDefinition]},MetricOn->All,ContractMetrics->True];

StrengthLambdaSO13Activate=Join[RLambdaSO13Activate,TLambdaSO13Activate];
xAct`HiGGS`Private`ClearBuild[];


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

StrengthLambdaSO13Activate=Join[RLambdaSO13Activate,TLambdaSO13Activate];
xAct`HiGGS`Private`ClearBuild[];


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
xAct`HiGGS`Private`HiGGSPrint[ActiveCellTags];
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

tmp=PR1[-i,-j,-k,-l,a,b,c,d]RLambda[-a,-b,-c,-d]/.PActivate/.StrengthLambdaSO13Activate//ToNewCanonical;
xAct`HiGGS`Private`HiGGSPrint[tmp];
tmp=PR2[-i,-j,-k,-l,a,b,c,d]RLambda[-a,-b,-c,-d]/.PActivate/.StrengthLambdaSO13Activate//ToNewCanonical;
xAct`HiGGS`Private`HiGGSPrint[tmp];
tmp=PR3[-i,-j,-k,-l,a,b,c,d]RLambda[-a,-b,-c,-d]/.PActivate/.StrengthLambdaSO13Activate//ToNewCanonical;
xAct`HiGGS`Private`HiGGSPrint[tmp];
tmp=PR4[-i,-j,-k,-l,a,b,c,d]RLambda[-a,-b,-c,-d]/.PActivate/.StrengthLambdaSO13Activate//ToNewCanonical;
xAct`HiGGS`Private`HiGGSPrint[tmp];
tmp=PR5[-i,-j,-k,-l,a,b,c,d]RLambda[-a,-b,-c,-d]/.PActivate/.StrengthLambdaSO13Activate//ToNewCanonical;
xAct`HiGGS`Private`HiGGSPrint[tmp];
tmp=PR6[-i,-j,-k,-l,a,b,c,d]RLambda[-a,-b,-c,-d]/.PActivate/.StrengthLambdaSO13Activate//ToNewCanonical;
xAct`HiGGS`Private`HiGGSPrint[tmp];
tmp=PT1[-i,-j,-k,a,b,c]TLambda[-a,-b,-c]/.PActivate/.StrengthLambdaSO13Activate//ToNewCanonical;
xAct`HiGGS`Private`HiGGSPrint[tmp];
tmp=PT2[-i,-j,-k,a,b,c]TLambda[-a,-b,-c]/.PActivate/.StrengthLambdaSO13Activate//ToNewCanonical;
xAct`HiGGS`Private`HiGGSPrint[tmp];
tmp=PT3[-i,-j,-k,a,b,c]TLambda[-a,-b,-c]/.PActivate/.StrengthLambdaSO13Activate//ToNewCanonical;
xAct`HiGGS`Private`HiGGSPrint[tmp];
xAct`HiGGS`Private`ClearBuild[];
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

(*Defining parallel field strength multipliers*)
RLambdaPpSymb="\!\(\*SubsuperscriptBox[\(\[Lambda]\), \(\[ScriptCapitalR]\), \(\[DoubleVerticalBar]\)]\)";
DefTensor[RLambdaP[-a,-b,-c,-d],M4,{Antisymmetric[{-a,-b}],Antisymmetric[{-c,-d}]},PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPpSymb],OrthogonalTo->{V[c],V[d]}];
xAct`HiGGS`Private`DeclareOrder[RLambdaP[-a,-b,-c,-d],1];
TLambdaPpSymb="\!\(\*SubsuperscriptBox[\(\[Lambda]\), \(\[ScriptCapitalT]\), \(\[DoubleVerticalBar]\)]\)";
DefTensor[TLambdaP[-a,-c,-d],M4,Antisymmetric[{-c,-d}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPpSymb],OrthogonalTo->{V[c],V[d]}];
xAct`HiGGS`Private`DeclareOrder[TLambdaP[-a,-c,-d],1];
TLambdaPToTLambda=MakeRule[{TLambdaP[-a,-b,-c],PPara[-b,e]PPara[-c,f]TLambda[-a,-e,-f]},MetricOn->All,ContractMetrics->True];
RLambdaPToRLambda=MakeRule[{RLambdaP[-a,-b,-c,-d],PPara[-c,e]PPara[-d,f]RLambda[-a,-b,-e,-f]},MetricOn->All,ContractMetrics->True];
StrengthLambdaPToStrengthLambda=Join[RLambdaPToRLambda,TLambdaPToTLambda];

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

(*Defining perpendicular field strength multipliers*)
TLambdaPerppSymb="\!\(\*SubsuperscriptBox[\(\[Lambda]\), \(\[ScriptCapitalT]\), \(\[UpTee]\)]\)";
DefTensor[TLambdaPerp[-a,-b],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPerppSymb],OrthogonalTo->{V[b]}];
xAct`HiGGS`Private`DeclareOrder[TLambdaPerp[-a,-b],1];
RLambdaPerppSymb="\!\(\*SubsuperscriptBox[\(\[Lambda]\), \(\[ScriptCapitalR]\), \(\[UpTee]\)]\)";
DefTensor[RLambdaPerp[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPerppSymb],OrthogonalTo->{V[c]}];
xAct`HiGGS`Private`DeclareOrder[RLambdaPerp[-a,-b,-c],1];
TLambdaPerpToTLambda=MakeRule[{TLambdaPerp[-a,-b],PPara[-b,f]V[g]TLambda[-a,-f,-g]},MetricOn->All,ContractMetrics->True];
RLambdaPerpToRLambda=MakeRule[{RLambdaPerp[-a,-b,-c],PPara[-c,e]V[f]RLambda[-a,-b,-e,-f]},MetricOn->All,ContractMetrics->True];
StrengthLambdaPerpToStrengthLambda=Join[RLambdaPerpToRLambda,TLambdaPerpToTLambda];

RDecomposeDefinition=RP[-a,-b,-c,-d]+2Antisymmetrize[V[-d]RPerp[-a,-b,-c],{-c,-d}]/.ExpandStrengths/.PADMActivate//ToCanonical//CollectTensors//ScreenDollarIndices//CollectTensors;
TDecomposeDefinition=TP[-a,-c,-d]+2Antisymmetrize[V[-d]TPerp[-a,-c],{-c,-d}]/.ExpandStrengths/.PADMActivate//ToCanonical//CollectTensors//ScreenDollarIndices//CollectTensors;
RDecompose=MakeRule[{R[-a,-b,-c,-d],Evaluate[RDecomposeDefinition]},MetricOn->All,ContractMetrics->True];
TDecompose=MakeRule[{T[-a,-c,-d],Evaluate[TDecomposeDefinition]},MetricOn->All,ContractMetrics->True];
StrengthDecompose=Join[RDecompose,TDecompose];

RLambdaDecomposeDefinition=RLambdaP[-a,-b,-c,-d]+2Antisymmetrize[V[-d]RLambdaPerp[-a,-b,-c],{-c,-d}]/.ExpandStrengths/.PADMActivate//ToCanonical//CollectTensors//ScreenDollarIndices//CollectTensors;
TLambdaDecomposeDefinition=TLambdaP[-a,-c,-d]+2Antisymmetrize[V[-d]TLambdaPerp[-a,-c],{-c,-d}]/.ExpandStrengths/.PADMActivate//ToCanonical//CollectTensors//ScreenDollarIndices//CollectTensors;
RLambdaDecompose=MakeRule[{RLambda[-a,-b,-c,-d],Evaluate[RLambdaDecomposeDefinition]},MetricOn->All,ContractMetrics->True];
TLambdaDecompose=MakeRule[{TLambda[-a,-c,-d],Evaluate[TLambdaDecomposeDefinition]},MetricOn->All,ContractMetrics->True];
StrengthLambdaDecompose=Join[RLambdaDecompose,TLambdaDecompose];

CDBCommute=MakeRule[{CD[-s][B[a,-r]],Evaluate[CD[-r][B[a,-s]]-2Antisymmetrize[A[a,-k,-s]B[k,-r],{-s,-r}]+B[b,-s]B[c,-r]T[a,-b,-c]]},MetricOn->All,ContractMetrics->True];(*Might want to write an equivalent version for Riemann Cartan curvature*)

DefTensor[DV[-a,-j],M4,OrthogonalTo->{V[j]},PrintAs->xAct`HiGGS`Private`SymbolBuild[VSymb,"Derivative"->1]];
DefTensor[DJ[-a],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[JSymb,"Derivative"->1]];










G3VCDBToG3DV=MakeRule[{G3[-l,n]V[-k]CD[-m][B[k,-n]],-G3[-l,n]B[j,-n]A[k,-j,-m]V[-k]-G3[-l,n]B[j,-n]DV[-m,-j]},MetricOn->All,ContractMetrics->True];

G3HCDBToDJ=MakeRule[{G3[n,-s]H[-k,s]CD[-m][B[k,-n]],Ji[]DJ[-m]-V[k]H[-k,a]G3[-a,b](B[j,-b]DV[-m,-j]+V[-l]A[l,-j,-m]B[j,-b])},MetricOn->All,ContractMetrics->True];

xAct`HiGGS`Private`BuildGlobally@"CovD.m";

xAct`HiGGS`Private`BuildGlobally@"CDBToGaugeCovDB.m";


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


(* ::Input::Initialization:: *)

(*Tools for covariance check, which is useful for emergencies but otherwise commented out*)
(*
DefTensor[CCoord[-a,-b,c],M4,Symmetric[{-a,-b}]]
DefTensor[FLorentz[-a,-b,-c],M4,PrintAs\[Rule]"FAIL\[CapitalLambda]"]
DefTensor[FCoord[-a,-b,-c],M4,PrintAs\[Rule]"FAIL\[CapitalChi]"]
DefTensor[Lorentz[a,-b],M4,PrintAs\[Rule]"\[CapitalLambda]"]
AutomaticRules[Lorentz,MakeRule[{Lorentz[-a,-b]Lorentz[a,-c],G[-b,-c]},MetricOn\[Rule]All,ContractMetrics\[Rule]True]];
AutomaticRules[Lorentz,MakeRule[{Lorentz[-b,-a]Lorentz[-c,a],G[-c,-b]},MetricOn\[Rule]All,ContractMetrics\[Rule]True]];
DefTensor[Coord[a,-b],M4,PrintAs\[Rule]"\[CapitalChi]"]
AutomaticRules[Coord,MakeRule[{Coord[-a,-b]Coord[a,-c],G[-b,-c]},MetricOn\[Rule]All,ContractMetrics\[Rule]True]];
AutomaticRules[Coord,MakeRule[{Coord[-b,-a]Coord[-c,a],G[-c,-b]},MetricOn\[Rule]All,ContractMetrics\[Rule]True]];

DefTensor[CDBInert[-a,b,-c],M4];
DefTensor[CDAInert[-a,b,c,-d],M4,Antisymmetric[{b,c}]];
ToCDBInert=MakeRule[{CD[-a][B[b,-c]],CDBInert[-a,b,-c]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];
ToCDAInert=MakeRule[{CD[-a][A[b,c,-d]],CDAInert[-a,b,c,-d]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];
ToCDInert=Join[ToCDBInert,ToCDAInert];

GaugeB=MakeRule[{B[b,-c],Lorentz[b,-j]Coord[-c,k]B[j,-k]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];
GaugeH=MakeRule[{H[-b,c],Lorentz[-b,j]Coord[c,-k]H[-j,k]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];
GaugeV=MakeRule[{V[b],Lorentz[b,-j]V[j]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];
GaugeA=MakeRule[{A[b,c,-d],Lorentz[b,-j]Lorentz[c,-k]Coord[-d,l]A[j,k,-l]-Lorentz[c,j]Coord[-d,l]CD[-l][Lorentz[b,-j]]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];
GaugeMe=Join[GaugeB,GaugeH,GaugeV,GaugeA];

GaugeCDA=MakeRule[{CDAInert[-a,b,c,-d],Coord[-a,i]CD[-i][Lorentz[b,-j]Lorentz[c,-k]Coord[-d,l]A[j,k,-l]-Lorentz[c,j]Coord[-d,l]CD[-l][Lorentz[b,-j]]]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];
GaugeCDB=MakeRule[{CDBInert[-a,b,-c],Coord[-a,i]CD[-i][Lorentz[b,-j]Coord[-c,k]B[j,-k]]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];
GaugeMeInert=Join[GaugeCDB,GaugeCDA];

ToCCoord=MakeRule[{CD[-a][Coord[-b,c]],Coord[s,-a]CCoord[-s,-b,c]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];

DefTensor[Toten[b,-c,d],M4,Symmetric[{b,d}]];
(*SwitchMe=MakeRule[{Lorentz[a,-b]CD[-c][Lorentz[-a,-d]],Toten[-b,-c,-d]-Lorentz[-a,-d]CD[-c][Lorentz[a,-b]]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];*)
(*SwitchMe=MakeRule[{Lorentz[a,-b]CD[-c][Lorentz[-a,-d]],-Lorentz[-a,-d]CD[-c][Lorentz[a,-b]]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];*)
CommuteMe=MakeRule[{Lorentz[a,-b]CD[-c][Lorentz[-a,-d]],Evaluate[Antisymmetrize[Lorentz[a,-b]CD[-c][Lorentz[-a,-d]],{-b,-d}]]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];
SwitchMe=MakeRule[{Lorentz[a,-b]CD[-c][Lorentz[-a,-d]],-Lorentz[-a,-d]CD[-c][Lorentz[a,-b]]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];

FlagLorentz=MakeRule[{CD[-a][Lorentz[-b,-c]],FLorentz[-a,-b,-c]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];
FlagCoord=MakeRule[{CD[-a][Coord[-b,-c]],FCoord[-a,-b,-c]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];
FlagBroken=Join[FlagLorentz,FlagCoord];

ManRemoveG3=MakeRule[{G3[-b,c],G[-b,c]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];

GaugeShift[x_]:=Module[{exp},
exp=x;
xAct`HiGGS`Private`HiGGSPrint[Style["Manually removing G3",Blue,10]];
exp=exp/.ManRemoveG3;
xAct`HiGGS`Private`HiGGSPrint[Style["simplifying",Blue,10]];
exp=exp//ToCanonical//ScreenDollarIndices//ContractMetric//CollectTensors;
xAct`HiGGS`Private`HiGGSPrint[Style["Converting to inert",Blue,10]];
exp=exp/.ToCDInert;
xAct`HiGGS`Private`HiGGSPrint[Style["simplifying",Blue,10]];
exp=exp//ToCanonical//ScreenDollarIndices//ContractMetric//CollectTensors;
xAct`HiGGS`Private`HiGGSPrint[Style["transforming gauge",Blue,10]];
exp=exp/.GaugeMe;
xAct`HiGGS`Private`HiGGSPrint[Style["simplifying",Blue,10]];
exp=exp//ToCanonical//ScreenDollarIndices//ContractMetric//CollectTensors;
xAct`HiGGS`Private`HiGGSPrint[Style["transforming CD gauge",Blue,10]];
exp=exp/.GaugeMeInert;
xAct`HiGGS`Private`HiGGSPrint[Style["simplifying",Blue,10]];
exp=exp//ToCanonical//ScreenDollarIndices//ContractMetric//CollectTensors;
xAct`HiGGS`Private`HiGGSPrint[Style["transforming to coordinate Hessian",Blue,10]];
exp=exp/.ToCCoord;
xAct`HiGGS`Private`HiGGSPrint[Style["simplifying",Blue,10]];
exp=exp//ToCanonical//ScreenDollarIndices//ContractMetric//CollectTensors;
xAct`HiGGS`Private`HiGGSPrint[Style["removing scalar",Blue,10]];
exp=exp//NoScalar;
xAct`HiGGS`Private`HiGGSPrint[Style["commuting Lorentz gradients",Blue,10]];
exp=exp/.SwitchMe;
xAct`HiGGS`Private`HiGGSPrint[Style["simplifying",Blue,10]];
exp=exp//ToCanonical//ScreenDollarIndices//ContractMetric//CollectTensors;
xAct`HiGGS`Private`HiGGSPrint[Style["removing scalar",Blue,10]];
exp=exp//NoScalar;
xAct`HiGGS`Private`HiGGSPrint[Style["commuting Lorentz gradients",Blue,10]];
exp=exp/.CommuteMe;
xAct`HiGGS`Private`HiGGSPrint[Style["simplifying",Blue,10]];
exp=exp//ToCanonical//ScreenDollarIndices//ContractMetric//CollectTensors;
xAct`HiGGS`Private`HiGGSPrint[Style["removing scalar",Blue,10]];
exp=exp//NoScalar;
xAct`HiGGS`Private`HiGGSPrint[Style["commuting Lorentz gradients",Blue,10]];
exp=exp/.SwitchMe;
xAct`HiGGS`Private`HiGGSPrint[Style["simplifying",Blue,10]];
exp=exp//ToCanonical//ScreenDollarIndices//ContractMetric//CollectTensors;
xAct`HiGGS`Private`HiGGSPrint[Style["raising flags",Blue,10]];
exp=exp/.FlagBroken;
exp];
*)



MakeDDeactivate[Tensor_?xTensorQ[Indices___]]:=Module[{NewIndex,QuotientRule,DTensorActivate,DTensor,DTensorDeactivate,DTensorDeactivateDefinition},
NewIndex=First@((First@IndicesOfVBundle@TangentM4)~Complement~((PowerExpand@Sqrt@(#^2))&/@List@Indices));
DTensor=ToExpression@("D"<>ToString@Tensor);
DTensorDeactivateDefinition=CD[-NewIndex]@Tensor[Indices]/.ToExpression@(ToString@DTensor<>"Activate");
DTensorDeactivateDefinition=DTensorDeactivateDefinition-CD[-NewIndex]@Tensor[Indices];
DTensorDeactivate=MakeQuotientRule[{DTensor[-NewIndex,Indices],Evaluate@DTensorDeactivateDefinition}];
ToExpression[ToString@DTensor<>"Deactivate", InputForm, Function[name, name = DTensorDeactivate, HoldAll]];
DDeactivate=DDeactivate~Join~DTensorDeactivate;
];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
DefTensor[DR[-z,-i,-j,-m,-n], M4,{Antisymmetric[{-i, -j}], Antisymmetric[{-m, -n}]}, PrintAs->xAct`HiGGS`Private`SymbolBuild[RSymb,"Derivative"->1]]; 
xAct`HiGGS`Private`DeclareOrder[DR[-z,-i,-j,-m,-n],1];
DefTensor[DRLambda[-z,-i,-j,-m,-n], M4,{Antisymmetric[{-i, -j}], Antisymmetric[{-m, -n}]}, PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaSymb,"Derivative"->1]]; 
xAct`HiGGS`Private`DeclareOrder[DRLambda[-z,-i,-j,-m,-n],1];
DefTensor[DT[-z,-i,-j,-k], M4,Antisymmetric[{-j,-k}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[TSymb,"Derivative"->1]]; 
xAct`HiGGS`Private`DeclareOrder[DT[-z,-i,-j,-k],1];
DefTensor[DTLambda[-z,-i,-j,-k], M4,Antisymmetric[{-j,-k}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[TLambdaSymb,"Derivative"->1]];
xAct`HiGGS`Private`DeclareOrder[DTLambda[-z,-i,-j,-k],1];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
DefTensor[DRLambda1[-z,-i,-j,-m,-n], M4,StrongGenSet[{-i,-j,-m,-n},GenSet[Cycles[{-i,-j},{-m,-n}],Cycles[{-i,-m}],Cycles[{-j,-n}]]], PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaSymb,SO1,"Derivative"->1]]; 
xAct`HiGGS`Private`DeclareOrder[DRLambda1[-z,-i,-j,-m,-n],1];
DefTensor[DRLambda2[-z,-i,-j,-m,-n], M4,StrongGenSet[{-i,-j,-m,-n},GenSet[-Cycles[{-i,-m},{-j,-n}],-Cycles[{-i,-j}],-Cycles[{-m,-n}]]], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RLambdaSymb,SO2,"Derivative"->1]]; 
xAct`HiGGS`Private`DeclareOrder[DRLambda2[-z,-i,-j,-m,-n],1];
DefTensor[DRLambda3[-z,-i,-j,-m,-n], M4,Antisymmetric[{-i,-j,-m,-n}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RLambdaSymb,SO3,"Derivative"->1]]; 
xAct`HiGGS`Private`DeclareOrder[DRLambda3[-z,-i,-j,-m,-n],1];
DefTensor[DRLambda4[-z,-i,-j], M4,Symmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RLambdaSymb,SO4,"Derivative"->1]]; 
xAct`HiGGS`Private`DeclareOrder[DRLambda4[-z,-i,-j],1];
DefTensor[DRLambda5[-z,-i,-j], M4,Antisymmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RLambdaSymb,SO5,"Derivative"->1]]; 
xAct`HiGGS`Private`DeclareOrder[DRLambda5[-z,-i,-j],1];
DefTensor[DRLambda6[-z], M4, PrintAs ->xAct`HiGGS`Private`SymbolBuild[RLambdaSymb,SO6,"Derivative"->1]];
xAct`HiGGS`Private`DeclareOrder[DRLambda6[-z],1];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
DefTensor[DR1[-z,-i,-j,-m,-n], M4,StrongGenSet[{-i,-j,-m,-n},GenSet[Cycles[{-i,-j},{-m,-n}],Cycles[{-i,-m}],Cycles[{-j,-n}]]], PrintAs->xAct`HiGGS`Private`SymbolBuild[RSymb,SO1,"Derivative"->1]]; 
xAct`HiGGS`Private`DeclareOrder[DR1[-z,-i,-j,-m,-n],1];
DefTensor[DR2[-z,-i,-j,-m,-n], M4,StrongGenSet[{-i,-j,-m,-n},GenSet[-Cycles[{-i,-m},{-j,-n}],-Cycles[{-i,-j}],-Cycles[{-m,-n}]]], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RSymb,SO2,"Derivative"->1]]; 
xAct`HiGGS`Private`DeclareOrder[DR2[-z,-i,-j,-m,-n],1];
DefTensor[DR3[-z,-i,-j,-m,-n], M4,Antisymmetric[{-i,-j,-m,-n}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RSymb,SO3,"Derivative"->1]]; 
xAct`HiGGS`Private`DeclareOrder[DR3[-z,-i,-j,-m,-n],1];
DefTensor[DR4[-z,-i,-j], M4,Symmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RSymb,SO4,"Derivative"->1]]; 
xAct`HiGGS`Private`DeclareOrder[DR4[-z,-i,-j],1];
DefTensor[DR5[-z,-i,-j], M4,Antisymmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RSymb,SO5,"Derivative"->1]]; 
xAct`HiGGS`Private`DeclareOrder[DR5[-z,-i,-j],1];
DefTensor[DR6[-z], M4, PrintAs ->xAct`HiGGS`Private`SymbolBuild[RSymb,SO6,"Derivative"->1]];
xAct`HiGGS`Private`DeclareOrder[DR6[-z],1];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
DefTensor[DT1[-z,-i,-j,-k], M4,Symmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[TSymb,SO1,"Derivative"->1]]; 
xAct`HiGGS`Private`DeclareOrder[DT1[-z,-i,-j,-k],1];
DefTensor[DT2[-z,-i], M4, PrintAs -> xAct`HiGGS`Private`SymbolBuild[TSymb,SO2,"Derivative"->1]]; 
xAct`HiGGS`Private`DeclareOrder[DT2[-z,-i],1];
DefTensor[DT3[-z,-i], M4, PrintAs ->xAct`HiGGS`Private`SymbolBuild[TSymb,SO3,"Derivative"->1]];
xAct`HiGGS`Private`DeclareOrder[DT3[-z,-i],1];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
DefTensor[DTLambda1[-z,-i,-j,-k], M4,Symmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[TLambdaSymb,SO1,"Derivative"->1]]; 
xAct`HiGGS`Private`DeclareOrder[DTLambda1[-z,-i,-j,-k],1];
DefTensor[DTLambda2[-z,-i], M4, PrintAs -> xAct`HiGGS`Private`SymbolBuild[TLambdaSymb,SO2,"Derivative"->1]]; 
xAct`HiGGS`Private`DeclareOrder[DTLambda2[-z,-i],1];
DefTensor[DTLambda3[-z,-i], M4, PrintAs ->xAct`HiGGS`Private`SymbolBuild[TLambdaSymb,SO3,"Derivative"->1]];
xAct`HiGGS`Private`DeclareOrder[DTLambda3[-z,-i],1];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
DRActivate=MakeRule[{CD[-z][R[-a,-b,-c,-d]],DR[-z,-a,-b,-c,-d]+A[i,-a,-z]R[-i,-b,-c,-d]+A[i,-b,-z]R[-a,-i,-c,-d]+A[i,-c,-z]R[-a,-b,-i,-d]+A[i,-d,-z]R[-a,-b,-c,-i]},MetricOn->All,ContractMetrics->True];
DRLambdaActivate=MakeRule[{CD[-z][RLambda[-a,-b,-c,-d]],DRLambda[-z,-a,-b,-c,-d]+A[i,-a,-z]RLambda[-i,-b,-c,-d]+A[i,-b,-z]RLambda[-a,-i,-c,-d]+A[i,-c,-z]RLambda[-a,-b,-i,-d]+A[i,-d,-z]RLambda[-a,-b,-c,-i]},MetricOn->All,ContractMetrics->True];
DTLambdaActivate=MakeRule[{CD[-z][TLambda[-a,-b,-c]],DTLambda[-z,-a,-b,-c]+A[i,-a,-z]TLambda[-i,-b,-c]+A[i,-b,-z]TLambda[-a,-i,-c]+A[i,-c,-z]TLambda[-a,-b,-i]},MetricOn->All,ContractMetrics->True];
DTActivate=MakeRule[{CD[-z][T[-a,-b,-c]],DT[-z,-a,-b,-c]+A[i,-a,-z]T[-i,-b,-c]+A[i,-b,-z]T[-a,-i,-c]+A[i,-c,-z]T[-a,-b,-i]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
DR1Activate=MakeRule[{CD[-z][R1[-a,-b,-c,-d]],DR1[-z,-a,-b,-c,-d]+A[i,-a,-z]R1[-i,-b,-c,-d]+A[i,-b,-z]R1[-a,-i,-c,-d]+A[i,-c,-z]R1[-a,-b,-i,-d]+A[i,-d,-z]R1[-a,-b,-c,-i]},MetricOn->All,ContractMetrics->True];
DR2Activate=MakeRule[{CD[-z][R2[-a,-b,-c,-d]],DR2[-z,-a,-b,-c,-d]+A[i,-a,-z]R2[-i,-b,-c,-d]+A[i,-b,-z]R2[-a,-i,-c,-d]+A[i,-c,-z]R2[-a,-b,-i,-d]+A[i,-d,-z]R2[-a,-b,-c,-i]},MetricOn->All,ContractMetrics->True];
DR3Activate=MakeRule[{CD[-z][R3[-a,-b,-c,-d]],DR3[-z,-a,-b,-c,-d]+A[i,-a,-z]R3[-i,-b,-c,-d]+A[i,-b,-z]R3[-a,-i,-c,-d]+A[i,-c,-z]R3[-a,-b,-i,-d]+A[i,-d,-z]R3[-a,-b,-c,-i]},MetricOn->All,ContractMetrics->True];
DR4Activate=MakeRule[{CD[-z][R4[-a,-b]],DR4[-z,-a,-b]+A[i,-a,-z]R4[-i,-b]+A[i,-b,-z]R4[-a,-i]},MetricOn->All,ContractMetrics->True];
DR5Activate=MakeRule[{CD[-z][R5[-a,-b]],DR5[-z,-a,-b]+A[i,-a,-z]R5[-i,-b]+A[i,-b,-z]R5[-a,-i]},MetricOn->All,ContractMetrics->True];
DR6Activate=MakeRule[{CD[-z][R6[]],DR6[-z]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
DRLambda1Activate=MakeRule[{CD[-z][RLambda1[-a,-b,-c,-d]],DRLambda1[-z,-a,-b,-c,-d]+A[i,-a,-z]RLambda1[-i,-b,-c,-d]+A[i,-b,-z]RLambda1[-a,-i,-c,-d]+A[i,-c,-z]RLambda1[-a,-b,-i,-d]+A[i,-d,-z]RLambda1[-a,-b,-c,-i]},MetricOn->All,ContractMetrics->True];
DRLambda2Activate=MakeRule[{CD[-z][RLambda2[-a,-b,-c,-d]],DRLambda2[-z,-a,-b,-c,-d]+A[i,-a,-z]RLambda2[-i,-b,-c,-d]+A[i,-b,-z]RLambda2[-a,-i,-c,-d]+A[i,-c,-z]RLambda2[-a,-b,-i,-d]+A[i,-d,-z]RLambda2[-a,-b,-c,-i]},MetricOn->All,ContractMetrics->True];
DRLambda3Activate=MakeRule[{CD[-z][RLambda3[-a,-b,-c,-d]],DRLambda3[-z,-a,-b,-c,-d]+A[i,-a,-z]RLambda3[-i,-b,-c,-d]+A[i,-b,-z]RLambda3[-a,-i,-c,-d]+A[i,-c,-z]RLambda3[-a,-b,-i,-d]+A[i,-d,-z]RLambda3[-a,-b,-c,-i]},MetricOn->All,ContractMetrics->True];
DRLambda4Activate=MakeRule[{CD[-z][RLambda4[-a,-b]],DRLambda4[-z,-a,-b]+A[i,-a,-z]RLambda4[-i,-b]+A[i,-b,-z]RLambda4[-a,-i]},MetricOn->All,ContractMetrics->True];
DRLambda5Activate=MakeRule[{CD[-z][RLambda5[-a,-b]],DRLambda5[-z,-a,-b]+A[i,-a,-z]RLambda5[-i,-b]+A[i,-b,-z]RLambda5[-a,-i]},MetricOn->All,ContractMetrics->True];
DRLambda6Activate=MakeRule[{CD[-z][RLambda6[]],DRLambda6[-z]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
DT1Activate=MakeRule[{CD[-z][T1[-a,-b,-c]],DT1[-z,-a,-b,-c]+A[i,-a,-z]T1[-i,-b,-c]+A[i,-b,-z]T1[-a,-i,-c]+A[i,-c,-z]T1[-a,-b,-i]},MetricOn->All,ContractMetrics->True];
DT2Activate=MakeRule[{CD[-z][T2[-a]],DT2[-z,-a]+A[i,-a,-z]T2[-i]},MetricOn->All,ContractMetrics->True];
DT3Activate=MakeRule[{CD[-z][T3[-a]],DT3[-z,-a]+A[i,-a,-z]T3[-i]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
DTLambda1Activate=MakeRule[{CD[-z][TLambda1[-a,-b,-c]],DTLambda1[-z,-a,-b,-c]+A[i,-a,-z]TLambda1[-i,-b,-c]+A[i,-b,-z]TLambda1[-a,-i,-c]+A[i,-c,-z]TLambda1[-a,-b,-i]},MetricOn->All,ContractMetrics->True];
DTLambda2Activate=MakeRule[{CD[-z][TLambda2[-a]],DTLambda2[-z,-a]+A[i,-a,-z]TLambda2[-i]},MetricOn->All,ContractMetrics->True];
DTLambda3Activate=MakeRule[{CD[-z][TLambda3[-a]],DTLambda3[-z,-a]+A[i,-a,-z]TLambda3[-i]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`ClearBuild[];


(* ::Input::Initialization:: *)
DActivate=Join[DRActivate,DRLambdaActivate,DTActivate,DTLambdaActivate,DR1Activate,DR2Activate,DR3Activate,DR4Activate,DR5Activate,DR6Activate,DRLambda1Activate,DRLambda2Activate,DRLambda3Activate,DRLambda4Activate,DRLambda5Activate,DRLambda6Activate,DT1Activate,DT2Activate,DT3Activate,DTLambda1Activate,DTLambda2Activate,DTLambda3Activate];
xAct`HiGGS`Private`ClearBuild[];


DDeactivate={};
MakeDDeactivate/@{R[a,b,c,d],RLambda[a,b,c,d],T[a,b,c],TLambda[a,b,c],R1[a,b,c,d],R2[a,b,c,d],R3[a,b,c,d],R4[a,b],R5[a,b],R6[],RLambda1[a,b,c,d],RLambda2[a,b,c,d],RLambda3[a,b,c,d],RLambda4[a,b],RLambda5[a,b],RLambda6[],T[a,b,c],T1[a,b,c],T2[a],T3[a],TLambda[a,b,c],TLambda1[a,b,c],TLambda2[a],TLambda3[a]};
xAct`HiGGS`Private`ClearBuild[];
