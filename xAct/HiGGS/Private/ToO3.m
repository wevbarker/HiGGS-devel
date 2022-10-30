(*========*)
(*  ToO3  *)
(*========*)

Options[ToO3]={ToShell->False};

ToO3[x_,OptionsPattern[]]:=Module[{
	res,
	printer,
	Theory},

	If[StringQ@OptionValue@ToShell,Theory=Evaluate@Symbol@OptionValue@ToShell];
	
	res=x;
	printer=PrintTemporary[" ** ToO3..."];
	res=res//NoScalar/.xAct`HiGGS`PiToPiP;
	res=res/.xAct`HiGGS`PiToPiP;
	res=res//ToNewCanonical;
	If[OptionValue@ToShell,res=res/.(Evaluate@(Theory@$PiPShellToPiPPO3))];
	res=res//ToNewCanonical;
	res=res/.xAct`HiGGS`ToStrengths;
	res=res//ToNewCanonical;
	res=res/.xAct`HiGGS`StrengthDecompose;
	res=res/.xAct`HiGGS`StrengthLambdaDecompose;
	res=res//ToNewCanonical;
	If[OptionValue@ToShell,res=res/.(Evaluate@(Theory@$StrengthPShellToStrengthPO3))];
	res=res/.xAct`HiGGS`StrengthPToStrengthPO3;
	res=res/.xAct`HiGGS`StrengthPerpToStrengthPerpO3;
	res=res/.xAct`HiGGS`StrengthLambdaPToStrengthLambdaPO3;
	res=res/.xAct`HiGGS`StrengthLambdaPerpToStrengthLambdaPerpO3;
	res=res//ToNewCanonical;
	res=res/.PiPToPiPO3;
	res=res//ToNewCanonical;
	NotebookDelete[printer];
res];
