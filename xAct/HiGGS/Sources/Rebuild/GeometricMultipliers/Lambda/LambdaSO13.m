(*==============*)
(*  LambdaSO13  *)
(*==============*)

DefTensor[RLambda1[-i,-j,-m,-n], M4,StrongGenSet[{-i,-j,-m,-n},GenSet[Cycles[{-i,-j},{-m,-n}],Cycles[{-i,-m}],Cycles[{-j,-n}]]], PrintAs ->xAct`HiGGS`Private`SymbolBuild[RLambdaSymb,xAct`HiGGS`Private`SO1]]; 
DefTensor[RLambda2[-i,-j,-m,-n], M4,StrongGenSet[{-i,-j,-m,-n},GenSet[-Cycles[{-i,-m},{-j,-n}],-Cycles[{-i,-j}],-Cycles[{-m,-n}]]], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RLambdaSymb,xAct`HiGGS`Private`SO2]]; 
DefTensor[RLambda3[-i,-j,-m,-n], M4,Antisymmetric[{-i,-j,-m,-n}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RLambdaSymb,xAct`HiGGS`Private`SO3]]; 
DefTensor[RLambda4[-i,-j], M4,Symmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RLambdaSymb,xAct`HiGGS`Private`SO4]]; 
DefTensor[RLambda5[-i,-j], M4,Antisymmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[RLambdaSymb,xAct`HiGGS`Private`SO5]]; 
DefTensor[RLambda6[], M4, PrintAs -> xAct`HiGGS`Private`SymbolBuild[RLambdaSymb,xAct`HiGGS`Private`SO6]]; 
DefTensor[TLambda1[-i,-j,-k], M4,Symmetric[{-i,-j}], PrintAs -> xAct`HiGGS`Private`SymbolBuild[TLambdaSymb,xAct`HiGGS`Private`SO1]]; 
DefTensor[TLambda2[-i], M4, PrintAs -> xAct`HiGGS`Private`SymbolBuild[TLambdaSymb,xAct`HiGGS`Private`SO2]]; 
DefTensor[TLambda3[-i], M4, PrintAs -> xAct`HiGGS`Private`SymbolBuild[TLambdaSymb,xAct`HiGGS`Private`SO3]]; 
AutomaticRules[RLambda1,MakeRule[{RLambda1[a,a1,b,-b],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[RLambda1,MakeRule[{RLambda1[a,b,a1,-b],0},MetricOn->All,ContractMetrics->True]];
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
StrengthLambdaSO13Activate=Join[RLambdaSO13Activate,TLambdaSO13Activate];
