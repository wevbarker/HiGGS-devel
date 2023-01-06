(*===========================*)
(*  LambdaPerpParaDecompose  *)
(*===========================*)

RLambdaDecomposeDefinition=RLambdaP[-a,-b,-c,-d]+2Antisymmetrize[V[-d]RLambdaPerp[-a,-b,-c],{-c,-d}]/.ExpandStrengths/.PADMActivate//ToCanonical//CollectTensors//ScreenDollarIndices//CollectTensors;
TLambdaDecomposeDefinition=TLambdaP[-a,-c,-d]+2Antisymmetrize[V[-d]TLambdaPerp[-a,-c],{-c,-d}]/.ExpandStrengths/.PADMActivate//ToCanonical//CollectTensors//ScreenDollarIndices//CollectTensors;
RLambdaDecompose=MakeRule[{RLambda[-a,-b,-c,-d],Evaluate[RLambdaDecomposeDefinition]},MetricOn->All,ContractMetrics->True];
TLambdaDecompose=MakeRule[{TLambda[-a,-c,-d],Evaluate[TLambdaDecomposeDefinition]},MetricOn->All,ContractMetrics->True];
StrengthLambdaDecompose=Join[RLambdaDecompose,TLambdaDecompose];
