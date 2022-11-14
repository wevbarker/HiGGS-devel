(*================*)
(*  CanonicalPhi  *)
(*================*)

PhiB0pDefinition=PB0p[e,f]PBPara[-e,-f,a,c]BPhi[-a,-c]/.BPhiActivate//ActivateGeneralO3Projections;
PhiB1pDefinition=PB1p[-n,-m,e,f]PBPara[-e,-f,a,c]BPhi[-a,-c]/.BPhiActivate//ActivateGeneralO3Projections;
PhiB2pDefinition=PB2p[-n,-m,e,f]PBPara[-e,-f,a,c]BPhi[-a,-c]/.BPhiActivate//ActivateGeneralO3Projections;
PhiB1mDefinition=PB1m[-n,f]PBPerp[-f,a,c]BPhi[-a,-c]/.BPhiActivate//ActivateGeneralO3Projections;

PhiA0pDefinition=PA0p[e,f]PAPerp[-e,-f,a,b,c]APhi[-a,-b,-c]/.APhiActivate//ActivateGeneralO3Projections;
PhiA1pDefinition=PA1p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]APhi[-a,-b,-c]/.APhiActivate//ActivateGeneralO3Projections;
PhiA2pDefinition=PA2p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]APhi[-a,-b,-c]/.APhiActivate//ActivateGeneralO3Projections;
PhiA0mDefinition=PA0m[d,e,f]PAPara[-d,-e,-f,a,b,c]APhi[-a,-b,-c]/.APhiActivate//ActivateGeneralO3Projections;
PhiA1mDefinition=PA1m[-n,d,e,f]PAPara[-d,-e,-f,a,b,c]APhi[-a,-b,-c]/.APhiActivate//ActivateGeneralO3Projections;
PhiA2mDefinition=PA2m[-n,-m,-o,d,e,f]PAPara[-d,-e,-f,a,b,c]APhi[-a,-b,-c]/.APhiActivate//ActivateGeneralO3Projections;

PhiB0pActivate=MakeRule[{PhiB0p[],Scalar[Evaluate[PhiB0pDefinition]]},MetricOn->All,ContractMetrics->True];
PhiB1pActivate=MakeRule[{PhiB1p[-n,-m],Evaluate[PhiB1pDefinition]},MetricOn->All,ContractMetrics->True];
PhiB1mActivate=MakeRule[{PhiB1m[-n],Evaluate[PhiB1mDefinition]},MetricOn->All,ContractMetrics->True];
PhiB2pActivate=MakeRule[{PhiB2p[-n,-m],Evaluate[PhiB2pDefinition]},MetricOn->All,ContractMetrics->True];
PhiA0pActivate=MakeRule[{PhiA0p[],Scalar[Evaluate[PhiA0pDefinition]]},MetricOn->All,ContractMetrics->True];
PhiA0mActivate=MakeRule[{PhiA0m[],Scalar[Evaluate[PhiA0mDefinition]]},MetricOn->All,ContractMetrics->True];
PhiA1pActivate=MakeRule[{PhiA1p[-n,-m],Evaluate[PhiA1pDefinition]},MetricOn->All,ContractMetrics->True];
PhiA1mActivate=MakeRule[{PhiA1m[-n],Evaluate[PhiA1mDefinition]},MetricOn->All,ContractMetrics->True];
PhiA2pActivate=MakeRule[{PhiA2p[-n,-m],Evaluate[PhiA2pDefinition]},MetricOn->All,ContractMetrics->True];
PhiA2mActivate=MakeRule[{PhiA2m[-n,-m,-o],Evaluate[PhiA2mDefinition]},MetricOn->All,ContractMetrics->True];

PhiActivate=Join[PhiB0pActivate,PhiB1pActivate,PhiB1mActivate,PhiB2pActivate,PhiA0pActivate,PhiA0mActivate,PhiA1pActivate,PhiA1mActivate,PhiA2pActivate,PhiA2mActivate];

DumpSave[xAct`HiGGS`Private`BinaryLocation["CanonicalPhi"],{PhiActivate}];
