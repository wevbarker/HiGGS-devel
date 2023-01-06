(*===========================*)
(*  LambdaPiPerpParaDecompose  *)
(*===========================*)

RLambdaPiDecomposeDefinition=RLambdaPiP[-a,-b,-c,-d]+2Antisymmetrize[V[-d]RLambdaPiPerp[-a,-b,-c],{-c,-d}]/.ExpandStrengths/.PADMActivate//ToCanonical//CollectTensors//ScreenDollarIndices//CollectTensors;
TLambdaPiDecomposeDefinition=TLambdaPiP[-a,-c,-d]+2Antisymmetrize[V[-d]TLambdaPiPerp[-a,-c],{-c,-d}]/.ExpandStrengths/.PADMActivate//ToCanonical//CollectTensors//ScreenDollarIndices//CollectTensors;
RLambdaPiDecompose=MakeRule[{RLambdaPi[-a,-b,-c,-d],Evaluate[RLambdaPiDecomposeDefinition]},MetricOn->All,ContractMetrics->True];
TLambdaPiDecompose=MakeRule[{TLambdaPi[-a,-c,-d],Evaluate[TLambdaPiDecomposeDefinition]},MetricOn->All,ContractMetrics->True];
StrengthLambdaPiDecompose=Join[RLambdaPiDecompose,TLambdaPiDecompose];
