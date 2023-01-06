(*====================*)
(*  LambdaSO3Inverse  *)
(*====================*)

(*These rules then expand the O(3) parts in terms of the canonical parts*)
TLambdaPerp0pDefinition=PPerpT0p[e,f]PPerpTPara[-e,-f,a,b]TLambdaPerp[-a,-b]/.PPerpO3TActivate/.PPerpADMTActivate//ToCanonical;
TLambdaPerp1pDefinition=PPerpT1p[-n,-m,e,f]PPerpTPara[-e,-f,a,b]TLambdaPerp[-a,-b]/.PPerpO3TActivate/.PPerpADMTActivate//ToCanonical;
TLambdaPerp1mDefinition=PPerpT1m[-n,e]PPerpTPerp[-e,a,b]TLambdaPerp[-a,-b]/.PPerpO3TActivate/.PPerpADMTActivate//ToCanonical;
TLambdaPerp2pDefinition=PPerpT2p[-n,-m,e,f]PPerpTPara[-e,-f,a,b]TLambdaPerp[-a,-b]/.PPerpO3TActivate/.PPerpADMTActivate//ToCanonical;

RLambdaPerp0pDefinition=PPerpR0p[e,f]PPerpRPerp[-e,-f,a,b,c]RLambdaPerp[-a,-b,-c]/.PPerpO3RActivate/.PPerpADMRActivate//ToCanonical;
RLambdaPerp0mDefinition=PPerpR0m[e,f,g]PPerpRPara[-e,-f,-g,a,b,c]RLambdaPerp[-a,-b,-c]/.PPerpO3RActivate/.PPerpADMRActivate//ToCanonical;
RLambdaPerp1pDefinition=PPerpR1p[-n,-m,e,f]PPerpRPerp[-e,-f,a,b,c]RLambdaPerp[-a,-b,-c]/.PPerpO3RActivate/.PPerpADMRActivate//ToCanonical;
RLambdaPerp1mDefinition=PPerpR1m[-n,e,f,g]PPerpRPara[-e,-f,-g,a,b,c]RLambdaPerp[-a,-b,-c]/.PPerpO3RActivate/.PPerpADMRActivate//ToCanonical;
RLambdaPerp2pDefinition=PPerpR2p[-n,-m,e,f]PPerpRPerp[-e,-f,a,b,c]RLambdaPerp[-a,-b,-c]/.PPerpO3RActivate/.PPerpADMRActivate//ToCanonical;
RLambdaPerp2mDefinition=PPerpR2m[-n,-m,-o,e,f,g]PPerpRPara[-e,-f,-g,a,b,c]RLambdaPerp[-a,-b,-c]/.PPerpO3RActivate/.PPerpADMRActivate//ToCanonical;

TLambdaPerp0pActivate=MakeRule[{TLambdaPerp0p[],Scalar[Evaluate[TLambdaPerp0pDefinition]]},MetricOn->All,ContractMetrics->True];
TLambdaPerp1pActivate=MakeRule[{TLambdaPerp1p[-n,-m],Evaluate[TLambdaPerp1pDefinition]},MetricOn->All,ContractMetrics->True];
TLambdaPerp1mActivate=MakeRule[{TLambdaPerp1m[-n],Evaluate[TLambdaPerp1mDefinition]},MetricOn->All,ContractMetrics->True];
TLambdaPerp2pActivate=MakeRule[{TLambdaPerp2p[-n,-m],Evaluate[TLambdaPerp2pDefinition]},MetricOn->All,ContractMetrics->True];

RLambdaPerp0pActivate=MakeRule[{RLambdaPerp0p[],Scalar[Evaluate[RLambdaPerp0pDefinition]]},MetricOn->All,ContractMetrics->True];
RLambdaPerp0mActivate=MakeRule[{RLambdaPerp0m[],Scalar[Evaluate[RLambdaPerp0mDefinition]]},MetricOn->All,ContractMetrics->True];
RLambdaPerp1pActivate=MakeRule[{RLambdaPerp1p[-n,-m],Evaluate[RLambdaPerp1pDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaPerp1mActivate=MakeRule[{RLambdaPerp1m[-n],Evaluate[RLambdaPerp1mDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaPerp2pActivate=MakeRule[{RLambdaPerp2p[-n,-m],Evaluate[RLambdaPerp2pDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaPerp2mActivate=MakeRule[{RLambdaPerp2m[-n,-m,-o],Evaluate[RLambdaPerp2mDefinition]},MetricOn->All,ContractMetrics->True];

TLambdaPerpO3Activate=Join[TLambdaPerp0pActivate,TLambdaPerp1pActivate,TLambdaPerp1mActivate,TLambdaPerp2pActivate];
RLambdaPerpO3Activate=Join[RLambdaPerp0pActivate,RLambdaPerp0mActivate,RLambdaPerp1pActivate,RLambdaPerp1mActivate,RLambdaPerp2pActivate,RLambdaPerp2mActivate];

TLambdaPerpDefinition= V[-a]TLambdaPerp1m[-b]+
TLambdaPerp1p[-a,-b]+
TLambdaPerp2p[-a,-b]+
(1/3)PPara[-a,-b]TLambdaPerp0p[]/.PPerpO3TActivate/.PADMActivate//ToCanonical;

DefTensor[RLambdaPerpPerp[-a,-b],M4,OrthogonalTo->{V[a],V[b]}];
DefTensor[RLambdaPerpPara[-a,-b,-c],M4,Antisymmetric[{-a,-b}],OrthogonalTo->{V[a],V[b],V[c]}];

RLambdaPerpPerpDefinition=RLambdaPerp1p[-a,-b]+
RLambdaPerp2p[-a,-b]-
(1/3)PPara[-a,-b]RLambdaPerp0p[]/.PPerpO3RActivate/.PADMActivate//ToCanonical;
RLambdaPerpParaDefinition=-(1/6) PR0m[-a,-b,-c]RLambdaPerp0m[]-Antisymmetrize[-PPara[-c,-a]RLambdaPerp1m[-b],{-a,-b}]+(4/3) RLambdaPerp2m[-a,-b,-c]/.PPerpO3RActivate/.PADMActivate//ToCanonical;

RLambdaPerpPerpActivate=MakeRule[{RLambdaPerpPerp[-a,-b],Evaluate[RLambdaPerpPerpDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaPerpParaActivate=MakeRule[{RLambdaPerpPara[-a,-b,-c],Evaluate[RLambdaPerpParaDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaPerpParaPerpActivate=Join[RLambdaPerpParaActivate,RLambdaPerpPerpActivate];

RLambdaPerpDefinition= RLambdaPerpPara[-a,-b,-c]+2Antisymmetrize[V[-a]RLambdaPerpPerp[-b,-c],{-a,-b}]/.RLambdaPerpParaPerpActivate/.PO3RActivate/.PADMActivate//ToCanonical;

TLambdaPerpDefinition=TLambdaPerpDefinition//CollectTensors//ScreenDollarIndices//CollectTensors;

RLambdaPerpDefinition=RLambdaPerpDefinition//CollectTensors//ScreenDollarIndices//CollectTensors;

TLambdaPerpActivate=MakeRule[{TLambdaPerp[-a,-b],Evaluate[TLambdaPerpDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaPerpActivate=MakeRule[{RLambdaPerp[-a,-b,-c],Evaluate[RLambdaPerpDefinition]},MetricOn->All,ContractMetrics->True];
StrengthLambdaPerpToStrengthLambdaPerpO3=Join[TLambdaPerpActivate,RLambdaPerpActivate];
