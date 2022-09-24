ToNewCanonical[Expr_]:="ToNewCanonical"~TimeWrapper~Module[{temp,printer},
	printer=PrintTemporary[" ** ToNewCanonical..."];

	(*Beep[];*)
	temp=Expr//ToCanonical;
	temp=Quiet@Check[temp/.GPToFoliG,temp];(*may not be defined yet*)
	temp=temp//ContractMetric;
	temp=temp//ScreenDollarIndices;
	NotebookDelete@printer;
temp];
