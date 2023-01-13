(*================================*)
(*  ActivateGeneralO3Projections  *)
(*================================*)

ActivateGeneralO3Projections[InputExpr_]:=Module[{Expr=InputExpr},
	Expr//=ToCanonical;
	Expr//=ContractMetric;
	(*formerly PActivate here*)
	Expr=Expr/.PADMActivate;
	Expr//=ToCanonical;
	Expr//=ContractMetric;
	Expr=Expr/.PADMPiActivate;
	Expr//=ToCanonical;
	Expr//=ContractMetric;
	Expr=Expr/.PO3PiActivate;
	Expr//=ToCanonical;
	Expr//=ContractMetric;
	Expr=Expr/.PActivate;
	Expr//=ToCanonical;
	Expr//=ContractMetric;
	(*removed HG3BExpandLazy*)
	Expr=Expr/.HG3BExpand;
	Expr//=ToCanonical;
	Expr//=ContractMetric;
	Expr//=CollectTensors;
Expr];
