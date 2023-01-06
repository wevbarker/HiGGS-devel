(*=========*)
(*  Rules  *)
(*=========*)

VarPhiParaB0mDefinition=PT0m[e,f,g]PTPara[-e,-f,-g,a,b,c]BVarPhiPara[-a,-b,-c]/.BVarPhiParaActivate/.PO3TActivate/.PADMTActivate//ActivateGeneralO3Projections;
VarPhiParaB1pDefinition=PT1p[-n,-m,e,f]PTPerp[-e,-f,a,b,c]BVarPhiPara[-a,-b,-c]/.BVarPhiParaActivate/.PO3TActivate/.PADMTActivate//ActivateGeneralO3Projections;
VarPhiParaB1mDefinition=PT1m[-n,e,f,g]PTPara[-e,-f,-g,a,b,c]BVarPhiPara[-a,-b,-c]/.BVarPhiParaActivate/.PO3TActivate/.PADMTActivate//ActivateGeneralO3Projections;
VarPhiParaB2mDefinition=PT2m[-n,-m,-o,e,f,g]PTPara[-e,-f,-g,a,b,c]BVarPhiPara[-a,-b,-c]/.BVarPhiParaActivate/.PO3TActivate/.PADMTActivate//ActivateGeneralO3Projections;

VarPhiParaA0pDefinition=PR0p[e,f,g,h]PRPara[-e,-f,-g,-h,a,b,c,d]AVarPhiPara[-a,-b,-c,-d]/.AVarPhiParaActivate/.PO3RActivate/.PADMRActivate//ActivateGeneralO3Projections;
VarPhiParaA0mDefinition=PR0m[e,f,g]PRPerp[-e,-f,-g,a,b,c,d]AVarPhiPara[-a,-b,-c,-d]/.AVarPhiParaActivate/.PO3RActivate/.PADMRActivate//ActivateGeneralO3Projections;
VarPhiParaA1pDefinition=PR1p[-n,-m,e,f,g,h]PRPara[-e,-f,-g,-h,a,b,c,d]AVarPhiPara[-a,-b,-c,-d]/.AVarPhiParaActivate/.PO3RActivate/.PADMRActivate//ActivateGeneralO3Projections;
VarPhiParaA1mDefinition=PR1m[-n,e,f,g]PRPerp[-e,-f,-g,a,b,c,d]AVarPhiPara[-a,-b,-c,-d]/.AVarPhiParaActivate/.PO3RActivate/.PADMRActivate//ActivateGeneralO3Projections;
VarPhiParaA2pDefinition=PR2p[-n,-m,e,f,g,h]PRPara[-e,-f,-g,-h,a,b,c,d]AVarPhiPara[-a,-b,-c,-d]/.AVarPhiParaActivate/.PO3RActivate/.PADMRActivate//ActivateGeneralO3Projections;
VarPhiParaA2mDefinition=PR2m[-n,-m,-o,e,f,g]PRPerp[-e,-f,-g,a,b,c,d]AVarPhiPara[-a,-b,-c,-d]/.AVarPhiParaActivate/.PO3RActivate/.PADMRActivate//ActivateGeneralO3Projections;

VarPhiParaB0mActivate=MakeRule[{VarPhiParaB0m[],Scalar[Evaluate[VarPhiParaB0mDefinition]]},MetricOn->All,ContractMetrics->True];
VarPhiParaB1pActivate=MakeRule[{VarPhiParaB1p[-n,-m],Evaluate[VarPhiParaB1pDefinition]},MetricOn->All,ContractMetrics->True];
VarPhiParaB1mActivate=MakeRule[{VarPhiParaB1m[-n],Evaluate[VarPhiParaB1mDefinition]},MetricOn->All,ContractMetrics->True];
VarPhiParaB2mActivate=MakeRule[{VarPhiParaB2m[-n,-m,-o],Evaluate[VarPhiParaB2mDefinition]},MetricOn->All,ContractMetrics->True];

VarPhiParaA0pActivate=MakeRule[{VarPhiParaA0p[],Scalar[Evaluate[VarPhiParaA0pDefinition]]},MetricOn->All,ContractMetrics->True];
VarPhiParaA0mActivate=MakeRule[{VarPhiParaA0m[],Scalar[Evaluate[VarPhiParaA0mDefinition]]},MetricOn->All,ContractMetrics->True];
VarPhiParaA1pActivate=MakeRule[{VarPhiParaA1p[-n,-m],Evaluate[VarPhiParaA1pDefinition]},MetricOn->All,ContractMetrics->True];
VarPhiParaA1mActivate=MakeRule[{VarPhiParaA1m[-n],Evaluate[VarPhiParaA1mDefinition]},MetricOn->All,ContractMetrics->True];
VarPhiParaA2pActivate=MakeRule[{VarPhiParaA2p[-n,-m],Evaluate[VarPhiParaA2pDefinition]},MetricOn->All,ContractMetrics->True];
VarPhiParaA2mActivate=MakeRule[{VarPhiParaA2m[-n,-m,-o],Evaluate[VarPhiParaA2mDefinition]},MetricOn->All,ContractMetrics->True];

VarPhiParaActivate=Join[VarPhiParaB0mActivate,VarPhiParaB1pActivate,VarPhiParaB1mActivate,VarPhiParaB2mActivate,VarPhiParaA0pActivate,VarPhiParaA0mActivate,VarPhiParaA1pActivate,VarPhiParaA1mActivate,VarPhiParaA2pActivate,VarPhiParaA2mActivate];

DumpSave[xAct`HiGGS`Private`BinaryLocation["IfConstraints/VarPhiPara/Rules"],{VarPhiParaActivate}];
