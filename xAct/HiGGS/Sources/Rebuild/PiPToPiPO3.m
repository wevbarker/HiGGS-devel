(*==============*)
(*  PiPToPiPO3  *)
(*==============*)

Begin["xAct`HiGGS`Private`"];

BPiPDefinition=((1/3)PPara[-n,-m]PiPB0p[]+
  PiPB1p[-n,-m]+
  PiPB2p[-n,-m]+
 V[-n]PiPB1m[-m])/.PO3PiActivate/.PADMActivate//ToNewCanonical;

APiPDefinition=(Antisymmetrize[ 2Antisymmetrize[V[-n](1/3)PPara[-m,-o]PiPA0p[],{-n,-m}]+
 2Antisymmetrize[V[-n]PiPA1p[-m,-o],{-n,-m}]+
 2Antisymmetrize[V[-n]PiPA2p[-m,-o],{-n,-m}]+
 (-1/6)PA0m[-n,-m,-o]PiPA0m[]+
 Antisymmetrize[-PPara[-m,-o]PiPA1m[-n],{-m,-n}]+
(4/3)PiPA2m[-n,-m,-o],{-n,-m}])/.PO3PiActivate/.PADMActivate//ToNewCanonical;

BPiPActivate=MakeRule[{BPiP[-n,-m],Evaluate[BPiPDefinition]},MetricOn->All,ContractMetrics->True];
APiPActivate=MakeRule[{APiP[-n,-m,-o],Evaluate[APiPDefinition]},MetricOn->All,ContractMetrics->True];
PiPToPiPO3=Join[BPiPActivate,APiPActivate];

DumpSave[xAct`HiGGS`Private`BinaryLocation["PiPToPiPO3"],{PiPToPiPO3}];

End[];
