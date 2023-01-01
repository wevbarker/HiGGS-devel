(*===========*)
(*  Measure  *)
(*===========*)

NSymb="\[ScriptCapitalN]";
DefTensor[Lapse[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[NSymb]];
JiSymb="\!\(\*SuperscriptBox[\(\[ScriptCapitalJ]\), \(-1\)]\)";
DefTensor[Ji[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[JiSymb]];
JSymb="\[ScriptCapitalJ]";
DefTensor[J[],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[JSymb]];
AutomaticRules[J,MakeRule[{J[]Ji[],1},MetricOn->All,ContractMetrics->True]];
CollapseJ1=MakeRule[{J[]Ji[],1},MetricOn->All,ContractMetrics->True];
CollapseJ2=MakeRule[{J[]Ji[]^2,Ji[]},MetricOn->All,ContractMetrics->True];
CollapseJ3=MakeRule[{J[]^2Ji[],J[]},MetricOn->All,ContractMetrics->True];
CollapseJ=Join[CollapseJ1,CollapseJ2,CollapseJ3];

JiToJ=MakeRule[{Ji[],1/J[]},MetricOn->All,ContractMetrics->True];
