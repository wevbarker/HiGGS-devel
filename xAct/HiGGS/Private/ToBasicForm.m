(* provides ToBasicForm function *)

Options[ToBasicForm]={
	Hard->False,
	Order->Infinity};

ToBasicForm[x_,OptionsPattern[]]:=Module[{
	Expr,
	PrintVariable},

	PrintVariable=PrintTemporary[" ** ToBasicForm..."];

	Expr=x;
	Expr=Expr/.Global`PhiActivate//NoScalar;
	Expr=Expr/.Global`ChiParaActivate//NoScalar;
	Expr=Expr/.Global`ChiPerpActivate//NoScalar;
	Expr=Expr/.Global`ChiSingActivate//NoScalar;
	Expr=Global`ToOrderCanonical[Expr,OptionValue[Order]];
	(*Expr=Expr/.Global`DpRPDeactivate//NoScalar;*)
	(**)
	Expr=Expr/.ExpandLorentzGaugeCovDProjectionRule;
	Expr//=LorentzGaugeCovDToGaugeCovD;
	Expr//=GaugeCovDToCD;
	(**)
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	(*Expr=Expr/.Global`DRPDeactivate//NoScalar;*)
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.Global`RPO3Activate//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.Global`TPO3Activate//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.Global`StrengthPToStrength//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.Global`StrengthLambdaPToStrengthLambda//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	(*Expr=Expr/.Global`DpPiPDeactivate//NoScalar;*)
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	(*Expr=Expr/.Global`DPiPDeactivate//NoScalar;*)
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.Global`PiPO3Activate//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.Global`PO3PiActivate//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.Global`PADMPiActivate//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.Global`PiPToPi//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.Global`PhiActivate//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.Global`$ToTheory//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.Global`ExpandStrengths//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.Global`PADMActivate//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Global`ToOrderCanonical[Expr,OptionValue[Order]];
	Expr=Expr//NoScalar;
	Expr//=ToNewCanonical;
	Expr=Expr//NoScalar;
	NotebookDelete[PrintVariable];
Expr];
