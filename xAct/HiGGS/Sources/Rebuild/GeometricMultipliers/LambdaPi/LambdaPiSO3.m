(*=============*)
(*  LambdaPiSO3  *)
(*=============*)

(*These rules then expand the O(3) parts in terms of the canonical parts*)

TLambdaPiP0mDefinition=PT0m[e,f,g]PTPara[-e,-f,-g,a,b,c]TLambdaPiP[-a,-b,-c]/.PO3TActivate/.PADMTActivate//ToCanonical;
TLambdaPiP1pDefinition=PT1p[-n,-m,e,f]PTPerp[-e,-f,a,b,c]TLambdaPiP[-a,-b,-c]/.PO3TActivate/.PADMTActivate//ToCanonical;
TLambdaPiP1mDefinition=PT1m[-n,e,f,g]PTPara[-e,-f,-g,a,b,c]TLambdaPiP[-a,-b,-c]/.PO3TActivate/.PADMTActivate//ToCanonical;
TLambdaPiP2mDefinition=PT2m[-n,-m,-o,e,f,g]PTPara[-e,-f,-g,a,b,c]TLambdaPiP[-a,-b,-c]/.PO3TActivate/.PADMTActivate//ToCanonical;

RLambdaPiP0pDefinition=PR0p[e,f,g,h]PRPara[-e,-f,-g,-h,a,b,c,d]RLambdaPiP[-a,-b,-c,-d]/.PO3RActivate/.PADMRActivate//ToCanonical;
RLambdaPiP0mDefinition=PR0m[e,f,g]PRPerp[-e,-f,-g,a,b,c,d]RLambdaPiP[-a,-b,-c,-d]/.PO3RActivate/.PADMRActivate//ToCanonical;
RLambdaPiP1pDefinition=PR1p[-n,-m,e,f,g,h]PRPara[-e,-f,-g,-h,a,b,c,d]RLambdaPiP[-a,-b,-c,-d]/.PO3RActivate/.PADMRActivate//ToCanonical;
RLambdaPiP1mDefinition=PR1m[-n,e,f,g]PRPerp[-e,-f,-g,a,b,c,d]RLambdaPiP[-a,-b,-c,-d]/.PO3RActivate/.PADMRActivate//ToCanonical;
RLambdaPiP2pDefinition=PR2p[-n,-m,e,f,g,h]PRPara[-e,-f,-g,-h,a,b,c,d]RLambdaPiP[-a,-b,-c,-d]/.PO3RActivate/.PADMRActivate//ToCanonical;
RLambdaPiP2mDefinition=PR2m[-n,-m,-o,e,f,g]PRPerp[-e,-f,-g,a,b,c,d]RLambdaPiP[-a,-b,-c,-d]/.PO3RActivate/.PADMRActivate//ToCanonical;

TLambdaPiP0mActivate=MakeRule[{TLambdaPiP0m[],Scalar[Evaluate[TLambdaPiP0mDefinition]]},MetricOn->All,ContractMetrics->True];
TLambdaPiP1pActivate=MakeRule[{TLambdaPiP1p[-n,-m],Evaluate[TLambdaPiP1pDefinition]},MetricOn->All,ContractMetrics->True];
TLambdaPiP1mActivate=MakeRule[{TLambdaPiP1m[-n],Evaluate[TLambdaPiP1mDefinition]},MetricOn->All,ContractMetrics->True];
TLambdaPiP2mActivate=MakeRule[{TLambdaPiP2m[-n,-m,-o],Evaluate[TLambdaPiP2mDefinition]},MetricOn->All,ContractMetrics->True];

RLambdaPiP0pActivate=MakeRule[{RLambdaPiP0p[],Scalar[Evaluate[RLambdaPiP0pDefinition]]},MetricOn->All,ContractMetrics->True];
RLambdaPiP0mActivate=MakeRule[{RLambdaPiP0m[],Scalar[Evaluate[RLambdaPiP0mDefinition]]},MetricOn->All,ContractMetrics->True];
RLambdaPiP1pActivate=MakeRule[{RLambdaPiP1p[-n,-m],Evaluate[RLambdaPiP1pDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaPiP1mActivate=MakeRule[{RLambdaPiP1m[-n],Evaluate[RLambdaPiP1mDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaPiP2pActivate=MakeRule[{RLambdaPiP2p[-n,-m],Evaluate[RLambdaPiP2pDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaPiP2mActivate=MakeRule[{RLambdaPiP2m[-n,-m,-o],Evaluate[RLambdaPiP2mDefinition]},MetricOn->All,ContractMetrics->True];

TLambdaPiPO3Activate=Join[TLambdaPiP0mActivate,TLambdaPiP1pActivate,TLambdaPiP1mActivate,TLambdaPiP2mActivate];
RLambdaPiPO3Activate=Join[RLambdaPiP0pActivate,RLambdaPiP0mActivate,RLambdaPiP1pActivate,RLambdaPiP1mActivate,RLambdaPiP2pActivate,RLambdaPiP2mActivate];

TLambdaPiPDefinition= V[-a]TLambdaPiP1p[-b,-c]+
-(1/6) PT0m[-a,-b,-c]TLambdaPiP0m[]+
 Antisymmetrize[-PPara[-a,-b]TLambdaPiP1m[-c],{-b,-c}]+
(4/3) TLambdaPiP2m[-b,-c,-a]/.PO3TActivate/.PADMActivate//ToCanonical;

DefTensor[RLambdaPiPPara[-a,-b,-c,-d],M4,{Antisymmetric[{-a,-b}],Antisymmetric[{-c,-d}]},OrthogonalTo->{V[a],V[b],V[c],V[d]}];
DefTensor[RLambdaPiPPerp[-a,-b,-c],M4,Antisymmetric[{-b,-c}],OrthogonalTo->{V[a],V[b],V[c]}];

RLambdaPiPParaDefinition=-(1/6)(PPara[-a,-d]PPara[-b,-c]-PPara[-a,-c]PPara[-b,-d])RLambdaPiP0p[]-
(PPara[-b,-d]RLambdaPiP1p[-a,-c]-PPara[-b,-c]RLambdaPiP1p[-a,-d]-PPara[-a,-d]RLambdaPiP1p[-b,-c]+PPara[-a,-c]RLambdaPiP1p[-b,-d])+
(PPara[-b,-d]RLambdaPiP2p[-a,-c]-PPara[-b,-c]RLambdaPiP2p[-a,-d]-PPara[-a,-d]RLambdaPiP2p[-b,-c]+PPara[-a,-c]RLambdaPiP2p[-b,-d]);
RLambdaPiPPerpDefinition=-(1/6) PR0m[-a,-b,-c]RLambdaPiP0m[]+ Antisymmetrize[-PPara[-a,-b]RLambdaPiP1m[-c],{-b,-c}]+(4/3) RLambdaPiP2m[-b,-c,-a];

RLambdaPiPParaActivate=MakeRule[{RLambdaPiPPara[-a,-b,-c,-d],Evaluate[RLambdaPiPParaDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaPiPPerpActivate=MakeRule[{RLambdaPiPPerp[-a,-b,-c],Evaluate[RLambdaPiPPerpDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaPiPParaPerpActivate=Join[RLambdaPiPParaActivate,RLambdaPiPPerpActivate];

RLambdaPiPDefinition= RLambdaPiPPara[-a,-b,-c,-d]+2Antisymmetrize[V[-a]RLambdaPiPPerp[-b,-c,-d],{-a,-b}]/.RLambdaPiPParaPerpActivate/.PO3RActivate/.PADMActivate//ToCanonical;

TLambdaPiPDefinition=TLambdaPiPDefinition//CollectTensors//ScreenDollarIndices//CollectTensors;
RLambdaPiPDefinition=RLambdaPiPDefinition//CollectTensors//ScreenDollarIndices//CollectTensors;

TLambdaPiPActivate=MakeRule[{TLambdaPiP[-a,-b,-c],Evaluate[TLambdaPiPDefinition]},MetricOn->All,ContractMetrics->True];
RLambdaPiPActivate=MakeRule[{RLambdaPiP[-a,-b,-c,-d],Evaluate[RLambdaPiPDefinition]},MetricOn->All,ContractMetrics->True];
StrengthLambdaPiPToStrengthLambdaPiPO3=Join[TLambdaPiPActivate,RLambdaPiPActivate];
