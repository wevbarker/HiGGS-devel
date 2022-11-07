(*===================*)
(*  NonCanonicalPhi  *)
(*===================*)

PhiNonCanonicalB0pDefinition=PB0p[e,f]PBPara[-e,-f,a,c]BPhi[-a,-c]/.BPhiNonCanonicalActivate//ActivateGeneralO3Projections;
PhiNonCanonicalB1pDefinition=PB1p[-n,-m,e,f]PBPara[-e,-f,a,c]BPhi[-a,-c]/.BPhiNonCanonicalActivate//ActivateGeneralO3Projections;
PhiNonCanonicalB2pDefinition=PB2p[-n,-m,e,f]PBPara[-e,-f,a,c]BPhi[-a,-c]/.BPhiNonCanonicalActivate//ActivateGeneralO3Projections;
PhiNonCanonicalB1mDefinition=PB1m[-n,f]PBPerp[-f,a,c]BPhi[-a,-c]/.BPhiNonCanonicalActivate//ActivateGeneralO3Projections;

PhiNonCanonicalA0pDefinition=PA0p[e,f]PAPerp[-e,-f,a,b,c]APhi[-a,-b,-c]/.APhiNonCanonicalActivate//ActivateGeneralO3Projections;
PhiNonCanonicalA1pDefinition=PA1p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]APhi[-a,-b,-c]/.APhiNonCanonicalActivate//ActivateGeneralO3Projections;
PhiNonCanonicalA2pDefinition=PA2p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]APhi[-a,-b,-c]/.APhiNonCanonicalActivate//ActivateGeneralO3Projections;
PhiNonCanonicalA0mDefinition=PA0m[d,e,f]PAPara[-d,-e,-f,a,b,c]APhi[-a,-b,-c]/.APhiNonCanonicalActivate//ActivateGeneralO3Projections;
PhiNonCanonicalA1mDefinition=PA1m[-n,d,e,f]PAPara[-d,-e,-f,a,b,c]APhi[-a,-b,-c]/.APhiNonCanonicalActivate//ActivateGeneralO3Projections;
PhiNonCanonicalA2mDefinition=PA2m[-n,-m,-o,d,e,f]PAPara[-d,-e,-f,a,b,c]APhi[-a,-b,-c]/.APhiNonCanonicalActivate//ActivateGeneralO3Projections;

PhiNonCanonicalB0pActivate=MakeRule[{PhiB0p[],Scalar[Evaluate[PhiNonCanonicalB0pDefinition]]},MetricOn->All,ContractMetrics->True];
PhiNonCanonicalB1pActivate=MakeRule[{PhiB1p[-n,-m],Evaluate[PhiNonCanonicalB1pDefinition]},MetricOn->All,ContractMetrics->True];
PhiNonCanonicalB1mActivate=MakeRule[{PhiB1m[-n],Evaluate[PhiNonCanonicalB1mDefinition]},MetricOn->All,ContractMetrics->True];
PhiNonCanonicalB2pActivate=MakeRule[{PhiB2p[-n,-m],Evaluate[PhiNonCanonicalB2pDefinition]},MetricOn->All,ContractMetrics->True];
PhiNonCanonicalA0pActivate=MakeRule[{PhiA0p[],Scalar[Evaluate[PhiNonCanonicalA0pDefinition]]},MetricOn->All,ContractMetrics->True];
PhiNonCanonicalA0mActivate=MakeRule[{PhiA0m[],Scalar[Evaluate[PhiNonCanonicalA0mDefinition]]},MetricOn->All,ContractMetrics->True];
PhiNonCanonicalA1pActivate=MakeRule[{PhiA1p[-n,-m],Evaluate[PhiNonCanonicalA1pDefinition]},MetricOn->All,ContractMetrics->True];
PhiNonCanonicalA1mActivate=MakeRule[{PhiA1m[-n],Evaluate[PhiNonCanonicalA1mDefinition]},MetricOn->All,ContractMetrics->True];
PhiNonCanonicalA2pActivate=MakeRule[{PhiA2p[-n,-m],Evaluate[PhiNonCanonicalA2pDefinition]},MetricOn->All,ContractMetrics->True];
PhiNonCanonicalA2mActivate=MakeRule[{PhiA2m[-n,-m,-o],Evaluate[PhiNonCanonicalA2mDefinition]},MetricOn->All,ContractMetrics->True];

PhiNonCanonicalActivate=Join[PhiNonCanonicalB0pActivate,PhiNonCanonicalB1pActivate,PhiNonCanonicalB1mActivate,PhiNonCanonicalB2pActivate,PhiNonCanonicalA0pActivate,PhiNonCanonicalA0mActivate,PhiNonCanonicalA1pActivate,PhiNonCanonicalA1mActivate,PhiNonCanonicalA2pActivate,PhiNonCanonicalA2mActivate];

DumpSave[xAct`HiGGS`Private`BinaryLocation["NonCanonicalPhi"],{PhiNonCanonicalActivate}];
