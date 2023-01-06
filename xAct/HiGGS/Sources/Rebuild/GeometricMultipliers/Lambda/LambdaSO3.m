(*=============*)
(*  LambdaSO3  *)
(*=============*)

(*These rules then expand the O(3) parts in terms of the canonical parts*)

TLambdaP0mDefinition=PT0m[e,f,g]PTPara[-e,-f,-g,a,b,c]TLambdaP[-a,-b,-c]/.PO3TActivate/.PADMTActivate//ToCanonical;
TLambdaP1pDefinition=PT1p[-n,-m,e,f]PTPerp[-e,-f,a,b,c]TLambdaP[-a,-b,-c]/.PO3TActivate/.PADMTActivate//ToCanonical;
TLambdaP1mDefinition=PT1m[-n,e,f,g]PTPara[-e,-f,-g,a,b,c]TLambdaP[-a,-b,-c]/.PO3TActivate/.PADMTActivate//ToCanonical;
TLambdaP2mDefinition=PT2m[-n,-m,-o,e,f,g]PTPara[-e,-f,-g,a,b,c]TLambdaP[-a,-b,-c]/.PO3TActivate/.PADMTActivate//ToCanonical;

RLambdaP0pDefinition=PR0p[e,f,g,h]PRPara[-e,-f,-g,-h,a,b,c,d]RLambdaP[-a,-b,-c,-d]/.PO3RActivate/.PADMRActivate//ToCanonical;
RLambdaP0mDefinition=PR0m[e,f,g]PRPerp[-e,-f,-g,a,b,c,d]RLambdaP[-a,-b,-c,-d]/.PO3RActivate/.PADMRActivate//ToCanonical;
RLambdaP1pDefinition=PR1p[-n,-m,e,f,g,h]PRPara[-e,-f,-g,-h,a,b,c,d]RLambdaP[-a,-b,-c,-d]/.PO3RActivate/.PADMRActivate//ToCanonical;
RLambdaP1mDefinition=PR1m[-n,e,f,g]PRPerp[-e,-f,-g,a,b,c,d]RLambdaP[-a,-b,-c,-d]/.PO3RActivate/.PADMRActivate//ToCanonical;
RLambdaP2pDefinition=PR2p[-n,-m,e,f,g,h]PRPara[-e,-f,-g,-h,a,b,c,d]RLambdaP[-a,-b,-c,-d]/.PO3RActivate/.PADMRActivate//ToCanonical;
RLambdaP2mDefinition=PR2m[-n,-m,-o,e,f,g]PRPerp[-e,-f,-g,a,b,c,d]RLambdaP[-a,-b,-c,-d]/.PO3RActivate/.PADMRActivate//ToCanonical;

TLambdaP0mActivate=MakeRule[{TLambdaP0m[],Scalar[Evaluate[TLambdaP0mDefinition]]},MetricOn->All,ContractMetrics->True];
TLambdaP1pActivate=MakeRule[{TLambdaP1p[-n,-m],Evaluate[TLambdaP1pDefinition]},MetricOn->All,ContractMetrics->True];
TLambdaP1mActivate=MakeRule[{TLambdaP1m[-n],Evaluate[TLambdaP1mDefinition]},MetricOn->All,ContractMetrics->True];
TLambdaP2mActivate=MakeRule[{TLambdaP2m[-n,-m,-o],Evaluate[TLambdaP2mDefinition]},MetricOn->All,ContractMetrics->True];

RLambdaP0pActivate=MakeRule[{RLambdaP0p[],Scalar[Evaluate[RLambdaP0pDefinition]]},MetricOn->All,ContractMetrics->True];
RLambdaP0mActivate=MakeRule[{RLambdaP0m[],Scalar[Evaluate[RLambdaP0mDefinition]]},MetricOn->All,ContractMetrics->True];
RLambdaP1pActivate=MakeRule[{RLambdaP1p[-n,-m],Evaluate[RLambdaP1pDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaP1mActivate=MakeRule[{RLambdaP1m[-n],Evaluate[RLambdaP1mDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaP2pActivate=MakeRule[{RLambdaP2p[-n,-m],Evaluate[RLambdaP2pDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaP2mActivate=MakeRule[{RLambdaP2m[-n,-m,-o],Evaluate[RLambdaP2mDefinition]},MetricOn->All,ContractMetrics->True];

TLambdaPO3Activate=Join[TLambdaP0mActivate,TLambdaP1pActivate,TLambdaP1mActivate,TLambdaP2mActivate];
RLambdaPO3Activate=Join[RLambdaP0pActivate,RLambdaP0mActivate,RLambdaP1pActivate,RLambdaP1mActivate,RLambdaP2pActivate,RLambdaP2mActivate];

TLambdaPDefinition= V[-a]TLambdaP1p[-b,-c]+
-(1/6) PT0m[-a,-b,-c]TLambdaP0m[]+
 Antisymmetrize[-PPara[-a,-b]TLambdaP1m[-c],{-b,-c}]+
(4/3) TLambdaP2m[-b,-c,-a]/.PO3TActivate/.PADMActivate//ToCanonical;

DefTensor[RLambdaPPara[-a,-b,-c,-d],M4,{Antisymmetric[{-a,-b}],Antisymmetric[{-c,-d}]},OrthogonalTo->{V[a],V[b],V[c],V[d]}];
DefTensor[RLambdaPPerp[-a,-b,-c],M4,Antisymmetric[{-b,-c}],OrthogonalTo->{V[a],V[b],V[c]}];

RLambdaPParaDefinition=-(1/6)(PPara[-a,-d]PPara[-b,-c]-PPara[-a,-c]PPara[-b,-d])RLambdaP0p[]-
(PPara[-b,-d]RLambdaP1p[-a,-c]-PPara[-b,-c]RLambdaP1p[-a,-d]-PPara[-a,-d]RLambdaP1p[-b,-c]+PPara[-a,-c]RLambdaP1p[-b,-d])+
(PPara[-b,-d]RLambdaP2p[-a,-c]-PPara[-b,-c]RLambdaP2p[-a,-d]-PPara[-a,-d]RLambdaP2p[-b,-c]+PPara[-a,-c]RLambdaP2p[-b,-d]);
RLambdaPPerpDefinition=-(1/6) PR0m[-a,-b,-c]RLambdaP0m[]+ Antisymmetrize[-PPara[-a,-b]RLambdaP1m[-c],{-b,-c}]+(4/3) RLambdaP2m[-b,-c,-a];

RLambdaPParaActivate=MakeRule[{RLambdaPPara[-a,-b,-c,-d],Evaluate[RLambdaPParaDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaPPerpActivate=MakeRule[{RLambdaPPerp[-a,-b,-c],Evaluate[RLambdaPPerpDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaPParaPerpActivate=Join[RLambdaPParaActivate,RLambdaPPerpActivate];

RLambdaPDefinition= RLambdaPPara[-a,-b,-c,-d]+2Antisymmetrize[V[-a]RLambdaPPerp[-b,-c,-d],{-a,-b}]/.RLambdaPParaPerpActivate/.PO3RActivate/.PADMActivate//ToCanonical;

TLambdaPDefinition=TLambdaPDefinition//CollectTensors//ScreenDollarIndices//CollectTensors;
RLambdaPDefinition=RLambdaPDefinition//CollectTensors//ScreenDollarIndices//CollectTensors;

TLambdaPActivate=MakeRule[{TLambdaP[-a,-b,-c],Evaluate[TLambdaPDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaPActivate=MakeRule[{RLambdaP[-a,-b,-c,-d],Evaluate[RLambdaPDefinition]},MetricOn->All,ContractMetrics->True];
StrengthLambdaPToStrengthLambdaPO3=Join[TLambdaPActivate,RLambdaPActivate];
