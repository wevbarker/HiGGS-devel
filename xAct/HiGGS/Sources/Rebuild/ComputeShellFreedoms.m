(*========================*)
(*  ComputeShellFreedoms  *)
(*========================*)

Begin["xAct`HiGGS`Private`"];
	DefNiceConstantSymbol[ShellPara,ToExpression[#]]&/@ASectorNames;
	DefNiceConstantSymbol[ShellOrig,ToExpression[#]]&/@ASectorNames;
	DefNiceConstantSymbol[ShellPerp,ToExpression[#]]&/@ASectorNames;
	DefNiceConstantSymbol[ShellSing,ToExpression[#]]&/@ASectorNames;
	DefNiceConstantSymbol[ShellPrim,ToExpression[#]]&/@ASectorNames;
	DefNiceConstantSymbol[ShellParaLamb,ToExpression[#]]&/@ASectorNames;
	DefNiceConstantSymbol[ShellPerpLamb,ToExpression[#]]&/@ASectorNames;
	DefNiceConstantSymbol[ShellPara,ToExpression[#]]&/@BSectorNames;
	DefNiceConstantSymbol[ShellOrig,ToExpression[#]]&/@BSectorNames;
	DefNiceConstantSymbol[ShellPerp,ToExpression[#]]&/@BSectorNames;
	DefNiceConstantSymbol[ShellSing,ToExpression[#]]&/@BSectorNames;
	DefNiceConstantSymbol[ShellPrim,ToExpression[#]]&/@BSectorNames;
	DefNiceConstantSymbol[ShellParaLamb,ToExpression[#]]&/@BSectorNames;
	DefNiceConstantSymbol[ShellPerpLamb,ToExpression[#]]&/@BSectorNames;
End[];
