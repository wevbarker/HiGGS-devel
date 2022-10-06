(* provides ToBasicForm function *)

Options[ToBasicForm]={
	Hard->False,
	OrderOption->Infinity};

ToBasicForm[x_,OptionsPattern[]]:=Module[{
	Expr,
	PrintVariable},

	PrintVariable=PrintTemporary[" ** ToBasicForm..."];

	Expr=x;
	Expr=Expr/.xAct`HiGGS`PhiActivate//NoScalar;
	Expr=Expr/.xAct`HiGGS`ChiParaActivate//NoScalar;
	Expr=Expr/.xAct`HiGGS`ChiPerpActivate//NoScalar;
	Expr=Expr/.xAct`HiGGS`ChiSingActivate//NoScalar;
	Expr=xAct`HiGGS`ToOrderCanonical[Expr,OptionValue[OrderOption]];
	(*Expr=Expr/.xAct`HiGGS`DpRPDeactivate//NoScalar;*)
	(**)
	Expr=Expr/.ExpandLorentzGaugeCovDProjectionRule;
	Expr//=LorentzGaugeCovDToGaugeCovD;
	Expr//=GaugeCovDToCD;
	(**)
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	(*Expr=Expr/.xAct`HiGGS`DRPDeactivate//NoScalar;*)
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.xAct`HiGGS`RPO3Activate//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.xAct`HiGGS`TPO3Activate//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.xAct`HiGGS`StrengthPToStrength//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.xAct`HiGGS`StrengthLambdaPToStrengthLambda//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	(*Expr=Expr/.xAct`HiGGS`DpPiPDeactivate//NoScalar;*)
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	(*Expr=Expr/.xAct`HiGGS`DPiPDeactivate//NoScalar;*)
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.xAct`HiGGS`PiPO3Activate//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.xAct`HiGGS`PO3PiActivate//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.xAct`HiGGS`PADMPiActivate//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.xAct`HiGGS`PiPToPi//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.xAct`HiGGS`PhiActivate//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.xAct`HiGGS`$ToTheory//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.xAct`HiGGS`ExpandStrengths//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.xAct`HiGGS`PADMActivate//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=xAct`HiGGS`ToOrderCanonical[Expr,OptionValue[OrderOption]];
	Expr=Expr//NoScalar;
	Expr//=ToNewCanonical;
	Expr=Expr//NoScalar;
	NotebookDelete[PrintVariable];
Expr];
