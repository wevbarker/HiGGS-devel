(*===========================*)
(*  NesterFormIfConstraints  *)
(*===========================*)

Begin["xAct`HiGGS`Private`"];

NesterFormPhiB0pDefinition=ToNesterForm[PhiB0p[],ToShell->False];
ToNesterFormPhiB0p=MakeRule[{PhiB0p[],Evaluate[NesterFormPhiB0pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormPhiB1pDefinition=ToNesterForm[PhiB1p[-i,-j],ToShell->False];
ToNesterFormPhiB1p=MakeRule[{PhiB1p[-i,-j],Evaluate[NesterFormPhiB1pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormPhiB1mDefinition=ToNesterForm[PhiB1m[-i],ToShell->False];
ToNesterFormPhiB1m=MakeRule[{PhiB1m[-i],Evaluate[NesterFormPhiB1mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormPhiB2pDefinition=ToNesterForm[PhiB2p[-i,-j],ToShell->False];
ToNesterFormPhiB2p=MakeRule[{PhiB2p[-i,-j],Evaluate[NesterFormPhiB2pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormPhiA0pDefinition=ToNesterForm[PhiA0p[],ToShell->False];
ToNesterFormPhiA0p=MakeRule[{PhiA0p[],Evaluate[NesterFormPhiA0pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormPhiA0mDefinition=ToNesterForm[PhiA0m[],ToShell->False];
ToNesterFormPhiA0m=MakeRule[{PhiA0m[],Evaluate[NesterFormPhiA0mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormPhiA1pDefinition=ToNesterForm[PhiA1p[-i,-j],ToShell->False];
ToNesterFormPhiA1p=MakeRule[{PhiA1p[-i,-j],Evaluate[NesterFormPhiA1pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormPhiA1mDefinition=ToNesterForm[PhiA1m[-i],ToShell->False];
ToNesterFormPhiA1m=MakeRule[{PhiA1m[-i],Evaluate[NesterFormPhiA1mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormPhiA2pDefinition=ToNesterForm[PhiA2p[-i,-j],ToShell->False];
ToNesterFormPhiA2p=MakeRule[{PhiA2p[-i,-j],Evaluate[NesterFormPhiA2pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormPhiA2mDefinition=ToNesterForm[PhiA2m[-i,-j,-k],ToShell->False];
ToNesterFormPhiA2m=MakeRule[{PhiA2m[-i,-j,-k],Evaluate[NesterFormPhiA2mDefinition]},MetricOn->All,ContractMetrics->True];

PhiToNesterFormPhi=Join[ToNesterFormPhiB0p,ToNesterFormPhiB1p,ToNesterFormPhiB1m,ToNesterFormPhiB2p,ToNesterFormPhiA0p,ToNesterFormPhiA0m,ToNesterFormPhiA1p,ToNesterFormPhiA1m,ToNesterFormPhiA2p,ToNesterFormPhiA2m];

NesterFormChiPerpB0pDefinition=ToNesterForm[ChiPerpB0p[],ToShell->False];
ToNesterFormChiPerpB0p=MakeRule[{ChiPerpB0p[],Evaluate[NesterFormChiPerpB0pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiPerpB1pDefinition=ToNesterForm[ChiPerpB1p[-i,-j],ToShell->False];
ToNesterFormChiPerpB1p=MakeRule[{ChiPerpB1p[-i,-j],Evaluate[NesterFormChiPerpB1pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiPerpB1mDefinition=ToNesterForm[ChiPerpB1m[-i],ToShell->False];
ToNesterFormChiPerpB1m=MakeRule[{ChiPerpB1m[-i],Evaluate[NesterFormChiPerpB1mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiPerpB2pDefinition=ToNesterForm[ChiPerpB2p[-i,-j],ToShell->False];
ToNesterFormChiPerpB2p=MakeRule[{ChiPerpB2p[-i,-j],Evaluate[NesterFormChiPerpB2pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiPerpA0pDefinition=ToNesterForm[ChiPerpA0p[],ToShell->False];
ToNesterFormChiPerpA0p=MakeRule[{ChiPerpA0p[],Evaluate[NesterFormChiPerpA0pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiPerpA0mDefinition=ToNesterForm[ChiPerpA0m[],ToShell->False];
ToNesterFormChiPerpA0m=MakeRule[{ChiPerpA0m[],Evaluate[NesterFormChiPerpA0mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiPerpA1pDefinition=ToNesterForm[ChiPerpA1p[-i,-j],ToShell->False];
ToNesterFormChiPerpA1p=MakeRule[{ChiPerpA1p[-i,-j],Evaluate[NesterFormChiPerpA1pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiPerpA1mDefinition=ToNesterForm[ChiPerpA1m[-i],ToShell->False];
ToNesterFormChiPerpA1m=MakeRule[{ChiPerpA1m[-i],Evaluate[NesterFormChiPerpA1mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiPerpA2pDefinition=ToNesterForm[ChiPerpA2p[-i,-j],ToShell->False];
ToNesterFormChiPerpA2p=MakeRule[{ChiPerpA2p[-i,-j],Evaluate[NesterFormChiPerpA2pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiPerpA2mDefinition=ToNesterForm[ChiPerpA2m[-i,-j,-k],ToShell->False];
ToNesterFormChiPerpA2m=MakeRule[{ChiPerpA2m[-i,-j,-k],Evaluate[NesterFormChiPerpA2mDefinition]},MetricOn->All,ContractMetrics->True];

ChiPerpToNesterFormChiPerp=Join[ToNesterFormChiPerpB0p,ToNesterFormChiPerpB1p,ToNesterFormChiPerpB1m,ToNesterFormChiPerpB2p,ToNesterFormChiPerpA0p,ToNesterFormChiPerpA0m,ToNesterFormChiPerpA1p,ToNesterFormChiPerpA1m,ToNesterFormChiPerpA2p,ToNesterFormChiPerpA2m];

NesterFormChiParaB0mDefinition=ToNesterForm[ChiParaB0m[],ToShell->False];
ToNesterFormChiParaB0m=MakeRule[{ChiParaB0m[],Evaluate[NesterFormChiParaB0mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiParaB1pDefinition=ToNesterForm[ChiParaB1p[-i,-j],ToShell->False];
ToNesterFormChiParaB1p=MakeRule[{ChiParaB1p[-i,-j],Evaluate[NesterFormChiParaB1pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiParaB1mDefinition=ToNesterForm[ChiParaB1m[-i],ToShell->False];
ToNesterFormChiParaB1m=MakeRule[{ChiParaB1m[-i],Evaluate[NesterFormChiParaB1mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiParaB2mDefinition=ToNesterForm[ChiParaB2m[-i,-j,-k],ToShell->False];
ToNesterFormChiParaB2m=MakeRule[{ChiParaB2m[-i,-j,-k],Evaluate[NesterFormChiParaB2mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiParaA0pDefinition=ToNesterForm[ChiParaA0p[],ToShell->False];
ToNesterFormChiParaA0p=MakeRule[{ChiParaA0p[],Evaluate[NesterFormChiParaA0pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiParaA0mDefinition=ToNesterForm[ChiParaA0m[],ToShell->False];
ToNesterFormChiParaA0m=MakeRule[{ChiParaA0m[],Evaluate[NesterFormChiParaA0mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiParaA1pDefinition=ToNesterForm[ChiParaA1p[-i,-j],ToShell->False];
ToNesterFormChiParaA1p=MakeRule[{ChiParaA1p[-i,-j],Evaluate[NesterFormChiParaA1pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiParaA1mDefinition=ToNesterForm[ChiParaA1m[-i],ToShell->False];
ToNesterFormChiParaA1m=MakeRule[{ChiParaA1m[-i],Evaluate[NesterFormChiParaA1mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiParaA2pDefinition=ToNesterForm[ChiParaA2p[-i,-j],ToShell->False];
ToNesterFormChiParaA2p=MakeRule[{ChiParaA2p[-i,-j],Evaluate[NesterFormChiParaA2pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiParaA2mDefinition=ToNesterForm[ChiParaA2m[-i,-j,-k],ToShell->False];
ToNesterFormChiParaA2m=MakeRule[{ChiParaA2m[-i,-j,-k],Evaluate[NesterFormChiParaA2mDefinition]},MetricOn->All,ContractMetrics->True];

ChiParaToNesterFormChiPara=Join[ToNesterFormChiParaB0m,ToNesterFormChiParaB1p,ToNesterFormChiParaB1m,ToNesterFormChiParaB2m,ToNesterFormChiParaA0p,ToNesterFormChiParaA0m,ToNesterFormChiParaA1p,ToNesterFormChiParaA1m,ToNesterFormChiParaA2p,ToNesterFormChiParaA2m];

NesterFormChiSingB1pDefinition=ToNesterForm[ChiSingB1p[-i,-j],ToShell->False];
ToNesterFormChiSingB1p=MakeRule[{ChiSingB1p[-i,-j],Evaluate[NesterFormChiSingB1pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiSingB1mDefinition=ToNesterForm[ChiSingB1m[-i],ToShell->False];
ToNesterFormChiSingB1m=MakeRule[{ChiSingB1m[-i],Evaluate[NesterFormChiSingB1mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiSingA0pDefinition=ToNesterForm[ChiSingA0p[],ToShell->False];
ToNesterFormChiSingA0p=MakeRule[{ChiSingA0p[],Evaluate[NesterFormChiSingA0pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiSingA0mDefinition=ToNesterForm[ChiSingA0m[],ToShell->False];
ToNesterFormChiSingA0m=MakeRule[{ChiSingA0m[],Evaluate[NesterFormChiSingA0mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiSingA1pDefinition=ToNesterForm[ChiSingA1p[-i,-j],ToShell->False];
ToNesterFormChiSingA1p=MakeRule[{ChiSingA1p[-i,-j],Evaluate[NesterFormChiSingA1pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiSingA1mDefinition=ToNesterForm[ChiSingA1m[-i],ToShell->False];
ToNesterFormChiSingA1m=MakeRule[{ChiSingA1m[-i],Evaluate[NesterFormChiSingA1mDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiSingA2pDefinition=ToNesterForm[ChiSingA2p[-i,-j],ToShell->False];
ToNesterFormChiSingA2p=MakeRule[{ChiSingA2p[-i,-j],Evaluate[NesterFormChiSingA2pDefinition]},MetricOn->All,ContractMetrics->True];
NesterFormChiSingA2mDefinition=ToNesterForm[ChiSingA2m[-i,-j,-k],ToShell->False];
ToNesterFormChiSingA2m=MakeRule[{ChiSingA2m[-i,-j,-k],Evaluate[NesterFormChiSingA2mDefinition]},MetricOn->All,ContractMetrics->True];

ChiSingToNesterFormChiSing=Join[ToNesterFormChiSingB1p,ToNesterFormChiSingB1m,ToNesterFormChiSingA0p,ToNesterFormChiSingA0m,ToNesterFormChiSingA1p,ToNesterFormChiSingA1m,ToNesterFormChiSingA2p,ToNesterFormChiSingA2m];

DumpSave[xAct`HiGGS`Private`BinaryLocation["NesterFormIfConstraints"],{PhiToNesterFormPhi,ChiPerpToNesterFormChiPerp,ChiParaToNesterFormChiPara,ChiSingToNesterFormChiSing}];

End[];
