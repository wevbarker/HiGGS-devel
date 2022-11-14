(*========*)
(*  CovD  *)
(*========*)

(*selects tensor heads which refer to the spin-parity sectors or other acceptable quantities*)
NotGaugeFieldQ[Tensor_]:=!MatchQ[Head@Tensor,_?(StringMatchQ[ToString@Quiet@(SymbolName@#),
("B")|
("A")]&)];

CDToGaugeCovD[Expr_]:=Catch@Module[{ConvertedExpr},
	ConvertedExpr=ChangeCovD[Expr,xAct`HiGGS`CD,xAct`HiGGS`GaugeCovD];
	ConvertedExpr//=ToNewCanonical;
	ConvertedExpr];

GaugeCovDToCD[Expr_]:=Catch@Module[{ConvertedExpr},
	ConvertedExpr=ChangeCovD[Expr,xAct`HiGGS`GaugeCovD,xAct`HiGGS`CD];
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

LorentzGaugeCovDToParaLorentzGaugeCovD[Expr_]:=Catch@Module[{ConvertedExpr},
	ConvertedExpr=Expr/.xAct`HiGGS`Private`LorentzGaugeCovDToParaLorentzGaugeCovDRule;
	ConvertedExpr//=ToNewCanonical;
	ConvertedExpr];

ParaLorentzGaugeCovDToLorentzGaugeCovD[Expr_]:=Catch@Module[{ConvertedExpr},
	ConvertedExpr=Expr/.xAct`HiGGS`Private`ParaLorentzGaugeCovDToLorentzGaugeCovDRule;
	ConvertedExpr//=ToNewCanonical;
	ConvertedExpr];
