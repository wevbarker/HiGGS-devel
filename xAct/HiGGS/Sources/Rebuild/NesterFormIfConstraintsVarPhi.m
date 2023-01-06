(*=================================*)
(*  NesterFormIfConstraintsVarPhi  *)
(*=================================*)

Begin["xAct`HiGGS`Private`"];

NesterFormVarPhiPerpB0pDefinition=ToNesterForm[VarPhiPerpB0p[],ToShell->False];
ToNesterFormVarPhiPerpB0p=MakeRule[{VarPhiPerpB0p[],Evaluate[NesterFormVarPhiPerpB0pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormVarPhiPerpB1pDefinition=ToNesterForm[VarPhiPerpB1p[-i,-j],ToShell->False];
ToNesterFormVarPhiPerpB1p=MakeRule[{VarPhiPerpB1p[-i,-j],Evaluate[NesterFormVarPhiPerpB1pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormVarPhiPerpB1mDefinition=ToNesterForm[VarPhiPerpB1m[-i],ToShell->False];
ToNesterFormVarPhiPerpB1m=MakeRule[{VarPhiPerpB1m[-i],Evaluate[NesterFormVarPhiPerpB1mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormVarPhiPerpB2pDefinition=ToNesterForm[VarPhiPerpB2p[-i,-j],ToShell->False];
ToNesterFormVarPhiPerpB2p=MakeRule[{VarPhiPerpB2p[-i,-j],Evaluate[NesterFormVarPhiPerpB2pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormVarPhiPerpA0pDefinition=ToNesterForm[VarPhiPerpA0p[],ToShell->False];
ToNesterFormVarPhiPerpA0p=MakeRule[{VarPhiPerpA0p[],Evaluate[NesterFormVarPhiPerpA0pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormVarPhiPerpA0mDefinition=ToNesterForm[VarPhiPerpA0m[],ToShell->False];
ToNesterFormVarPhiPerpA0m=MakeRule[{VarPhiPerpA0m[],Evaluate[NesterFormVarPhiPerpA0mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormVarPhiPerpA1pDefinition=ToNesterForm[VarPhiPerpA1p[-i,-j],ToShell->False];
ToNesterFormVarPhiPerpA1p=MakeRule[{VarPhiPerpA1p[-i,-j],Evaluate[NesterFormVarPhiPerpA1pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormVarPhiPerpA1mDefinition=ToNesterForm[VarPhiPerpA1m[-i],ToShell->False];
ToNesterFormVarPhiPerpA1m=MakeRule[{VarPhiPerpA1m[-i],Evaluate[NesterFormVarPhiPerpA1mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormVarPhiPerpA2pDefinition=ToNesterForm[VarPhiPerpA2p[-i,-j],ToShell->False];
ToNesterFormVarPhiPerpA2p=MakeRule[{VarPhiPerpA2p[-i,-j],Evaluate[NesterFormVarPhiPerpA2pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormVarPhiPerpA2mDefinition=ToNesterForm[VarPhiPerpA2m[-i,-j,-k],ToShell->False];
ToNesterFormVarPhiPerpA2m=MakeRule[{VarPhiPerpA2m[-i,-j,-k],Evaluate[NesterFormVarPhiPerpA2mDefinition]},MetricOn->All,ContractMetrics->True];

VarPhiPerpToNesterFormVarPhiPerp=Join[ToNesterFormVarPhiPerpB0p,ToNesterFormVarPhiPerpB1p,ToNesterFormVarPhiPerpB1m,ToNesterFormVarPhiPerpB2p,ToNesterFormVarPhiPerpA0p,ToNesterFormVarPhiPerpA0m,ToNesterFormVarPhiPerpA1p,ToNesterFormVarPhiPerpA1m,ToNesterFormVarPhiPerpA2p,ToNesterFormVarPhiPerpA2m];

NesterFormVarPhiParaB0mDefinition=ToNesterForm[VarPhiParaB0m[],ToShell->False];
ToNesterFormVarPhiParaB0m=MakeRule[{VarPhiParaB0m[],Evaluate[NesterFormVarPhiParaB0mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormVarPhiParaB1pDefinition=ToNesterForm[VarPhiParaB1p[-i,-j],ToShell->False];
ToNesterFormVarPhiParaB1p=MakeRule[{VarPhiParaB1p[-i,-j],Evaluate[NesterFormVarPhiParaB1pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormVarPhiParaB1mDefinition=ToNesterForm[VarPhiParaB1m[-i],ToShell->False];
ToNesterFormVarPhiParaB1m=MakeRule[{VarPhiParaB1m[-i],Evaluate[NesterFormVarPhiParaB1mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormVarPhiParaB2mDefinition=ToNesterForm[VarPhiParaB2m[-i,-j,-k],ToShell->False];
ToNesterFormVarPhiParaB2m=MakeRule[{VarPhiParaB2m[-i,-j,-k],Evaluate[NesterFormVarPhiParaB2mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormVarPhiParaA0pDefinition=ToNesterForm[VarPhiParaA0p[],ToShell->False];
ToNesterFormVarPhiParaA0p=MakeRule[{VarPhiParaA0p[],Evaluate[NesterFormVarPhiParaA0pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormVarPhiParaA0mDefinition=ToNesterForm[VarPhiParaA0m[],ToShell->False];
ToNesterFormVarPhiParaA0m=MakeRule[{VarPhiParaA0m[],Evaluate[NesterFormVarPhiParaA0mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormVarPhiParaA1pDefinition=ToNesterForm[VarPhiParaA1p[-i,-j],ToShell->False];
ToNesterFormVarPhiParaA1p=MakeRule[{VarPhiParaA1p[-i,-j],Evaluate[NesterFormVarPhiParaA1pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormVarPhiParaA1mDefinition=ToNesterForm[VarPhiParaA1m[-i],ToShell->False];
ToNesterFormVarPhiParaA1m=MakeRule[{VarPhiParaA1m[-i],Evaluate[NesterFormVarPhiParaA1mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormVarPhiParaA2pDefinition=ToNesterForm[VarPhiParaA2p[-i,-j],ToShell->False];
ToNesterFormVarPhiParaA2p=MakeRule[{VarPhiParaA2p[-i,-j],Evaluate[NesterFormVarPhiParaA2pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormVarPhiParaA2mDefinition=ToNesterForm[VarPhiParaA2m[-i,-j,-k],ToShell->False];
ToNesterFormVarPhiParaA2m=MakeRule[{VarPhiParaA2m[-i,-j,-k],Evaluate[NesterFormVarPhiParaA2mDefinition]},MetricOn->All,ContractMetrics->True];

VarPhiParaToNesterFormVarPhiPara=Join[ToNesterFormVarPhiParaB0m,ToNesterFormVarPhiParaB1p,ToNesterFormVarPhiParaB1m,ToNesterFormVarPhiParaB2m,ToNesterFormVarPhiParaA0p,ToNesterFormVarPhiParaA0m,ToNesterFormVarPhiParaA1p,ToNesterFormVarPhiParaA1m,ToNesterFormVarPhiParaA2p,ToNesterFormVarPhiParaA2m];

DumpSave[xAct`HiGGS`Private`BinaryLocation["NesterFormIfConstraintsVarPhi"],{PhiToNesterFormPhi,ChiPerpToNesterFormChiPerp,ChiParaToNesterFormChiPara,ChiSingToNesterFormChiSing,VarPhiPerpToNesterFormVarPhiPerp,VarPhiParaToNesterFormVarPhiPara}];

End[];
