(*====================*)
(*  LambdaPiSO3Inverse  *)
(*====================*)

(*These rules then expand the O(3) parts in terms of the canonical parts*)
TLambdaPiPerp0pDefinition=PPerpT0p[e,f]PPerpTPara[-e,-f,a,b]TLambdaPiPerp[-a,-b]/.PPerpO3TActivate/.PPerpADMTActivate//ToCanonical;
TLambdaPiPerp1pDefinition=PPerpT1p[-n,-m,e,f]PPerpTPara[-e,-f,a,b]TLambdaPiPerp[-a,-b]/.PPerpO3TActivate/.PPerpADMTActivate//ToCanonical;
TLambdaPiPerp1mDefinition=PPerpT1m[-n,e]PPerpTPerp[-e,a,b]TLambdaPiPerp[-a,-b]/.PPerpO3TActivate/.PPerpADMTActivate//ToCanonical;
TLambdaPiPerp2pDefinition=PPerpT2p[-n,-m,e,f]PPerpTPara[-e,-f,a,b]TLambdaPiPerp[-a,-b]/.PPerpO3TActivate/.PPerpADMTActivate//ToCanonical;

RLambdaPiPerp0pDefinition=PPerpR0p[e,f]PPerpRPerp[-e,-f,a,b,c]RLambdaPiPerp[-a,-b,-c]/.PPerpO3RActivate/.PPerpADMRActivate//ToCanonical;
RLambdaPiPerp0mDefinition=PPerpR0m[e,f,g]PPerpRPara[-e,-f,-g,a,b,c]RLambdaPiPerp[-a,-b,-c]/.PPerpO3RActivate/.PPerpADMRActivate//ToCanonical;
RLambdaPiPerp1pDefinition=PPerpR1p[-n,-m,e,f]PPerpRPerp[-e,-f,a,b,c]RLambdaPiPerp[-a,-b,-c]/.PPerpO3RActivate/.PPerpADMRActivate//ToCanonical;
RLambdaPiPerp1mDefinition=PPerpR1m[-n,e,f,g]PPerpRPara[-e,-f,-g,a,b,c]RLambdaPiPerp[-a,-b,-c]/.PPerpO3RActivate/.PPerpADMRActivate//ToCanonical;
RLambdaPiPerp2pDefinition=PPerpR2p[-n,-m,e,f]PPerpRPerp[-e,-f,a,b,c]RLambdaPiPerp[-a,-b,-c]/.PPerpO3RActivate/.PPerpADMRActivate//ToCanonical;
RLambdaPiPerp2mDefinition=PPerpR2m[-n,-m,-o,e,f,g]PPerpRPara[-e,-f,-g,a,b,c]RLambdaPiPerp[-a,-b,-c]/.PPerpO3RActivate/.PPerpADMRActivate//ToCanonical;

TLambdaPiPerp0pActivate=MakeRule[{TLambdaPiPerp0p[],Scalar[Evaluate[TLambdaPiPerp0pDefinition]]},MetricOn->All,ContractMetrics->True];
TLambdaPiPerp1pActivate=MakeRule[{TLambdaPiPerp1p[-n,-m],Evaluate[TLambdaPiPerp1pDefinition]},MetricOn->All,ContractMetrics->True];
TLambdaPiPerp1mActivate=MakeRule[{TLambdaPiPerp1m[-n],Evaluate[TLambdaPiPerp1mDefinition]},MetricOn->All,ContractMetrics->True];
TLambdaPiPerp2pActivate=MakeRule[{TLambdaPiPerp2p[-n,-m],Evaluate[TLambdaPiPerp2pDefinition]},MetricOn->All,ContractMetrics->True];

RLambdaPiPerp0pActivate=MakeRule[{RLambdaPiPerp0p[],Scalar[Evaluate[RLambdaPiPerp0pDefinition]]},MetricOn->All,ContractMetrics->True];
RLambdaPiPerp0mActivate=MakeRule[{RLambdaPiPerp0m[],Scalar[Evaluate[RLambdaPiPerp0mDefinition]]},MetricOn->All,ContractMetrics->True];
RLambdaPiPerp1pActivate=MakeRule[{RLambdaPiPerp1p[-n,-m],Evaluate[RLambdaPiPerp1pDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaPiPerp1mActivate=MakeRule[{RLambdaPiPerp1m[-n],Evaluate[RLambdaPiPerp1mDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaPiPerp2pActivate=MakeRule[{RLambdaPiPerp2p[-n,-m],Evaluate[RLambdaPiPerp2pDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaPiPerp2mActivate=MakeRule[{RLambdaPiPerp2m[-n,-m,-o],Evaluate[RLambdaPiPerp2mDefinition]},MetricOn->All,ContractMetrics->True];

TLambdaPiPerpO3Activate=Join[TLambdaPiPerp0pActivate,TLambdaPiPerp1pActivate,TLambdaPiPerp1mActivate,TLambdaPiPerp2pActivate];
RLambdaPiPerpO3Activate=Join[RLambdaPiPerp0pActivate,RLambdaPiPerp0mActivate,RLambdaPiPerp1pActivate,RLambdaPiPerp1mActivate,RLambdaPiPerp2pActivate,RLambdaPiPerp2mActivate];

TLambdaPiPerpDefinition= V[-a]TLambdaPiPerp1m[-b]+
TLambdaPiPerp1p[-a,-b]+
TLambdaPiPerp2p[-a,-b]+
(1/3)PPara[-a,-b]TLambdaPiPerp0p[]/.PPerpO3TActivate/.PADMActivate//ToCanonical;

DefTensor[RLambdaPiPerpPerp[-a,-b],M4,OrthogonalTo->{V[a],V[b]}];
DefTensor[RLambdaPiPerpPara[-a,-b,-c],M4,Antisymmetric[{-a,-b}],OrthogonalTo->{V[a],V[b],V[c]}];

RLambdaPiPerpPerpDefinition=RLambdaPiPerp1p[-a,-b]+
RLambdaPiPerp2p[-a,-b]-
(1/3)PPara[-a,-b]RLambdaPiPerp0p[]/.PPerpO3RActivate/.PADMActivate//ToCanonical;
RLambdaPiPerpParaDefinition=-(1/6) PR0m[-a,-b,-c]RLambdaPiPerp0m[]-Antisymmetrize[-PPara[-c,-a]RLambdaPiPerp1m[-b],{-a,-b}]+(4/3) RLambdaPiPerp2m[-a,-b,-c]/.PPerpO3RActivate/.PADMActivate//ToCanonical;

RLambdaPiPerpPerpActivate=MakeRule[{RLambdaPiPerpPerp[-a,-b],Evaluate[RLambdaPiPerpPerpDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaPiPerpParaActivate=MakeRule[{RLambdaPiPerpPara[-a,-b,-c],Evaluate[RLambdaPiPerpParaDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaPiPerpParaPerpActivate=Join[RLambdaPiPerpParaActivate,RLambdaPiPerpPerpActivate];

RLambdaPiPerpDefinition= RLambdaPiPerpPara[-a,-b,-c]+2Antisymmetrize[V[-a]RLambdaPiPerpPerp[-b,-c],{-a,-b}]/.RLambdaPiPerpParaPerpActivate/.PO3RActivate/.PADMActivate//ToCanonical;

TLambdaPiPerpDefinition=TLambdaPiPerpDefinition//CollectTensors//ScreenDollarIndices//CollectTensors;

RLambdaPiPerpDefinition=RLambdaPiPerpDefinition//CollectTensors//ScreenDollarIndices//CollectTensors;

TLambdaPiPerpActivate=MakeRule[{TLambdaPiPerp[-a,-b],Evaluate[TLambdaPiPerpDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaPiPerpActivate=MakeRule[{RLambdaPiPerp[-a,-b,-c],Evaluate[RLambdaPiPerpDefinition]},MetricOn->All,ContractMetrics->True];
StrengthLambdaPiPerpToStrengthLambdaPiPerpO3=Join[TLambdaPiPerpActivate,RLambdaPiPerpActivate];
