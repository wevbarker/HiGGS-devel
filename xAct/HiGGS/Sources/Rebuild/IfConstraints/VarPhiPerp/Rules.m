(*=========*)
(*  Rules  *)
(*=========*)

VarPhiPerpB0pDefinition=PB0p[e,f]PBPara[-e,-f,a,c]BVarPhiPerp[-a,-c]/.BVarPhiPerpActivate//ActivateGeneralO3Projections;
VarPhiPerpB1pDefinition=PB1p[-n,-m,e,f]PBPara[-e,-f,a,c]BVarPhiPerp[-a,-c]/.BVarPhiPerpActivate//ActivateGeneralO3Projections;
VarPhiPerpB2pDefinition=PB2p[-n,-m,e,f]PBPara[-e,-f,a,c]BVarPhiPerp[-a,-c]/.BVarPhiPerpActivate//ActivateGeneralO3Projections;
VarPhiPerpB1mDefinition=PB1m[-n,f]PBPerp[-f,a,c]BVarPhiPerp[-a,-c]/.BVarPhiPerpActivate//ActivateGeneralO3Projections;

VarPhiPerpA0pDefinition=PA0p[e,f]PAPerp[-e,-f,a,b,c]AVarPhiPerp[-a,-b,-c]/.AVarPhiPerpActivate//ActivateGeneralO3Projections;
VarPhiPerpA1pDefinition=PA1p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]AVarPhiPerp[-a,-b,-c]/.AVarPhiPerpActivate//ActivateGeneralO3Projections;
VarPhiPerpA2pDefinition=PA2p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]AVarPhiPerp[-a,-b,-c]/.AVarPhiPerpActivate//ActivateGeneralO3Projections;
VarPhiPerpA0mDefinition=PA0m[d,e,f]PAPara[-d,-e,-f,a,b,c]AVarPhiPerp[-a,-b,-c]/.AVarPhiPerpActivate//ActivateGeneralO3Projections;
VarPhiPerpA1mDefinition=PA1m[-n,d,e,f]PAPara[-d,-e,-f,a,b,c]AVarPhiPerp[-a,-b,-c]/.AVarPhiPerpActivate//ActivateGeneralO3Projections;
VarPhiPerpA2mDefinition=PA2m[-n,-m,-o,d,e,f]PAPara[-d,-e,-f,a,b,c]AVarPhiPerp[-a,-b,-c]/.AVarPhiPerpActivate//ActivateGeneralO3Projections;

VarPhiPerpB0pActivate=MakeRule[{VarPhiPerpB0p[],Scalar[Evaluate[VarPhiPerpB0pDefinition]]},MetricOn->All,ContractMetrics->True];
VarPhiPerpB1pActivate=MakeRule[{VarPhiPerpB1p[-n,-m],Evaluate[VarPhiPerpB1pDefinition]},MetricOn->All,ContractMetrics->True];
VarPhiPerpB1mActivate=MakeRule[{VarPhiPerpB1m[-n],Evaluate[VarPhiPerpB1mDefinition]},MetricOn->All,ContractMetrics->True];
VarPhiPerpB2pActivate=MakeRule[{VarPhiPerpB2p[-n,-m],Evaluate[VarPhiPerpB2pDefinition]},MetricOn->All,ContractMetrics->True];

VarPhiPerpA0pActivate=MakeRule[{VarPhiPerpA0p[],Scalar[Evaluate[VarPhiPerpA0pDefinition]]},MetricOn->All,ContractMetrics->True];
VarPhiPerpA0mActivate=MakeRule[{VarPhiPerpA0m[],Scalar[Evaluate[VarPhiPerpA0mDefinition]]},MetricOn->All,ContractMetrics->True];
VarPhiPerpA1pActivate=MakeRule[{VarPhiPerpA1p[-n,-m],Evaluate[VarPhiPerpA1pDefinition]},MetricOn->All,ContractMetrics->True];
VarPhiPerpA1mActivate=MakeRule[{VarPhiPerpA1m[-n],Evaluate[VarPhiPerpA1mDefinition]},MetricOn->All,ContractMetrics->True];
VarPhiPerpA2pActivate=MakeRule[{VarPhiPerpA2p[-n,-m],Evaluate[VarPhiPerpA2pDefinition]},MetricOn->All,ContractMetrics->True];
VarPhiPerpA2mActivate=MakeRule[{VarPhiPerpA2m[-n,-m,-o],Evaluate[VarPhiPerpA2mDefinition]},MetricOn->All,ContractMetrics->True];

VarPhiPerpActivate=Join[VarPhiPerpB0pActivate,VarPhiPerpB1pActivate,VarPhiPerpB1mActivate,VarPhiPerpB2pActivate,VarPhiPerpA0pActivate,VarPhiPerpA0mActivate,VarPhiPerpA1pActivate,VarPhiPerpA1mActivate,VarPhiPerpA2pActivate,VarPhiPerpA2mActivate];

DumpSave[xAct`HiGGS`Private`BinaryLocation["IfConstraints/VarPhiPerp/Rules"],{VarPhiPerpActivate}];
