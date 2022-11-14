(*===========*)
(*  ChiPerp  *)
(*===========*)

ChiPerpB0pDefinition=PB0p[e,f]PBPara[-e,-f,a,c]BChiPerp[-a,-c]/.BChiPerpActivate//ActivateGeneralO3Projections;
ChiPerpB1pDefinition=PB1p[-n,-m,e,f]PBPara[-e,-f,a,c]BChiPerp[-a,-c]/.BChiPerpActivate//ActivateGeneralO3Projections;
ChiPerpB2pDefinition=PB2p[-n,-m,e,f]PBPara[-e,-f,a,c]BChiPerp[-a,-c]/.BChiPerpActivate//ActivateGeneralO3Projections;
ChiPerpB1mDefinition=PB1m[-n,f]PBPerp[-f,a,c]BChiPerp[-a,-c]/.BChiPerpActivate//ActivateGeneralO3Projections;

ChiPerpA0pDefinition=PA0p[e,f]PAPerp[-e,-f,a,b,c]AChiPerp[-a,-b,-c]/.AChiPerpActivate//ActivateGeneralO3Projections;
ChiPerpA1pDefinition=PA1p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]AChiPerp[-a,-b,-c]/.AChiPerpActivate//ActivateGeneralO3Projections;
ChiPerpA2pDefinition=PA2p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]AChiPerp[-a,-b,-c]/.AChiPerpActivate//ActivateGeneralO3Projections;
ChiPerpA0mDefinition=PA0m[d,e,f]PAPara[-d,-e,-f,a,b,c]AChiPerp[-a,-b,-c]/.AChiPerpActivate//ActivateGeneralO3Projections;
ChiPerpA1mDefinition=PA1m[-n,d,e,f]PAPara[-d,-e,-f,a,b,c]AChiPerp[-a,-b,-c]/.AChiPerpActivate//ActivateGeneralO3Projections;
ChiPerpA2mDefinition=PA2m[-n,-m,-o,d,e,f]PAPara[-d,-e,-f,a,b,c]AChiPerp[-a,-b,-c]/.AChiPerpActivate//ActivateGeneralO3Projections;

ChiPerpB0pActivate=MakeRule[{ChiPerpB0p[],Scalar[Evaluate[ChiPerpB0pDefinition]]},MetricOn->All,ContractMetrics->True];
ChiPerpB1pActivate=MakeRule[{ChiPerpB1p[-n,-m],Evaluate[ChiPerpB1pDefinition]},MetricOn->All,ContractMetrics->True];
ChiPerpB1mActivate=MakeRule[{ChiPerpB1m[-n],Evaluate[ChiPerpB1mDefinition]},MetricOn->All,ContractMetrics->True];
ChiPerpB2pActivate=MakeRule[{ChiPerpB2p[-n,-m],Evaluate[ChiPerpB2pDefinition]},MetricOn->All,ContractMetrics->True];
ChiPerpA0pActivate=MakeRule[{ChiPerpA0p[],Scalar[Evaluate[ChiPerpA0pDefinition]]},MetricOn->All,ContractMetrics->True];
ChiPerpA0mActivate=MakeRule[{ChiPerpA0m[],Scalar[Evaluate[ChiPerpA0mDefinition]]},MetricOn->All,ContractMetrics->True];
ChiPerpA1pActivate=MakeRule[{ChiPerpA1p[-n,-m],Evaluate[ChiPerpA1pDefinition]},MetricOn->All,ContractMetrics->True];
ChiPerpA1mActivate=MakeRule[{ChiPerpA1m[-n],Evaluate[ChiPerpA1mDefinition]},MetricOn->All,ContractMetrics->True];
ChiPerpA2pActivate=MakeRule[{ChiPerpA2p[-n,-m],Evaluate[ChiPerpA2pDefinition]},MetricOn->All,ContractMetrics->True];
ChiPerpA2mActivate=MakeRule[{ChiPerpA2m[-n,-m,-o],Evaluate[ChiPerpA2mDefinition]},MetricOn->All,ContractMetrics->True];

ChiPerpActivate=Join[ChiPerpB0pActivate,ChiPerpB1pActivate,ChiPerpB1mActivate,ChiPerpB2pActivate,ChiPerpA0pActivate,ChiPerpA0mActivate,ChiPerpA1pActivate,ChiPerpA1mActivate,ChiPerpA2pActivate,ChiPerpA2mActivate];

DumpSave[xAct`HiGGS`Private`BinaryLocation["ChiPerp"],{ChiPerpActivate}];
