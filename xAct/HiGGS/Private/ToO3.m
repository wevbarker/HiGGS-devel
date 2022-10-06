Options[ToO3]={ToShell->True,OrderOption->Infinity,TheoryNameOption->""};

ToO3[x_,OptionsPattern[]]:=Module[{
	res,
	printer,
	Theory},

	Theory=Evaluate@Symbol@OptionValue@TheoryNameOption;
	
	res=x;
	printer=PrintTemporary[" ** ToO3..."];
	res=res//NoScalar/.PiToPiP;
	res=res/.PiToPiP;
	res=ToOrderCanonical[res,OptionValue[OrderOption]];
	If[OptionValue[ToShell],res=res/.(Evaluate@(Theory@$PiPShellToPiPPO3))];
	res=res//ToNewCanonical;
	res=res/.ToStrengths;
	res=ToOrderCanonical[res,OptionValue[OrderOption]];
	res=res/.StrengthDecompose;
	res=res/.StrengthLambdaDecompose;
	res=res//ToNewCanonical;
	If[OptionValue[ToShell],res=res/.(Evaluate@(Theory@$StrengthPShellToStrengthPO3))];
	res=res/.StrengthPToStrengthPO3;
	res=res/.StrengthPerpToStrengthPerpO3;
	res=res/.StrengthLambdaPToStrengthLambdaPO3;
	res=res/.StrengthLambdaPerpToStrengthLambdaPerpO3;
	res=res//ToNewCanonical;
	res=res/.PiPToPiPO3;
	res=res//ToNewCanonical;
	res=ToOrderCanonical[res,OptionValue[OrderOption]];
	NotebookDelete[printer];
res];
