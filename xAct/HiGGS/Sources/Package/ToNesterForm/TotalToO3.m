(*=============*)
(*  TotalToO3  *)
(*=============*)

Options[TotalToO3]={ToShell->False};
TotalToO3[InputExpr_,OptionsPattern[]]:=Module[{
	Expr=InputExpr,
	PrintVariable,
	Theory},

	If[StringQ@OptionValue@ToShell,Theory=Evaluate@Symbol@OptionValue@ToShell];

	PrintVariable=PrintTemporary[" ** xAct`HiGGS`Private`TotalToO3..."];
	If[StringQ@OptionValue@ToShell,Expr=Expr/.xAct`HiGGS`Private`LambdaPiToShell];
	Expr=Expr/.xAct`HiGGS`CDPiToCDPiP;
	Expr=Expr/.xAct`HiGGS`CDPiToCDPiPHard;
	Expr//=NoScalar;
	Expr=Expr/.xAct`HiGGS`PiToPiP;
	Expr=Expr/.xAct`HiGGS`PiToPiPHard;
	Expr//=ToNewCanonical;
	If[StringQ@OptionValue@ToShell,Expr=Expr/.(Evaluate@(Theory@$TheoryCDPiPToCDPiPO3)),Expr=Expr/.$CDPiPToCDPiPO3];
	Expr//=ToNewCanonical;
	If[StringQ@OptionValue@ToShell,Expr=Expr/.(Evaluate@(Theory@$TheoryPiPToPiPO3)),Expr=Expr/.PiPToPiPO3];
	Expr//=ToNewCanonical;
	Expr=ToO3[Expr,ToShell->OptionValue@ToShell];
	Expr//=ToNewCanonical;
	If[StringQ@OptionValue@ToShell,Expr=Quiet@Check[Expr/.(Evaluate@(Theory@$NesterFormShell)),Expr]];
	Expr//=ToNewCanonical;

	NotebookDelete[PrintVariable];
Expr];
