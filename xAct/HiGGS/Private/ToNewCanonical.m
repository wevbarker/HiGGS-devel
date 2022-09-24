GPToFoliG={DummyReplacementVariable->0};

ToNewCanonical[Expr_]:="ToNewCanonical"~TimeWrapper~Module[{temp,printer},
	printer=PrintTemporary[" ** ToNewCanonical..."];

	(*Beep[];*)
	temp=Expr//ToCanonical;
	temp=temp/.GPToFoliG;
	temp=temp//ContractMetric;
	temp=temp//ScreenDollarIndices;
	NotebookDelete@printer;
temp];
