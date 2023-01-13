(*===================*)
(*  LambdaPiToShell  *)
(*===================*)

Begin["xAct`HiGGS`Private`"];

TLambdaPiToShell=MakeRule[{TLambdaPi[-n,-m,-o],0},MetricOn->All,ContractMetrics->True];
RLambdaPiToShell=MakeRule[{RLambdaPi[-n,-m,-o,-p],0},MetricOn->All,ContractMetrics->True];
LambdaPiToShell=Join[TLambdaPiToShell,RLambdaPiToShell];

End[];
