(*=============*)
(*  TotalToO3  *)
(*=============*)

Options[TotalToO3]={ToShell->False};
TotalToO3[x_,OptionsPattern[]]:=Module[{
	Expr,
	PrintVariable,
	Theory},

	If[StringQ@OptionValue@ToShell,Theory=Evaluate@Symbol@OptionValue@ToShell];

	PrintVariable=PrintTemporary[" ** TotalToO3 with ToShell ",OptionValue[ToShell],"..."];
	Expr=x;
	Expr=Expr/.xAct`HiGGS`CDPiToCDPiP;
	Expr=Expr/.xAct`HiGGS`CDPiToCDPiPHard;
	Expr=Expr//NoScalar/.xAct`HiGGS`PiToPiP;
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
