(*===============*)
(*  ToBasicForm  *)
(*===============*)

Options[ToBasicForm]={
	Hard->False,
	ToShell->False,
	TheoryNameOption->""};

ToBasicForm[x_,OptionsPattern[]]:=Module[{
	Theory,
	Expr,
	PrintVariable},

	PrintVariable=PrintTemporary[" ** ToBasicForm..."];

	If[OptionValue[ToShell],Theory=Evaluate@Symbol@OptionValue@TheoryNameOption];

	Expr=x;
	Expr=Expr/.xAct`HiGGS`PhiActivate//NoScalar;
	Expr=Expr/.xAct`HiGGS`ChiParaActivate//NoScalar;
	Expr=Expr/.xAct`HiGGS`ChiPerpActivate//NoScalar;
	Expr=Expr/.xAct`HiGGS`ChiSingActivate//NoScalar;
	Expr//=ToNewCanonical;
	(*Expr=Expr/.xAct`HiGGS`DpRPDeactivate//NoScalar;*)
	(**)
	Expr=Expr/.ExpandLorentzGaugeCovDProjectionRule;(*this is a fast way to eliminate ProjectorGP heads on atomic gradients*)


	Expr=Expr/.xAct`HiGGS`ProjectorGP->ProjectWith@xAct`HiGGS`GP;(*but when the arguments are non-atomic we need this*)
	Expr//=ProjectorToMetric;
	Expr//=ToNewCanonical;

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
	Expr=Expr/.xAct`HiGGS`RLambdaPO3Activate//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.xAct`HiGGS`TLambdaPO3Activate//NoScalar;
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
	If[OptionValue@ToShell,Expr=Expr/.(Evaluate@(Theory@$ToTheory))//NoScalar];
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.xAct`HiGGS`ExpandStrengths//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr=Expr/.xAct`HiGGS`PADMActivate//NoScalar;
	If[OptionValue[Hard],Expr//=ToNewCanonical];
	Expr//=ToNewCanonical;
	Expr=Expr//NoScalar;
	Expr//=ToNewCanonical;
	Expr=Expr//NoScalar;
	NotebookDelete[PrintVariable];
Expr];
