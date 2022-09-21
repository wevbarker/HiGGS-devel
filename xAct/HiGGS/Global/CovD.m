(* this file sets aspects for CovD in Global` *)

(* Greek index from 0-4 *)

GaugeCovDSymb="\[GothicCapitalD]";
Catch@DefCovD[GaugeCovD[-a],{"~",GaugeCovDSymb},FromMetric->G];
ClearBuild[];

(*this step is necessary since the covariant derivative is not defined by default, forcing xAct to think about an example conversion cauuses the definition to be made*)
Quiet@ChangeCovD[CD[-a]@B[a,-d],CD,GaugeCovD];

(* define the Christoffel to produce the rotational gauge field by default *)
ChristoffelCDGaugeCovD~AutomaticRules~MakeRule[{ChristoffelCDGaugeCovD[a,-b,-c],A[-c,a,-b]},MetricOn->All,ContractMetrics->True];

(* Lorentz index from 0 to 4, but assumed to be formed from the Greek index 1-3 *)

LorentzGaugeCovDSymb=SO3~StringJoin~"\[ScriptCapitalD]";
Catch@DefCovD[LorentzGaugeCovD[-a],{"~",LorentzGaugeCovDSymb},FromMetric->G];

(* laws for transforming between holonomic and anholonomic gauge covariant derivatives *)

xAct`HiGGS`Private`GaugeCovDToLorentzGaugeCovDRule=Quiet@MakeRule[{G3[-b,a]GaugeCovD[-a]@AnyTensor_?xAct`HiGGS`Private`NotGaugeFieldQ,B[c,-b]LorentzGaugeCovD[-c]@AnyTensor},MetricOn->All,ContractMetrics->True];

xAct`HiGGS`Private`LorentzGaugeCovDToGaugeCovDRule=Quiet@MakeRule[{LorentzGaugeCovD[-c]@AnyTensor_?xAct`HiGGS`Private`NotGaugeFieldQ,H[-c,b]G3[-b,a]GaugeCovD[-a]@AnyTensor},MetricOn->All,ContractMetrics->True];

(* tensors and rules for shielding CD on gauge fields from GaugeCovD *)

DefTensor[xAct`HiGGS`Private`CDB[-a, b, -c], M4];
DefTensor[xAct`HiGGS`Private`CDA[-a, b, c, -d], M4, Antisymmetric[{b, c}]];

xAct`HiGGS`Private`CDGaugeFieldsToInert=(MakeRule[{CD[-a]@B[b,-c],xAct`HiGGS`Private`CDB[-a,b,-c]},MetricOn->All,ContractMetrics->True])~Join~(MakeRule[{CD[-a]@A[b,c,-d],xAct`HiGGS`Private`CDA[-a,b,c,-d]},MetricOn->All,ContractMetrics->True]);

xAct`HiGGS`Private`CDGaugeFieldsFromInert=(MakeRule[{xAct`HiGGS`Private`CDB[-a,b,-c],CD[-a]@B[b,-c]},MetricOn->All,ContractMetrics->True])~Join~(MakeRule[{xAct`HiGGS`Private`CDA[-a,b,c,-d],CD[-a]@A[b,c,-d]},MetricOn->All,ContractMetrics->True]);
