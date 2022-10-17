(*=========================*)
(*  Covariant derivatives  *)
(*=========================*)

(*============================================*)
(*  Greek index mu, nu sigma, lambda 0,1,2,3  *)
(*============================================*)

xAct`HiGGS`Private`GaugeCovDSymb="\[GothicCapitalD]";
Catch@DefCovD[GaugeCovD[-a],{"~",xAct`HiGGS`Private`GaugeCovDSymb},FromMetric->G];

(*this step is necessary since the covariant derivative is not defined by default, forcing xAct to think about an example conversion cauuses the definition to be made*)
Quiet@ChangeCovD[CD[-a]@B[a,-d],CD,GaugeCovD];

(* define the Christoffel to produce the rotational gauge field by default *)
ChristoffelCDGaugeCovD~AutomaticRules~MakeRule[{ChristoffelCDGaugeCovD[a,-b,-c],A[-c,a,-b]},MetricOn->All,ContractMetrics->True];

(*===============================================================================================*)
(*  Roman index i, j, k, l 0,1,2,3, assumed to be based on Greek index alpha, beta, gamma 1,2,3  *)
(*===============================================================================================*)

xAct`HiGGS`Private`LorentzGaugeCovDSymb=xAct`HiGGS`Private`SO3~StringJoin~"\[ScriptCapitalD]";
Catch@DefCovD[LorentzGaugeCovD[-a],{"~",xAct`HiGGS`Private`LorentzGaugeCovDSymb},FromMetric->G];

(* laws for transforming between holonomic and anholonomic gauge covariant derivatives *)

xAct`HiGGS`Private`GaugeCovDToLorentzGaugeCovDRule=Quiet@MakeRule[{G3[-b,a]GaugeCovD[-a]@AnyTensor_?xAct`HiGGS`Private`NotGaugeFieldQ,B[c,-b]LorentzGaugeCovD[-c]@AnyTensor},MetricOn->All,ContractMetrics->True];

xAct`HiGGS`Private`LorentzGaugeCovDToGaugeCovDRule=Quiet@MakeRule[{LorentzGaugeCovD[-c]@AnyTensor_?xAct`HiGGS`Private`NotGaugeFieldQ,H[-c,b]G3[-b,a]GaugeCovD[-a]@AnyTensor},MetricOn->All,ContractMetrics->True];

(*======================================================================================================*)
(*  Barred Roman index i, j, k, l 0,1,2,3, assumed to be based on Greek index alpha, beta, gamma 1,2,3  *)
(*======================================================================================================*)

xAct`HiGGS`Private`ParaLorentzGaugeCovDSymb=xAct`HiGGS`Private`SO3~StringJoin~"\!\(\*SuperscriptBox[\[ScriptCapitalD], \(\(\[DoubleVerticalBar]\)\)]\)";
Catch@DefCovD[ParaLorentzGaugeCovD[-a],{"~",xAct`HiGGS`Private`ParaLorentzGaugeCovDSymb},FromMetric->G];

(* laws for transforming between holonomic and anholonomic gauge covariant derivatives *)

xAct`HiGGS`Private`LorentzGaugeCovDToParaLorentzGaugeCovDRule=Quiet@MakeRule[{LorentzGaugeCovD[-a]@AnyTensor_?xAct`HiGGS`Private`NotGaugeFieldQ,ParaLorentzGaugeCovD[-a]@AnyTensor+V[-a]V[b]LorentzGaugeCovD[-b]@AnyTensor},MetricOn->All,ContractMetrics->True];

xAct`HiGGS`Private`ParaLorentzGaugeCovDToLorentzGaugeCovDRule=Quiet@MakeRule[{ParaLorentzGaugeCovD[-a]@AnyTensor_?xAct`HiGGS`Private`NotGaugeFieldQ,LorentzGaugeCovD[-a]@AnyTensor-V[-a]V[b]LorentzGaugeCovD[-b]@AnyTensor},MetricOn->All,ContractMetrics->True];

AutomaticRules[V,MakeRule[{V[a]ParaLorentzGaugeCovD[-a]@AnyTensor_?xAct`HiGGS`Private`NotGaugeFieldQ,0},MetricOn->All,ContractMetrics->True]];

(*=====================================================================*)
(*  tensors and rules for shielding CD on gauge fields from GaugeCovD  *)
(*=====================================================================*)

DefTensor[xAct`HiGGS`Private`CDB[-a, b, -c], M4];
DefTensor[xAct`HiGGS`Private`CDA[-a, b, c, -d], M4, Antisymmetric[{b, c}]];

xAct`HiGGS`Private`CDGaugeFieldsToInert=(MakeRule[{CD[-a]@B[b,-c],xAct`HiGGS`Private`CDB[-a,b,-c]},MetricOn->All,ContractMetrics->True])~Join~(MakeRule[{CD[-a]@A[b,c,-d],xAct`HiGGS`Private`CDA[-a,b,c,-d]},MetricOn->All,ContractMetrics->True]);

xAct`HiGGS`Private`CDGaugeFieldsFromInert=(MakeRule[{xAct`HiGGS`Private`CDB[-a,b,-c],CD[-a]@B[b,-c]},MetricOn->All,ContractMetrics->True])~Join~(MakeRule[{xAct`HiGGS`Private`CDA[-a,b,c,-d],CD[-a]@A[b,c,-d]},MetricOn->All,ContractMetrics->True]);
