(*========================*)
(*  CDToLorentzGaugeCovD  *)
(*========================*)

CDToLorentzGaugeCovD[InputExpr_]:=Module[{Expr=InputExpr,PrintVariable},
	PrintVariable=PrintTemporary[" ** xAct`HiGGS`Private`CDToLorentzGaugeCovD..."];

	Expr=Expr/.xAct`HiGGS`Private`CDGaugeFieldsToInert;
	Expr//=xAct`HiGGS`Private`CDToGaugeCovD;
	Expr=Expr/.xAct`HiGGS`Private`CDGaugeFieldsFromInert;

	(*
	Expr//=xAct`HiGGS`Private`GaugeCovDToLorentzGaugeCovD;
	Expr=Expr/.xAct`HiGGS`ProjectorGP->ProjectWith@xAct`HiGGS`GP;
	Expr=Expr/.xAct`HiGGS`Private`ProjectLorentzGaugeCovDRule;
	*)

	(*this line replaces the comments above, and should be an analogue to previous implementation without derivatives*)
	Expr=Expr/.xAct`HiGGS`Private`ProjectGaugeCovDRule;

	Expr=Expr/.xAct`HiGGS`Private`ProjectedLorentzGaugeCovDVExpand;
	Expr//=ToNewCanonical;

	Expr=Expr/.xAct`HiGGS`Private`ProjectedParaLorentzGaugeCovDVExpand;
	Expr//=ToNewCanonical;

	(*this line to catch some stragglers*)
	Expr//=xAct`HiGGS`Private`LorentzGaugeCovDToParaLorentzGaugeCovD;
	Expr//=ToNewCanonical;


	Expr=Expr/.xAct`HiGGS`epsilonGVToEps;
	Expr=Expr/.xAct`HiGGS`epsilonGToEpsV;
	Expr//=ToNewCanonical;

	NotebookDelete[PrintVariable];
Expr];
