(* this file sets aspects for CovD in Global` *)

UndefCovD@GaugeCovD;
DefCovD[GaugeCovD[-a],{"~","\[ScriptCapitalD]"}];

ChristoffelCDGaugeCovDToA=MakeRule[{PThreePara[-a,-b,-c,d,e,f],Evaluate[PThreeParaDefinition]},MetricOn->All,ContractMetrics->True];
