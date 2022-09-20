(* this file sets aspects for CovD in Global` *)

(* Greek index from 0-4 *)

GaugeCovDSymb="\[GothicCapitalD]";
(*
Catch@UndefCovD@GaugeCovD;
*)
Catch@DefCovD[GaugeCovD[-a],{"~",GaugeCovDSymb},FromMetric->G];

(*this step is necessary since the covariant derivative is not defined by default, forcing xAct to think about an example conversion cauuses the definition to be made*)
Quiet@ChangeCovD[CD[-a]@B[a,-d],CD,GaugeCovD];

(* define the Christoffel to produce the rotational gauge field by default *)
ChristoffelCDGaugeCovD~AutomaticRules~MakeRule[{ChristoffelCDGaugeCovD[a,-b,-c],A[-c,a,-b]},MetricOn->All,ContractMetrics->True];

(* Lorentz index from 0 to 4, but assumed to be formed from the Greek index 1-3 *)

LorentzGaugeCovDSymb=SO3~StringJoin~"\[ScriptCapitalD]";
(*
Catch@UndefCovD@LorentzGaugeCovD;
*)
Catch@DefCovD[LorentzGaugeCovD[-a],{"~",LorentzGaugeCovDSymb},FromMetric->G];

xAct`HiGGS`Private`GaugeCovDToLorentzGaugeCovDRule=Quiet@MakeRule[{G3[-b,a]GaugeCovD[-a]@AnyTensor_,B[c,-b]LorentzGaugeCovD[-c]@AnyTensor},MetricOn->All,ContractMetrics->True];

xAct`HiGGS`Private`LorentzGaugeCovDToGaugeCovDRule=Quiet@MakeRule[{LorentzGaugeCovD[-c]@AnyTensor_,H[-c,b]G3[-b,a]GaugeCovD[-a]@AnyTensor},MetricOn->All,ContractMetrics->True];
