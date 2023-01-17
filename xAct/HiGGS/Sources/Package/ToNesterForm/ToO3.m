(*========*)
(*  ToO3  *)
(*========*)

Options[ToO3]={ToShell->False};
ToO3[InputExpr_,OptionsPattern[]]:=Module[{
	Expr=InputExpr,
	PrintVariable,
	Theory},

	If[StringQ@OptionValue@ToShell,Theory=Evaluate@Symbol@OptionValue@ToShell];
	
	PrintVariable=PrintTemporary[" ** xAct`HiGGS`Private`ToO3..."];
	Expr=Expr//NoScalar/.xAct`HiGGS`PiToPiP;
	Expr=Expr/.xAct`HiGGS`PiToPiP;
	Expr=Expr//ToNewCanonical;
	If[StringQ@OptionValue@ToShell,Expr=Expr/.(Evaluate@(Theory@$PiPShellToPiPPO3))];
	Expr=Expr//ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`ToStrengths;
	Expr=Expr//ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`StrengthDecompose;
	Expr=Expr/.xAct`HiGGS`StrengthLambdaDecompose;
	Expr=Expr/.xAct`HiGGS`StrengthLambdaPiDecompose;
	Expr=Expr//ToNewCanonical;
	If[StringQ@OptionValue@ToShell,Expr=Expr/.(Evaluate@(Theory@$StrengthPShellToStrengthPO3))];
	Expr=Expr/.xAct`HiGGS`StrengthPToStrengthPO3;
	Expr=Expr/.xAct`HiGGS`StrengthPerpToStrengthPerpO3;
	Expr=Expr/.xAct`HiGGS`StrengthLambdaPToStrengthLambdaPO3;
	Expr=Expr/.xAct`HiGGS`StrengthLambdaPiPToStrengthLambdaPiPO3;
	Expr=Expr/.xAct`HiGGS`StrengthLambdaPerpToStrengthLambdaPerpO3;
	Expr=Expr/.xAct`HiGGS`StrengthLambdaPiPerpToStrengthLambdaPiPerpO3;
	Expr=Expr//ToNewCanonical;
	Expr=Expr/.PiPToPiPO3;
	Expr=Expr//ToNewCanonical;
	NotebookDelete[PrintVariable];
Expr];
