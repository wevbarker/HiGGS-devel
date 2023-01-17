(*===================*)
(*  BracketSimplify  *)
(*===================*)

(*--------------------------------------------------------------------------------*)
(*  A function to provide some final tidying after ToNesterForm has been applied  *)
(*--------------------------------------------------------------------------------*)

BracketSimplify[Expr_]:=Module[{Simplified=Expr,PrintVariable},

	PrintVariable=PrintTemporary@" ** xAct`HiGGS`Private`BracketSimplify...";

	Simplified=Simplified/.{xAct`HiGGS`FoliG->xAct`HiGGS`GP};
	Simplified//=ToNewCanonical;
	Simplified=Simplified/.xAct`HiGGS`ProjectorGP->ProjectWith[xAct`HiGGS`GP];
	Simplified//=ToNewCanonical;
	Simplified=Simplified/.FullyProjectSmearingFunctionsRule;
	Simplified//=ToNewCanonical;
	Simplified=Simplified/.FullyProjectParaLorentzGaugeCovDRule;
	Simplified//=ToNewCanonical;
	Simplified//=CollectTensors;
	Simplified//=ScreenDollarIndices;	(*I believe this is made necessary by CollectTensors, which can introduce dummies?*)
	Simplified//=Simplify;

	NotebookDelete@PrintVariable;
Simplified];
