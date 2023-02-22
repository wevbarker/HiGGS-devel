(*========*)
(*  CovD  *)
(*========*)

(*============================================*)
(*  Greek index mu, nu sigma, lambda 0,1,2,3  *)
(*============================================*)

xAct`HiGGS`Private`GaugeCovDSymb="\[GothicCapitalD]";
Catch@DefCovD[GaugeCovD[-a],{"~",xAct`HiGGS`Private`GaugeCovDSymb},FromMetric->G];

(*this step is necessary since the covariant derivative is not defined by default, forcing xAct to think about an example conversion cauuses the definition to be made*)
Quiet@ChangeCovD[CD[-a]@B[a,-d],CD,GaugeCovD];

(* define the Christoffel to produce the rotational gauge field by default *)
ChristoffelCDGaugeCovD~AutomaticRules~MakeRule[{ChristoffelCDGaugeCovD[a,-b,-c],A[-c,a,-b]},MetricOn->All,ContractMetrics->True];

(* something which has the potential to be really quite important is the action of this new covariant derivative on the original gauge fields. We will see below that the functionality of the other kinds of covariant derivative is only provided for derivatives not acting on the gauge fields. However we can extend GaugeCovD to the gauge fields deliberately with some rules *)
(*these rules were removed after they caused a serious problem with PSALTer, during the linearisation of the models. In the long run, PSALTer will be separated out from HiGGS, so these will be re-implemented at that time *)
(*
B~AutomaticRules~MakeRule[{B[a,-b]A[b,-c,-d],0},MetricOn->All,ContractMetrics->True];
(* for good measure, we also use the non-fundamental H *)
H~AutomaticRules~MakeRule[{H[-a,b]A[c,-b,-d],0},MetricOn->All,ContractMetrics->True];
A~AutomaticRules~MakeRule[{A[i,a,-b]A[b,-c,-d],0},MetricOn->All,ContractMetrics->True];
*)
(* these last two steps above have yet to be checked against the calibration on Newton *)

(*===============================================================================================*)
(*  Roman index i, j, k, l 0,1,2,3, assumed to be based on Greek index alpha, beta, gamma 1,2,3  *)
(*===============================================================================================*)

xAct`HiGGS`Private`LorentzGaugeCovDSymb=xAct`HiGGS`Private`SO3~StringJoin~"\[ScriptCapitalD]";
Catch@DefCovD[LorentzGaugeCovD[-a],{"~",xAct`HiGGS`Private`LorentzGaugeCovDSymb},FromMetric->G];

(* laws for transforming between holonomic and anholonomic gauge covariant derivatives *)

xAct`HiGGS`Private`GaugeCovDToLorentzGaugeCovDRule=Quiet@MakeRule[{G3[-b,a]GaugeCovD[-a]@AnyTensor_?xAct`HiGGS`Private`NotGaugeFieldQ,B[c,-b]LorentzGaugeCovD[-c]@AnyTensor},MetricOn->All,ContractMetrics->True];

xAct`HiGGS`Private`LorentzGaugeCovDToGaugeCovDRule=Quiet@MakeRule[{LorentzGaugeCovD[-c]@AnyTensor_?xAct`HiGGS`Private`NotGaugeFieldQ,H[-c,b]G3[-b,a]GaugeCovD[-a]@AnyTensor},MetricOn->All,ContractMetrics->True];

(*=========================================*)
(*  Barred Roman index i, j, k, l 0,1,2,3  *)
(*=========================================*)

(*===============================================================*)
(*  Assumed to be based on Greek index alpha, beta, gamma 1,2,3  *)
(*===============================================================*)

xAct`HiGGS`Private`ParaLorentzGaugeCovDSymb=xAct`HiGGS`Private`SO3~StringJoin~"\!\(\*SuperscriptBox[\[ScriptCapitalD], \(\(\[DoubleVerticalBar]\)\)]\)";
Catch@DefCovD[ParaLorentzGaugeCovD[-a],{"~",xAct`HiGGS`Private`ParaLorentzGaugeCovDSymb},FromMetric->G];

(*====================================================*)
(*  fake derivative, for internal use in LeibnizList  *)
(*====================================================*)

Begin["xAct`HiGGS`Private`"];
Catch@DefCovD[LeibnizListCovD[-a],{"*","LeibnizListCovD"},FromMetric->G];
End[];

(* laws for transforming between holonomic and anholonomic gauge covariant derivatives *)

xAct`HiGGS`Private`LorentzGaugeCovDToParaLorentzGaugeCovDRule=Quiet@MakeRule[{LorentzGaugeCovD[-a]@AnyTensor_?xAct`HiGGS`Private`NotGaugeFieldQ,ParaLorentzGaugeCovD[-a]@AnyTensor+V[-a]V[b]LorentzGaugeCovD[-b]@AnyTensor},MetricOn->All,ContractMetrics->True];

xAct`HiGGS`Private`ParaLorentzGaugeCovDToLorentzGaugeCovDRule=Quiet@MakeRule[{ParaLorentzGaugeCovD[-a]@AnyTensor_?xAct`HiGGS`Private`NotGaugeFieldQ,LorentzGaugeCovD[-a]@AnyTensor-V[-a]V[b]LorentzGaugeCovD[-b]@AnyTensor},MetricOn->All,ContractMetrics->True];

AutomaticRules[V,Quiet@MakeRule[{V[a]ParaLorentzGaugeCovD[-a]@AnyTensor_?xAct`HiGGS`Private`NotGaugeFieldQ,0},MetricOn->All,ContractMetrics->True]];

(*=====================================================================*)
(*  tensors and rules for shielding CD on gauge fields from GaugeCovD  *)
(*=====================================================================*)

DefTensor[xAct`HiGGS`Private`CDB[-a, b, -c], M4];
DefTensor[xAct`HiGGS`Private`CDA[-a, b, c, -d], M4, Antisymmetric[{b, c}]];

xAct`HiGGS`Private`CDGaugeFieldsToInert=(MakeRule[{CD[-a]@B[b,-c],xAct`HiGGS`Private`CDB[-a,b,-c]},MetricOn->All,ContractMetrics->True])~Join~(MakeRule[{CD[-a]@A[b,c,-d],xAct`HiGGS`Private`CDA[-a,b,c,-d]},MetricOn->All,ContractMetrics->True]);

xAct`HiGGS`Private`CDGaugeFieldsFromInert=(MakeRule[{xAct`HiGGS`Private`CDB[-a,b,-c],CD[-a]@B[b,-c]},MetricOn->All,ContractMetrics->True])~Join~(MakeRule[{xAct`HiGGS`Private`CDA[-a,b,c,-d],CD[-a]@A[b,c,-d]},MetricOn->All,ContractMetrics->True]);
