(*==================*)
(*  ToNewCanonical  *)
(*==================*)

(*----------------------------------------------------------------------------------------------------------------------------------------------------------*)
(*  This began as a convenience wrapper for ScreenDollarIndices@ContractMetric@ToCanonical has been made more complex by the advent of the induced metric   *)
(*----------------------------------------------------------------------------------------------------------------------------------------------------------*)

(*----------------------------------------------------------------------------------------------------------------------------*)
(*  Summands within Projector heads (e.g. from expansion of the induced metric) can throw an exception upon canonicalisation  *)
(*----------------------------------------------------------------------------------------------------------------------------*)

RepairProjectorGP[Expr_]:=Module[{RepairedExpr},
	If[(Expr~Cases~_Plus)=={},

		(*---------------------------------------------------------*)
		(*  In most cases, we expect the argument not to be a sum  *)
		(*---------------------------------------------------------*)

		RepairedExpr=xAct`HiGGS`ProjectorGP@Expr,	

		(*------------------------------------------------------------*)
		(*  Otherwise, we re-decompose the argument and pass it back  *)
		(*------------------------------------------------------------*)

		RepairedExpr=Expr//ProjectWith@xAct`HiGGS`GP;
		RepairedExpr//=ToNewCanonical;
		RepairedExpr//=ContractMetric;
		RepairedExpr//=ScreenDollarIndices;
		RepairedExpr=RepairedExpr~InducedDecomposition~{xAct`HiGGS`GP,xAct`HiGGS`V};
		RepairedExpr//=NoScalar;
		RepairedExpr//=ToCanonical;

		(*-------------------------------------------------------------------*)
		(*  Before passing back, newly-generated dummies must be made safe   *)
		(*-------------------------------------------------------------------*)

		RepairedExpr//=ReplaceDummies;
	];
RepairedExpr];

(*--------------------------------------------------------------------------------*)
(*  To reduce the chance of this happening, we must render GP inert within heads  *)
(*--------------------------------------------------------------------------------*)

InertProjectorGP[Expr_]:=Module[{InertExpr=Expr},
		InertExpr=InertExpr/.{xAct`HiGGS`GP->xAct`HiGGS`FoliG};
		InertExpr//=xAct`HiGGS`ProjectorGP;
InertExpr];

ActiveProjectorGP[Expr_]:=Module[{ActiveExpr=Expr},
		ActiveExpr=InertExpr/.{xAct`HiGGS`FoliG->xAct`HiGGS`GP};
		ActiveExpr//=xAct`HiGGS`ProjectorGP;
ActiveExpr];

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
