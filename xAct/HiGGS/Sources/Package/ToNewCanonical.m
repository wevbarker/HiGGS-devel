(*==================*)
(*  ToNewCanonical  *)
(*==================*)

(*----------------------------------------------------------------------------------------------------------------------------------------------------------*)
(*  This began as a convenience wrapper for ScreenDollarIndices@ContractMetric@ToCanonical has been made more complex by the advent of the induced metric   *)
(*----------------------------------------------------------------------------------------------------------------------------------------------------------*)

BuildPackage@"ToNewCanonical/RepairProjectorGP.m";
BuildPackage@"ToNewCanonical/InertProjectorGP.m";
BuildPackage@"ToNewCanonical/ActiveProjectorGP.m";

ToNewCanonical[Expr_]:=Module[{
	CanonicalisedExpr=Expr,
	PrintVariable},

	PrintVariable=PrintTemporary[" ** ToNewCanonical..."];

	(*----------------------------------------------------------------------------*)
	(*  If broken Projectors were passed, first fix them on a case-by-case basis  *)
	(*----------------------------------------------------------------------------*)

	CanonicalisedExpr//=(Evaluate@(#/.{xAct`HiGGS`ProjectorGP->RepairProjectorGP}))&;

	(*----------------------------------------------------*)
	(*  Make induced derivatives inert within Projectors  *)
	(*----------------------------------------------------*)

	CanonicalisedExpr//=(Evaluate@(#/.{xAct`HiGGS`ProjectorGP->InertProjectorGP}))&;

	(*---------------------------------------------------------*)
	(*  Expand all non-inert instances of induced derivatives  *)
	(*---------------------------------------------------------*)

	CanonicalisedExpr//=(Quiet@Check[#/.xAct`HiGGS`GPToFoliG,#])&;

	(*----------------------------*)
	(*  Perform canonicalisation  *)
	(*----------------------------*)

	CanonicalisedExpr//=ToCanonical;
	CanonicalisedExpr//=ContractMetric;

	(*--------------------------------------------------------*)
	(*  Re-activate the induced derivative within Projectors  *)
	(*--------------------------------------------------------*)

	CanonicalisedExpr//=(Evaluate@(#/.{xAct`HiGGS`ProjectorGP->ActiveProjectorGP}))&;

	(*---------------------------------------------------------*)
	(*  If broken Projectors were generated, fix them on exit  *)
	(*---------------------------------------------------------*)

	CanonicalisedExpr//=(Evaluate@(#/.{xAct`HiGGS`ProjectorGP->RepairProjectorGP}))&;

	(*------------------------------------------*)
	(*  Finally, screen to make human-readable  *)
	(*------------------------------------------*)

	CanonicalisedExpr//=ScreenDollarIndices;

	NotebookDelete@PrintVariable;
CanonicalisedExpr];
