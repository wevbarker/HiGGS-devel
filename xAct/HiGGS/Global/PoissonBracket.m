(* provides the PoissonBracket function *)

DefTensor[xAct`HiGGS`Private`CDBDummy[-a,-b,-c],M4];
DefTensor[xAct`HiGGS`Private`CDADummy[-a,-b,-c,-d],M4,Antisymmetric[{-b,-c}]];
DefTensor[xAct`HiGGS`Private`CDBPiDummy[-a,-b,-c],M4];
DefTensor[xAct`HiGGS`Private`CDAPiDummy[-a,-b,-c,-d],M4,Antisymmetric[{-b,-c}]];

xAct`HiGGS`Private`InertDerB=MakeRule[{CD[-a][B[-b,-c]],xAct`HiGGS`Private`CDBDummy[-a,-b,-c]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`InertDerA=MakeRule[{CD[-a][A[-b,-c,-d]],xAct`HiGGS`Private`CDADummy[-a,-b,-c,-d]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`InertDerBP=MakeRule[{CD[-a][BPi[-b,-c]],xAct`HiGGS`Private`CDBPiDummy[-a,-b,-c]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`InertDerAP=MakeRule[{CD[-a][APi[-b,-c,-d]],xAct`HiGGS`Private`CDAPiDummy[-a,-b,-c,-d]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`InertDer=Join[xAct`HiGGS`Private`InertDerB,xAct`HiGGS`Private`InertDerA,xAct`HiGGS`Private`InertDerBP,xAct`HiGGS`Private`InertDerAP];
xAct`HiGGS`Private`InertDerRevB=MakeRule[{xAct`HiGGS`Private`CDBDummy[-a,-b,-c],CD[-a][B[-b,-c]]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`InertDerRevA=MakeRule[{xAct`HiGGS`Private`CDADummy[-a,-b,-c,-d],CD[-a][A[-b,-c,-d]]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`InertDerRevBP=MakeRule[{xAct`HiGGS`Private`CDBPiDummy[-a,-b,-c],CD[-a][BPi[-b,-c]]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`InertDerRevAP=MakeRule[{xAct`HiGGS`Private`CDAPiDummy[-a,-b,-c,-d],CD[-a][APi[-b,-c,-d]]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`InertDerRev=Join[xAct`HiGGS`Private`InertDerRevB,xAct`HiGGS`Private`InertDerRevA,xAct`HiGGS`Private`InertDerRevBP,xAct`HiGGS`Private`InertDerRevAP];

xAct`HiGGS`Private`Derivative3B=MakeRule[{CD[-a][B[b,-c]],G3[-a,d]CD[-d][B[b,-c]]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`Derivative3A=MakeRule[{CD[-a][A[b,e,-c]],G3[-a,d]CD[-d][A[b,e,-c]]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`Derivative3=Join[xAct`HiGGS`Private`Derivative3B,xAct`HiGGS`Private`Derivative3A];

TangentM4~AddIndices~((Symbol@("xAct`HiGGS`Private`Z"<>#))&/@(ToString/@Alphabet[]));
TangentM4~AddIndices~((Symbol@("xAct`HiGGS`Private`Z"<>#<>"1"))&/@(ToString/@Alphabet[]));
