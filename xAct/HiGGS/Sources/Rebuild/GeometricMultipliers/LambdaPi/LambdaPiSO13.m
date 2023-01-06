(*==============*)
(*  LambdaPiSO13  *)
(*==============*)

DefTensor[RLambdaPi1[-i,-j,-m,-n], M4,StrongGenSet[{-i,-j,-m,-n},GenSet[Cycles[{-i,-j},{-m,-n}],Cycles[{-i,-m}],Cycles[{-j,-n}]]], PrintAs ->xAct`HiGGS`Private`SymbolBuild[RLambdaPiSymb,xAct`HiGGS`Private`SO1]]; 
DefTensor[RLambdaPi2[-i,-j,-m,-n], M4,StrongGenSet[{-i,-j,-m,-n},GenSet[-Cycles[{-i,-m},{-j,-n}],-Cycles[{-i,-j}],-Cycles[{-m,-n}]]], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RLambdaPiSymb,xAct`HiGGS`Private`SO2]]; 
DefTensor[RLambdaPi3[-i,-j,-m,-n], M4,Antisymmetric[{-i,-j,-m,-n}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RLambdaPiSymb,xAct`HiGGS`Private`SO3]]; 
DefTensor[RLambdaPi4[-i,-j], M4,Symmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RLambdaPiSymb,xAct`HiGGS`Private`SO4]]; 
DefTensor[RLambdaPi5[-i,-j], M4,Antisymmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RLambdaPiSymb,xAct`HiGGS`Private`SO5]]; 
DefTensor[RLambdaPi6[], M4, PrintAs -> xAct`HiGGS`Private`SymbolBuild[RLambdaPiSymb,xAct`HiGGS`Private`SO6]]; 
DefTensor[TLambdaPi1[-i,-j,-k], M4,Symmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[TLambdaPiSymb,xAct`HiGGS`Private`SO1]]; 
DefTensor[TLambdaPi2[-i], M4, PrintAs -> xAct`HiGGS`Private`SymbolBuild[TLambdaPiSymb,xAct`HiGGS`Private`SO2]]; 
DefTensor[TLambdaPi3[-i], M4, PrintAs -> xAct`HiGGS`Private`SymbolBuild[TLambdaPiSymb,xAct`HiGGS`Private`SO3]]; 
AutomaticRules[RLambdaPi1,MakeRule[{RLambdaPi1[a,a1,b,-b],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[RLambdaPi1,MakeRule[{RLambdaPi1[a,b,a1,-b],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[RLambdaPi2,MakeRule[{RLambdaPi2[a,b,a1,-b],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[RLambdaPi4,MakeRule[{RLambdaPi4[a,-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[TLambdaPi1,MakeRule[{TLambdaPi1[a,a1,-a1],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[TLambdaPi1,MakeRule[{TLambdaPi1[a,-a,-a1],0},MetricOn->All,ContractMetrics->True]];

RLambdaPiDefinition=RLambdaPi3[-i,-j,-m,-n]+
(2/3)(2RLambdaPi1[-i,-j,-m,-n]+
RLambdaPi1[-i,-m,-j,-n])+
RLambdaPi2[-i,-j,-m,-n]+
(1/2)(G[-i,-m](RLambdaPi5[-j,-n]+RLambdaPi4[-j,-n])+
G[-j,-n](RLambdaPi5[-i,-m]+RLambdaPi4[-i,-m])-
G[-j,-m](RLambdaPi5[-i,-n]+RLambdaPi4[-i,-n])-
G[-i,-n](RLambdaPi5[-j,-m]+RLambdaPi4[-j,-m]))-
(1/12)(G[-i,-m]G[-j,-n]-G[-i,-n]G[-j,-m])RLambdaPi6[];

TLambdaPiDefinition=(2/3)(TLambdaPi1[-i,-j,-k]-TLambdaPi1[-i,-k,-j])+
(1/3)(G[-i,-j]TLambdaPi2[-k]-G[-i,-k]TLambdaPi2[-j])+
epsilonG[-i,-j,-k,-m]TLambdaPi3[m];

RLambdaPiSO13Activate=MakeRule[{RLambdaPi[-i,-j,-m,-n],Evaluate[RLambdaPiDefinition]},MetricOn->All,ContractMetrics->True];
TLambdaPiSO13Activate=MakeRule[{TLambdaPi[-i,-j,-k],Evaluate[TLambdaPiDefinition]},MetricOn->All,ContractMetrics->True];

StrengthLambdaPiSO13Activate=Join[RLambdaPiSO13Activate,TLambdaPiSO13Activate];
StrengthLambdaPiSO13Activate=Join[RLambdaPiSO13Activate,TLambdaPiSO13Activate];
