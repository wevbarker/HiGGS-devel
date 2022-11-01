(*==================*)
(*  ToNewCanonical  *)
(*==================*)

CrackProjectorGP[Expr_]:=Module[{CrackedExpr},
	If[(Expr~Cases~_Plus)=={},
		CrackedExpr=ProjectorGP@Expr,	
		CrackedExpr=Expr//ProjectWith@GP;
		CrackedExpr//=ToNewCanonical;
		CrackedExpr=CrackedExpr~InducedDecomposition~{GP,V};
		CrackedExpr//=NoScalar;
		CrackedExpr//=ToCanonical;
		CrackedExpr//=ReplaceDummies;
	];
CrackedExpr];

ToNewCanonical[Expr_]:=Module[{temp,printer},
	printer=PrintTemporary[" ** ToNewCanonical..."];

	(*Beep[];*)
	temp=Quiet@Check[ToCanonical@Evaluate@(Expr/.{ProjectorGP->CrackProjectorGP}),Expr//ToCanonical];(*curious error thrown from within ToNesterForm*)
	temp=Quiet@Check[temp/.GPToFoliG,temp];(*may not be defined yet*)
	temp=temp//ContractMetric;
	temp=temp//ScreenDollarIndices;
	NotebookDelete@printer;
temp];
