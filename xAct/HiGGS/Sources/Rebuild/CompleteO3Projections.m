(*=========================*)
(*  CompleteO3Projections  *)
(*=========================*)

PB0pTDefinition=(1/3)PPara[-n,-m]PB0p[e,f]PBPara[-e,-f,a,c]/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;
PB1pTDefinition=PB1p[-n,-m,e,f]PBPara[-e,-f,a,c]/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;
PB2pTDefinition=PB2p[-n,-m,e,f]PBPara[-e,-f,a,c]/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;
PB1mTDefinition=V[-n]PB1m[-m,f]PBPerp[-f,a,c]/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;

PB0pTActivate=MakeRule[{PB0pT[-n,-m,a,c],Evaluate[PB0pTDefinition]},MetricOn->All,ContractMetrics->True];
PB1pTActivate=MakeRule[{PB1pT[-n,-m,a,c],Evaluate[PB1pTDefinition]},MetricOn->All,ContractMetrics->True];
PB2pTActivate=MakeRule[{PB2pT[-n,-m,a,c],Evaluate[PB2pTDefinition]},MetricOn->All,ContractMetrics->True];
PB1mTActivate=MakeRule[{PB1mT[-n,-m,a,c],Evaluate[PB1mTDefinition]},MetricOn->All,ContractMetrics->True];

PA0pTDefinition=Antisymmetrize[Antisymmetrize[2Antisymmetrize[V[-n](1/3)PPara[-m,-o]PA0p[e,f]PAPerp[-e,-f,a,b,c],{-n,-m}],{-n,-m}],{a,b}]/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;
PA1pTDefinition=Antisymmetrize[Antisymmetrize[2Antisymmetrize[V[-n]PA1p[-m,-o,e,f]PAPerp[-e,-f,a,b,c],{-n,-m}],{-n,-m}],{a,b}]/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;
PA2pTDefinition=Antisymmetrize[Antisymmetrize[2Antisymmetrize[V[-n]PA2p[-m,-o,e,f]PAPerp[-e,-f,a,b,c],{-n,-m}],{-n,-m}],{a,b}]/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;
PA0mTDefinition=Antisymmetrize[Antisymmetrize[(-1/6)PA0m[-n,-m,-o]PA0m[i,j,k]PAPara[-i,-j,-k,a,b,c],{-n,-m}],{a,b}]/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;
PA1mTDefinition=Antisymmetrize[Antisymmetrize[Antisymmetrize[-PPara[-m,-o]PA1m[-n,i,j,k]PAPara[-i,-j,-k,a,b,c],{-m,-n}],{-n,-m}],{a,b}]/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;
PA2mTDefinition=Antisymmetrize[Antisymmetrize[(4/3)PA2m[-n,-m,-o,d,e,f]PAPara[-d,-e,-f,a,b,c],{-n,-m}],{a,b}]/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;

PA0pTActivate=MakeRule[{PA0pT[-n,-m,-o,a,b,c],Evaluate[PA0pTDefinition]},MetricOn->All,ContractMetrics->True];
PA1pTActivate=MakeRule[{PA1pT[-n,-m,-o,a,b,c],Evaluate[PA1pTDefinition]},MetricOn->All,ContractMetrics->True];
PA2pTActivate=MakeRule[{PA2pT[-n,-m,-o,a,b,c],Evaluate[PA2pTDefinition]},MetricOn->All,ContractMetrics->True];
PA0mTActivate=MakeRule[{PA0mT[-n,-m,-o,a,b,c],Evaluate[PA0mTDefinition]},MetricOn->All,ContractMetrics->True];
PA1mTActivate=MakeRule[{PA1mT[-n,-m,-o,a,b,c],Evaluate[PA1mTDefinition]},MetricOn->All,ContractMetrics->True];
PA2mTActivate=MakeRule[{PA2mT[-n,-m,-o,a,b,c],Evaluate[PA2mTDefinition]},MetricOn->All,ContractMetrics->True];

NewPO3TActivate=Join[PB0pTActivate,PB1pTActivate,PB2pTActivate,PB1mTActivate,PA0pTActivate,PA1pTActivate,PA2pTActivate,PA0mTActivate,PA1mTActivate,PA2mTActivate];

tmp=(PA0pT[-n,-m,-o,a,b,c]+PA1pT[-n,-m,-o,a,b,c]+PA2pT[-n,-m,-o,a,b,c]+PA0mT[-n,-m,-o,a,b,c]+PA1mT[-n,-m,-o,a,b,c]+PA2mT[-n,-m,-o,a,b,c])APi[-a,-b,-e]G3[e,-f]B[-c,f]/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;
xAct`HiGGS`Private`HiGGSPrint[tmp];

tmp=(PB0pT[-n,-m,a,c]+PB1pT[-n,-m,a,c]+PB2pT[-n,-m,a,c]+PB1mT[-n,-m,a,c])BPi[-a,-e]G3[e,-f]B[-c,f]/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;
xAct`HiGGS`Private`HiGGSPrint[tmp];

DumpSave[xAct`HiGGS`Private`BinaryLocation["CompleteO3Projections"],{NewPO3TActivate}];
