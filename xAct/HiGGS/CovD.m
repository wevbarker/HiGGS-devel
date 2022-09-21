(* This file defines rules to exchange the gauge covariant derivative(s) *)

(*selects tensor heads which refer to the spin-parity sectors*)
NotGaugeFieldQ[Tensor_]:=!MatchQ[Head@Tensor,_?(StringMatchQ[SymbolName@#,
("B")|
("A")]&)];

CDToGaugeCovD[Expr_]:=Catch@Module[{ConvertedExpr},
	ConvertedExpr=ChangeCovD[Expr,Global`CD,Global`GaugeCovD];
	ConvertedExpr//=ToNewCanonical;
	ConvertedExpr];

GaugeCovDToCD[Expr_]:=Catch@Module[{ConvertedExpr},
	ConvertedExpr=ChangeCovD[Expr,Global`GaugeCovD,Global`CD];
	ConvertedExpr//=ToNewCanonical;
	ConvertedExpr];

GaugeCovDToLorentzGaugeCovD[Expr_]:=Catch@Module[{ConvertedExpr},
	ConvertedExpr=Expr/.xAct`HiGGS`Private`GaugeCovDToLorentzGaugeCovDRule;
	ConvertedExpr//=ToNewCanonical;
	ConvertedExpr];

LorentzGaugeCovDToGaugeCovD[Expr_]:=Catch@Module[{ConvertedExpr},
	ConvertedExpr=Expr/.xAct`HiGGS`Private`LorentzGaugeCovDToGaugeCovDRule;
	ConvertedExpr//=ToNewCanonical;
	ConvertedExpr];
